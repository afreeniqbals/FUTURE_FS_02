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

<title>Communications</title>

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

            <li onclick="window.location.href='viewClients.jsp'">

                <i class="fa-solid fa-users"></i>

                Clients

            </li>

            <li onclick="window.location.href='tasks.jsp'">

                <i class="fa-solid fa-list-check"></i>

                Tasks

            </li>

            <li class="active">

                <i class="fa-solid fa-comments"></i>

                Communications

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
                    Communication Log
                </h2>

                <p class="dashboard-subtitle">
                    Track all meetings, calls and emails beautifully.
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
                    Communication Center 💬
                </h2>

                <p>
                    Monitor all client conversations,
                    calls, meetings and emails from one place.
                </p>

            </div>

            <div class="welcome-circle">

                <i class="fa-solid fa-comments"></i>

            </div>

        </div>

        <!-- ADD BUTTON -->

        <div style="margin-bottom:25px;">

            <a href="addCommunication.jsp"
               class="search-btn"
               style="text-decoration:none;
                      display:inline-flex;
                      align-items:center;">

                <i class="fa-solid fa-plus"></i>

                &nbsp; Add Communication

            </a>

        </div>

        <!-- TIMELINE -->
        
        <%
String msg =
request.getParameter("msg");

if("success".equals(msg)){
%>

<div class="mini-tag"
     style="margin-bottom:20px;">

    Communication Added Successfully 💬

</div>

<%
}
%>

        <div class="table-box">

            <div class="activity-list">

            <%

            Connection con =
            DBConnection.getConnection();

            PreparedStatement ps =
            con.prepareStatement(

            "SELECT * FROM communications ORDER BY created_at DESC"

            );

            ResultSet rs =
            ps.executeQuery();

            while(rs.next()){

                String type =
                rs.getString("type");

                String iconClass = "fa-envelope";

                String colorClass = "cyan-icon";

                if(type.equalsIgnoreCase("Call")){

                    iconClass = "fa-phone";

                    colorClass = "purple-icon";

                }else if(type.equalsIgnoreCase("Meeting")){

                    iconClass = "fa-handshake";

                    colorClass = "gold-icon";
                }
            %>

            <!-- ITEM -->

            <div class="activity-item">

                <!-- ICON -->

                <div class="activity-icon <%= colorClass %>">

                    <i class="fa-solid <%= iconClass %>"></i>

                </div>

                <!-- INFO -->

                <div class="activity-info">

                    <h4>

                        <%= rs.getString("client_name") %>

                        •

                        <%= rs.getString("type") %>

                    </h4>

                    <p>

                        <%= rs.getString("message") %>

                    </p>

                </div>

                <!-- DATE -->

                <span class="activity-time">

                    <%= rs.getString("created_at") %>

                </span>

            </div>

            <%
            }
            %>

            </div>

        </div>

    </div>

</div>

<script src="js/theme.js"></script>

</body>

</html>