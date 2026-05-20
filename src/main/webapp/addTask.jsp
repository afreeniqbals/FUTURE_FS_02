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

<title>Add Task</title>

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

            <li onclick="window.location.href='tasks.jsp'">

                <i class="fa-solid fa-list-check"></i>

                Tasks

            </li>

            <li class="active">

                <i class="fa-solid fa-plus"></i>

                Add Task

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
                    Add Task
                </h2>

                <p class="dashboard-subtitle">
                    Create and assign a new task.
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

            <form action="AddTaskServlet"
                  method="post">

                <!-- TASK NAME -->

                <div class="input-group">

                    <label>Task Name</label>

                    <div class="input-box">

                        <i class="fa-solid fa-list-check"></i>

                        <input type="text"
                               name="task_name"
                               class="input-field"
                               placeholder="Enter task name"
                               required>

                    </div>

                </div>

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

                <!-- PRIORITY -->

                <div class="input-group">

                    <label>Priority</label>

                    <select name="priority"
                            class="search-select"
                            required>

                        <option value="">
                            Select Priority
                        </option>

                        <option>
                            High
                        </option>

                        <option>
                            Medium
                        </option>

                        <option>
                            Low
                        </option>

                    </select>

                </div>

                <!-- STATUS -->

                <div class="input-group">

                    <label>Status</label>

                    <select name="status"
                            class="search-select"
                            required>

                        <option value="">
                            Select Status
                        </option>

                        <option>
                            Pending
                        </option>

                        <option>
                            In Progress
                        </option>

                        <option>
                            Completed
                        </option>

                    </select>

                </div>

                <!-- DATE -->

                <div class="input-group">

                    <label>Due Date</label>

                    <input type="date"
                           name="due_date"
                           class="search-input"
                           required>

                </div>

                <!-- BUTTONS -->

                <div style="display:flex;
                            gap:15px;
                            margin-top:35px;
                            flex-wrap:wrap;">

                    <!-- SAVE -->

                    <button type="submit"
                            class="search-btn">

                        <i class="fa-solid fa-floppy-disk"></i>

                        Save Task

                    </button>

                    <!-- CANCEL -->

                    <a href="tasks.jsp"
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

<script src="js/theme.js"></script>

</body>

</html>