<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*, com.crm.DBConnection" %>

<%
String user = (String) session.getAttribute("userEmail");

if(user == null){

    response.sendRedirect("login.jsp");

    return;
}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>View Clients</title>

<!-- GOOGLE FONT -->

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<!-- FONT AWESOME -->

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

<!-- CSS -->

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/themes.css">
<link rel="stylesheet" href="css/dashboard.css">
<link rel="stylesheet" href="css/responsive.css">

</head>

<body class="dark">

<!-- BACKGROUND -->

<div class="bg-light-one"></div>
<div class="bg-light-two"></div>

<!-- DASHBOARD -->

<div class="dashboard-container">

    <!-- SIDEBAR -->

    <div class="sidebar">

        <div class="sidebar-logo">

            <i class="fa-solid fa-chart-line"></i>

            <span>Premium CRM</span>

        </div>

        <!-- MENU -->

        <ul class="sidebar-menu">

            <li onclick="window.location.href='dashboard.jsp'">

                <i class="fa-solid fa-house"></i>

                Dashboard

            </li>

            <li onclick="window.location.href='addClient.jsp'">

                <i class="fa-solid fa-user-plus"></i>

                Add Client

            </li>

            <li class="active">

                <i class="fa-solid fa-users"></i>

                View Clients

            </li>

            <li onclick="window.location.href='LogoutServlet'">

                <i class="fa-solid fa-right-from-bracket"></i>

                Logout

            </li>

        </ul>

    </div>

    <!-- MAIN CONTENT -->

    <div class="main-content">

        <!-- TOP NAVBAR -->

        <div class="top-navbar">

            <div>

                <h2 class="dashboard-title">
                    Clients
                </h2>

                <p class="dashboard-subtitle">
                    Manage and monitor all client records.
                </p>

            </div>

            <!-- THEME -->

            <select id="themeSwitcher">

                <option value="dark">🌌 Dark</option>

                <option value="light">🤍 Light</option>

                <option value="gold">🖤 Gold</option>

            </select>

        </div>

        <!-- STATS -->

        <div class="stats-grid">

            <!-- CARD -->

            <div class="stat-card card-purple">

                <div class="card-icon">
                    <i class="fa-solid fa-users"></i>
                </div>

                <div class="card-info">

                    <h4>Total Clients</h4>

                    <%
                    Connection totalCon = DBConnection.getConnection();

                    PreparedStatement totalPs =
                    totalCon.prepareStatement(
                    "SELECT COUNT(*) FROM clients");

                    ResultSet totalRs =
                    totalPs.executeQuery();

                    int totalClients = 0;

                    if(totalRs.next()){

                        totalClients =
                        totalRs.getInt(1);
                    }
                    %>

                    <h2>
                        <%= totalClients %>
                    </h2>

                    <p>
                        Registered clients
                    </p>

                </div>

            </div>

            <!-- CARD -->

            <div class="stat-card card-cyan">

                <div class="card-icon">
                    <i class="fa-solid fa-building"></i>
                </div>

                <div class="card-info">

                    <h4>Companies</h4>

                    <h2>
                        24
                    </h2>

                    <p>
                        Business organizations
                    </p>

                </div>

            </div>

            <!-- CARD -->

            <div class="stat-card card-gold">

                <div class="card-icon">
                    <i class="fa-solid fa-chart-line"></i>
                </div>

                <div class="card-info">

                    <h4>Growth</h4>

                    <h2>
                        +18%
                    </h2>

                    <p>
                        Monthly increase
                    </p>

                </div>

            </div>

        </div>

        <!-- CLIENT TABLE -->

        <div class="table-box">

            <!-- HEADER -->

            <div class="top-navbar"
                 style="margin-bottom:25px;">

                <h3>
                    Client Records
                </h3>

                <a href="addClient.jsp"
                   class="search-btn"
                   style="text-decoration:none;
                          display:flex;
                          align-items:center;
                          justify-content:center;">

                    <i class="fa-solid fa-plus"></i>

                    &nbsp; Add Client

                </a>

            </div>

            <!-- SUCCESS -->

            <%
            String msg =
            request.getParameter("msg");

            if("success".equals(msg)){
            	
            	if("updated".equals(msg)) {
            		%>

            		<div class="mini-tag"
            		     style="margin-bottom:20px;">

            		    Client Updated Successfully ✨

            		</div>

            		<%
            		}
            %>

            <div class="mini-tag"
                 style="margin-bottom:20px;">

                Client Added Successfully ✅

            </div>

            <%
            }
            %>

            <!-- SEARCH -->

            <form method="get"
                  action="viewClients.jsp"
                  class="search-form">

                <input type="text"
                       name="search"
                       class="search-input"
                       placeholder="Search clients..."
                       value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">

                <button class="search-btn">

                    <i class="fa-solid fa-magnifying-glass"></i>

                    Search

                </button>

            </form>

            <!-- TABLE -->

            <table class="crm-table">

                <thead>

                    <tr>

                        <th>Name</th>

                        <th>Email</th>

                        <th>Phone</th>

                        <th>Company</th>
                        
                        <th>Status</th>

                        <th>Actions</th>

                    </tr>

                </thead>

                <tbody>

                <%

                String search =
                request.getParameter("search");

                Connection con =
                DBConnection.getConnection();

                PreparedStatement ps;
                
                /* PAGINATION */

                int pageSize = 5;

                int pageNumber = 1;

                if(request.getParameter("page") != null){

                    pageNumber =
                    Integer.parseInt(
                    request.getParameter("page"));
                }

                int start =
                (pageNumber - 1) * pageSize;

                if(search != null &&
                   !search.trim().isEmpty()){

                    ps = con.prepareStatement(

                    		"SELECT * FROM clients WHERE name LIKE ? OR email LIKE ? LIMIT ?, ?"

                    );

                    ps.setString(1,
                    "%" + search + "%");

                    ps.setString(2,
                    "%" + search + "%");
                    
                    ps.setInt(3, start);

                    ps.setInt(4, pageSize);

                }else{

                	ps = con.prepareStatement(
                			"SELECT * FROM clients LIMIT ?, ?"
                			);

                			ps.setInt(1, start);

                			ps.setInt(2, pageSize);
                }

                ResultSet rs =
                ps.executeQuery();

                while(rs.next()){
                %>

                    <tr>

                        <td>
                            <%= rs.getString("name") %>
                        </td>

                        <td>
                            <%= rs.getString("email") %>
                        </td>

                        <td>
                            <%= rs.getString("phone") %>
                        </td>

                        <td>
                            <%= rs.getString("company") %>
                            
                            
                        </td>
                        
                        
                        
							<td>

<%
String[] statuses = {
"Active",
"Pending",
"Inactive"
};

String status =
statuses[
(int)(Math.random()*3)
];
%>

<span class="status-badge
<%= status.toLowerCase() %>">

    <%= status %>

</span>

</td>
                        <!-- ACTIONS -->

                        <td>

                            <!-- EDIT -->

                            <a href="editClient.jsp?id=<%= rs.getInt("id") %>">

                                <button class="table-btn edit-btn"
                                        type="button">

                                    <i class="fa-solid fa-pen"></i>

                                </button>

                            </a>

                            <!-- DELETE -->

                            <a href="DeleteClientServlet?id=<%= rs.getInt("id") %>"
                               onclick="return confirm('Delete this client?')">

                                <button class="table-btn delete-btn"
                                        type="button">

                                    <i class="fa-solid fa-trash"></i>

                                </button>

                            </a>

                        </td>

                    </tr>

                <%
                }
                %>

                </tbody>

            </table>

<!-- PAGINATION -->

<div style="display:flex;
            justify-content:center;
            gap:15px;
            margin-top:30px;">

    <!-- PREVIOUS -->

    <% if(pageNumber > 1){ %>

    <a href="viewClients.jsp?page=<%= pageNumber - 1 %>"
       class="search-btn"
       style="text-decoration:none;
              display:flex;
              align-items:center;">

        Previous

    </a>

    <% } %>

    <!-- CURRENT PAGE -->

    <div class="mini-tag">

        Page <%= pageNumber %>

    </div>

    <!-- NEXT -->

    <a href="viewClients.jsp?page=<%= pageNumber + 1 %>"
       class="search-btn"
       style="text-decoration:none;
              display:flex;
              align-items:center;">

        Next

    </a>

</div>

        </div>

    </div>

</div>

<!-- JS -->

<script src="js/theme.js"></script>

</body>

</html>