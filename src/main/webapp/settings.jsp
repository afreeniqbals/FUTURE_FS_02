<%@ page contentType="text/html;charset=UTF-8" %>

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

<title>Settings</title>

<!-- GOOGLE FONT -->

<link rel="preconnect"
href="https://fonts.googleapis.com">

<link rel="preconnect"
href="https://fonts.gstatic.com"
crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
rel="stylesheet">

<!-- FONT AWESOME -->

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

<!-- CSS -->

<link rel="stylesheet"
href="css/style.css">

<link rel="stylesheet"
href="css/themes.css">

<link rel="stylesheet"
href="css/dashboard.css">

<link rel="stylesheet"
href="css/responsive.css">

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

            <li class="active">

                <i class="fa-solid fa-gear"></i>

                Settings

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
                    Account Settings
                </h2>

                <p class="dashboard-subtitle">
                    Customize your CRM profile and preferences.
                </p>

            </div>

            <select id="themeSwitcher">

                <option value="dark">🌌 Dark</option>

                <option value="light">🤍 Light</option>

                <option value="gold">🖤 Gold</option>

            </select>

        </div>

        <!-- PROFILE CARD -->

        <div class="table-box"
             style="max-width:700px;">

            <!-- AVATAR -->

            <div style="text-align:center;
                        margin-bottom:30px;">

                <div style="
                    width:120px;
                    height:120px;
                    margin:auto;
                    border-radius:50%;
                    display:flex;
                    align-items:center;
                    justify-content:center;
                    font-size:42px;
                    font-weight:700;
                    background:linear-gradient(
                    135deg,
                    #8b5cf6,
                    #06b6d4
                    );
                    color:white;
                    margin-bottom:20px;">

                    <%= user.substring(0,1).toUpperCase() %>

                </div>

                <h3>

                    <%= user %>

                </h3>

                <p style="opacity:0.7;">

                    CRM Administrator

                </p>

            </div>

            <!-- FORM -->
            <%
String msg =
request.getParameter("msg");

if("success".equals(msg)){
%>

<div class="mini-tag"
     style="margin-bottom:20px;">

    Settings Updated Successfully ⚙️

</div>

<%
}
%>
<form action="UploadProfileServlet"

method="post"

enctype="multipart/form-data">
                <!-- USERNAME -->
                
                <!-- PROFILE IMAGE -->

<div class="input-group">

<label>

Profile Image

</label>

<div class="input-box">

<i class="fa-solid fa-image"></i>

<input

type="file"

name="profileImage"

class="input-field"

accept="image/*"

required>

</div>

</div>

                <div class="input-group">

                    <label>Username</label>

                    <div class="input-box">

                        <i class="fa-solid fa-user"></i>

                       <input type="text"
       name="username"
                               class="input-field"
                               value="<%= user %>">

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
                               value="<%= user %>">

                    </div>

                </div>

                <!-- PASSWORD -->

                <div class="input-group">

                    <label>New Password</label>

                    <div class="input-box">

                        <i class="fa-solid fa-lock"></i>

                        <input type="password"
       name="password"
                               class="input-field"
                               placeholder="Enter new password">

                    </div>

                </div>

                <!-- THEME -->

                <div class="input-group">

                    <label>Theme Preference</label>

                    <select class="search-select">

                        <option>
                            Dark Theme
                        </option>

                        <option>
                            Light Theme
                        </option>

                        <option>
                            Gold Theme
                        </option>

                    </select>

                </div>

                <!-- BUTTON -->

                <div style="margin-top:35px;">

                    <button class="search-btn">

                        <i class="fa-solid fa-floppy-disk"></i>

                        Save Settings

                    </button>

                </div>

            </form>

        </div>

    </div>

</div>

<script src="js/theme.js"></script>

</body>

</html>