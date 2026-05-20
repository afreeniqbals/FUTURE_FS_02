<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Premium CRM Login</title>

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

<!-- BACKGROUND LIGHTS -->

<div class="bg-light-one"></div>
<div class="bg-light-two"></div>

<!-- MAIN LOGIN CONTAINER -->

<div class="login-container">

    <!-- LEFT SIDE -->

    <div class="left-side">

        <!-- LOGO -->

        <div class="logo">
            <i class="fa-solid fa-chart-line"></i>
        </div>

        <!-- TITLE -->

        <h1>
            Premium <br>
            CRM
        </h1>

        <!-- DESCRIPTION -->

        <p>
            Manage clients, workflow and business operations
            with a modern premium CRM experience.
        </p>

        <!-- INFO BOX -->

        <div class="info-box">

            <h3>
                <i class="fa-solid fa-shield-halved"></i>
                Enterprise Security
            </h3>

            <p>
                Built with Java, JSP, Servlets and MySQL
                with premium multi-theme UI.
            </p>

        </div>

    </div>

    <!-- RIGHT SIDE -->

    <div class="right-side">

        <!-- TOP BAR -->

        <div class="top-bar">

            <div class="mini-tag">
                Multi Theme Dashboard
            </div>

            <!-- THEME SWITCHER -->

            <select id="themeSwitcher">

                <option value="dark">🌌 Dark</option>

                <option value="light">🤍 Light</option>

                <option value="gold">🖤 Gold</option>

            </select>

        </div>

        <!-- HEADING -->

        <h2 class="welcome">
            Welcome back
        </h2>

        <p class="subtitle">
            Sign in to continue to your CRM dashboard.
        </p>

        <!-- ERROR MESSAGE -->

        <% String error=request.getParameter("error");
           if(error!=null){ %>

            <div class="error-msg">
                Invalid Username or Password
            </div>

        <% } %>

        <!-- LOGIN FORM -->

        <form action="LoginServlet" method="post">

            <!-- USERNAME -->

            <div class="input-group">

                <label>Username</label>

                <div class="input-box">

                    <i class="fa-solid fa-user"></i>

                    <input type="email"
     				  name="email"
                           class="input-field"
                           placeholder="Enter email"
                           required>

                </div>

            </div>

            <!-- PASSWORD -->

            <div class="input-group">

                <label>Password</label>

                <div class="input-box">

                    <i class="fa-solid fa-lock"></i>

                    <input type="password"
                           name="password"
                           class="input-field"
                           placeholder="Enter password"
                           required>

                </div>

            </div>

            <!-- OPTIONS -->

            <div class="options">

                <label>
                    <input type="checkbox">
                    Remember me
                </label>

                <a href="#">
                    Forgot Password?
                </a>

            </div>

            <!-- LOGIN BUTTON -->

            <button type="submit" class="login-btn">

                <i class="fa-solid fa-arrow-right-to-bracket"></i>
                Login

            </button>

        </form>

        <!-- DIVIDER -->

        <div class="divider">
            <span>OR</span>
        </div>

        <!-- GOOGLE BUTTON -->

        <button class="google-btn">

            <i class="fa-brands fa-google"></i>
            Continue with Google

        </button>

        <!-- FOOTER -->

        <div class="footer">

            © 2025 Premium CRM Platform <br>
            Built with Java • JSP • Servlets • MySQL

        </div>

    </div>

</div>

<!-- JS FILE -->

<script src="js/theme.js"></script>

</body>
</html>