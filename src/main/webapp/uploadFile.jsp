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

<title>Upload File</title>

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

            <li onclick="window.location.href='files.jsp'">

                <i class="fa-solid fa-folder-open"></i>

                Files

            </li>

            <li class="active">

                <i class="fa-solid fa-upload"></i>

                Upload File

            </li>

        </ul>

    </div>

    <!-- MAIN -->

    <div class="main-content">

        <!-- TOP -->

        <div class="top-navbar">

            <div>

                <h2 class="dashboard-title">
                    Upload File
                </h2>

                <p class="dashboard-subtitle">
                    Save client files securely and beautifully.
                </p>

            </div>

            <select id="themeSwitcher">

                <option value="dark">🌌 Dark</option>

                <option value="light">🤍 Light</option>

                <option value="gold">🖤 Gold</option>

            </select>

        </div>

        <!-- FORM -->

        <div class="table-box">

            <form action="UploadFileServlet"
                  method="post"
                  enctype="multipart/form-data">

                <!-- CLIENT -->

                <div class="input-group">

                    <label>Client Name</label>

                    <div class="input-box">

                        <i class="fa-solid fa-user"></i>

                        <input type="text"
                               name="client_name"
                               class="input-field"
                               placeholder="Enter client name"
                               required>

                    </div>

                </div>

                <!-- FILE -->

                <div class="input-group">

                    <label>Select File</label>

                    <input type="file"
                           name="file"
                           class="search-input"
                           required>

                </div>

                <!-- BUTTON -->

                <div style="margin-top:35px;">

                    <button class="search-btn">

                        <i class="fa-solid fa-upload"></i>

                        Upload File

                    </button>

                </div>

            </form>

        </div>

    </div>

</div>

<script src="js/theme.js"></script>

</body>

</html>