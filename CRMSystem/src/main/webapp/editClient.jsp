<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*, com.crm.DBConnection" %>

<%
String user =
(String) session.getAttribute("userEmail");

if(user == null){

    response.sendRedirect("login.jsp");

    return;
}

int id =
Integer.parseInt(
request.getParameter("id"));

Connection con =
DBConnection.getConnection();

PreparedStatement ps =
con.prepareStatement(
"SELECT * FROM clients WHERE id=?"
);

ps.setInt(1, id);

ResultSet rs =
ps.executeQuery();

String name = "";
String email = "";
String phone = "";
String company = "";

if(rs.next()){

    name = rs.getString("name");

    email = rs.getString("email");

    phone = rs.getString("phone");

    company = rs.getString("company");
}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Edit Client</title>

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

                <i class="fa-solid fa-pen"></i>

                Edit Client

            </li>

            <li onclick="window.location.href='viewClients.jsp'">

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

        <!-- TOP -->

        <div class="top-navbar">

            <div>

                <h2 class="dashboard-title">
                    Edit Client
                </h2>

                <p class="dashboard-subtitle">
                    Update client information.
                </p>

            </div>

            <!-- THEME -->

            <select id="themeSwitcher">

                <option value="dark">🌌 Dark</option>

                <option value="light">🤍 Light</option>

                <option value="gold">🖤 Gold</option>

            </select>

        </div>

        <!-- FORM -->

        <div class="table-box">

            <form action="UpdateClientServlet"
                  method="post">

                <!-- ID -->

                <input type="hidden"
                       name="id"
                       value="<%= id %>">

                <!-- NAME -->

                <div class="input-group">

                    <label>Client Name</label>

                    <div class="input-box">

                        <i class="fa-solid fa-user"></i>

                        <input type="text"
                               name="name"
                               class="input-field"
                               value="<%= name %>"
                               required>

                    </div>

                </div>

                <!-- EMAIL -->

                <div class="input-group">

                    <label>Email Address</label>

                    <div class="input-box">

                        <i class="fa-solid fa-envelope"></i>

                        <input type="email"
                               name="email"
                               class="input-field"
                               value="<%= email %>"
                               required>

                    </div>

                </div>

                <!-- PHONE -->

                <div class="input-group">

                    <label>Phone Number</label>

                    <div class="input-box">

                        <i class="fa-solid fa-phone"></i>

                        <input type="text"
                               name="phone"
                               class="input-field"
                               value="<%= phone %>">

                    </div>

                </div>

                <!-- COMPANY -->

                <div class="input-group">

                    <label>Company Name</label>

                    <div class="input-box">

                        <i class="fa-solid fa-building"></i>

                        <input type="text"
                               name="company"
                               class="input-field"
                               value="<%= company %>">

                    </div>

                </div>

                <!-- BUTTONS -->

                <div style="display:flex;
                            gap:15px;
                            margin-top:35px;
                            flex-wrap:wrap;">

                    <!-- UPDATE -->

                    <button type="submit"
                            class="search-btn">

                        <i class="fa-solid fa-floppy-disk"></i>

                        Update Client

                    </button>

                    <!-- CANCEL -->

                    <a href="viewClients.jsp"
                       class="search-btn"
                       style="text-decoration:none;
                              display:flex;
                              align-items:center;
                              justify-content:center;">

                        Cancel

                    </a>

                </div>

            </form>

        </div>

    </div>

</div>

<!-- JS -->

<script src="js/theme.js"></script>

</body>

</html>