<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*, com.crm.DBConnection" %>

<%
String user =
(String) session.getAttribute("userEmail");

if(user == null){

    response.sendRedirect("login.jsp");

    return;
}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Invoices</title>

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

<!-- BG -->

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

        <ul class="sidebar-menu">

            <li onclick="window.location.href='dashboard.jsp'">

                <i class="fa-solid fa-house"></i>

                Dashboard

            </li>

            <li onclick="window.location.href='viewClients.jsp'">

                <i class="fa-solid fa-users"></i>

                Clients

            </li>

            <li onclick="window.location.href='tasks.jsp'">

                <i class="fa-solid fa-list-check"></i>

                Tasks

            </li>

            <li onclick="window.location.href='communications.jsp'">

                <i class="fa-solid fa-comments"></i>

                Communications

            </li>

            <li onclick="window.location.href='files.jsp'">

                <i class="fa-solid fa-folder-open"></i>

                Files

            </li>

            <li class="active">

                <i class="fa-solid fa-file-invoice-dollar"></i>

                Invoices

            </li>

            <li onclick="window.location.href='LogoutServlet'">

                <i class="fa-solid fa-right-from-bracket"></i>

                Logout

            </li>

        </ul>

    </div>

    <!-- MAIN -->

    <div class="main-content">

        <!-- TOP -->

        <div class="top-navbar">

            <div>

                <h2 class="dashboard-title">
                    Invoice Management
                </h2>

                <p class="dashboard-subtitle">
                    Track payments and revenue professionally.
                </p>

            </div>

            <div class="top-right">

                <div class="profile-box">

                    <div class="profile-avatar">

                        <%= user.substring(0,1).toUpperCase() %>

                    </div>

                    <div class="profile-info">

                        <h4>
                            <%= user %>
                        </h4>

                        <p>
                            Administrator
                        </p>

                    </div>

                </div>

                <select id="themeSwitcher">

                    <option value="dark">🌌 Dark</option>

                    <option value="light">🤍 Light</option>

                    <option value="gold">🖤 Gold</option>

                </select>

            </div>

        </div>

        <!-- HERO -->

        <div class="welcome-banner">

            <div class="welcome-content">

                <h2>
                    Revenue Center 💰
                </h2>

                <p>
                    Monitor invoices, track payments
                    and manage your business revenue beautifully.
                </p>

            </div>

            <div class="welcome-circle">

                <i class="fa-solid fa-wallet"></i>

            </div>

        </div>

        <!-- ADD BUTTON -->

        <div style="margin-bottom:25px;">

            <a href="addInvoice.jsp"
               class="search-btn"
               style="text-decoration:none;
                      display:inline-flex;
                      align-items:center;">

                <i class="fa-solid fa-plus"></i>

                &nbsp; Create Invoice

            </a>

        </div>

        <!-- SUCCESS -->

        <%
        String msg =
        request.getParameter("msg");

        if("success".equals(msg)){
        %>

        <div class="mini-tag"
             style="margin-bottom:20px;">

            Invoice Created Successfully 💰

        </div>

        <%
        }
        %>

        <!-- STATS -->

        <%
        Connection con =
        DBConnection.getConnection();

        Statement st =
        con.createStatement();

        ResultSet totalRs =
        st.executeQuery(
        "SELECT SUM(amount) AS total FROM invoices"
        );

        double totalRevenue = 0;

        if(totalRs.next()){

            totalRevenue =
            totalRs.getDouble("total");
        }

        ResultSet paidRs =
        st.executeQuery(
        "SELECT COUNT(*) AS paid FROM invoices WHERE status='Paid'"
        );

        int paidInvoices = 0;

        if(paidRs.next()){

            paidInvoices =
            paidRs.getInt("paid");
        }
        %>

        <!-- CARDS -->

        <div class="stats-grid">

            <!-- REVENUE -->

            <div class="stat-card card-gold">

                <div class="card-icon">

                    <i class="fa-solid fa-wallet"></i>

                </div>

                <div class="card-info">

                    <h4>
                        Total Revenue
                    </h4>

                    <h2>

                        ₹ <%= totalRevenue %>

                    </h2>

                    <p>
                        Business earnings overview
                    </p>

                </div>

            </div>

            <!-- PAID -->

            <div class="stat-card card-purple">

                <div class="card-icon">

                    <i class="fa-solid fa-circle-check"></i>

                </div>

                <div class="card-info">

                    <h4>
                        Paid Invoices
                    </h4>

                    <h2>

                        <%= paidInvoices %>

                    </h2>

                    <p>
                        Successfully completed payments
                    </p>

                </div>

            </div>

        </div>

        <!-- TABLE -->

        <div class="table-box">

            <table class="crm-table">

                <thead>

                    <tr>

                        <th>Client</th>

                        <th>Amount</th>

                        <th>Status</th>

                        <th>Date</th>

                    </tr>

                </thead>

                <tbody>

                <%

                PreparedStatement ps =
                con.prepareStatement(

                "SELECT * FROM invoices ORDER BY created_at DESC"

                );

                ResultSet rs =
                ps.executeQuery();

                while(rs.next()){

                    String status =
                    rs.getString("status");

                    String badge = "";

                    if(status.equalsIgnoreCase("Paid")){

                        badge = "active";

                    }else{

                        badge = "inactive";
                    }
                %>

                <tr>

                    <td>

                        <%= rs.getString("client_name") %>

                    </td>

                    <td>

                        ₹ <%= rs.getDouble("amount") %>

                    </td>

                    <td>

                        <span class="status-badge <%= badge %>">

                            <%= status %>

                        </span>

                    </td>

                    <td>

                        <%= rs.getString("created_at") %>

                    </td>

                </tr>

                <%
                }
                %>

                </tbody>

            </table>

        </div>

    </div>

</div>

<script src="js/theme.js"></script>

</body>

</html>