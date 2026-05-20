<%@ page contentType="text/html;charset=UTF-8" %>

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

<title>Add Client</title>

<!-- GOOGLE FONT -->

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<!-- FONT AWESOME -->

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

<!-- CSS FILES -->

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

        <!-- LOGO -->

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

            <li class="active">

                <i class="fa-solid fa-user-plus"></i>

                Add Client

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

        <!-- TOP NAVBAR -->

        <div class="top-navbar">

            <div>

                <h2 class="dashboard-title">
                    Add Client
                </h2>

                <p class="dashboard-subtitle">
                    Create and manage your client records.
                </p>

            </div>

            <!-- THEME SWITCHER -->

            <select id="themeSwitcher">

                <option value="dark">🌌 Dark</option>

                <option value="light">🤍 Light</option>

                <option value="gold">🖤 Gold</option>

            </select>

        </div>

        <!-- FORM CARD -->

        <div class="table-box">

            <form action="AddClientServlet" method="post">

                <!-- NAME -->

                <div class="input-group">

                    <label>Client Name</label>

                    <div class="input-box">

                        <i class="fa-solid fa-user"></i>

                        <input type="text"
                               name="name"
                               class="input-field"
                               placeholder="Enter client name"
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
                               placeholder="Enter email"
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
                               placeholder="Enter phone number">

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
                               placeholder="Enter company name">

                    </div>

                </div>

                <!-- BUTTONS -->

                <div style="display:flex; gap:15px; margin-top:35px; flex-wrap:wrap;">

                    <!-- ADD BUTTON -->

                    <button type="submit"
                            class="search-btn">

                        <i class="fa-solid fa-plus"></i>

                        Add Client

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

<!-- THEME JS -->

<script src="js/theme.js"></script>

</body>

</html>