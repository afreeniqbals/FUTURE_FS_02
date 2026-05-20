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
request.getParameter("id")
);

Connection con =
DBConnection.getConnection();

PreparedStatement ps =
con.prepareStatement(
"SELECT * FROM tasks WHERE id=?"
);

ps.setInt(1, id);

ResultSet rs =
ps.executeQuery();

String taskName = "";
String clientName = "";
String priority = "";
String status = "";
String dueDate = "";

if(rs.next()){

    taskName =
    rs.getString("task_name");

    clientName =
    rs.getString("client_name");

    priority =
    rs.getString("priority");

    status =
    rs.getString("status");

    dueDate =
    rs.getString("due_date");
}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Edit Task</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/themes.css">
<link rel="stylesheet" href="css/dashboard.css">
<link rel="stylesheet" href="css/responsive.css">

</head>

<body class="dark">

<div class="bg-light-one"></div>
<div class="bg-light-two"></div>

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

            <li onclick="window.location.href='tasks.jsp'">

                <i class="fa-solid fa-list-check"></i>

                Tasks

            </li>

            <li class="active">

                <i class="fa-solid fa-pen"></i>

                Edit Task

            </li>

        </ul>

    </div>

    <!-- MAIN -->

    <div class="main-content">

        <div class="top-navbar">

            <div>

                <h2 class="dashboard-title">
                    Edit Task
                </h2>

                <p class="dashboard-subtitle">
                    Update task details beautifully.
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

            <form action="UpdateTaskServlet"
                  method="post">

                <!-- ID -->

                <input type="hidden"
                       name="id"
                       value="<%= id %>">

                <!-- TASK -->

                <div class="input-group">

                    <label>Task Name</label>

                    <div class="input-box">

                        <i class="fa-solid fa-list-check"></i>

                        <input type="text"
                               name="task_name"
                               class="input-field"
                               value="<%= taskName %>"
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
                               value="<%= clientName %>"
                               required>

                    </div>

                </div>

                <!-- PRIORITY -->

                <div class="input-group">

                    <label>Priority</label>

                    <select name="priority"
                            class="search-select">

                        <option <%= priority.equals("High") ? "selected" : "" %>>
                            High
                        </option>

                        <option <%= priority.equals("Medium") ? "selected" : "" %>>
                            Medium
                        </option>

                        <option <%= priority.equals("Low") ? "selected" : "" %>>
                            Low
                        </option>

                    </select>

                </div>

                <!-- STATUS -->

                <div class="input-group">

                    <label>Status</label>

                    <select name="status"
                            class="search-select">

                        <option <%= status.equals("Pending") ? "selected" : "" %>>
                            Pending
                        </option>

                        <option <%= status.equals("In Progress") ? "selected" : "" %>>
                            In Progress
                        </option>

                        <option <%= status.equals("Completed") ? "selected" : "" %>>
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
                           value="<%= dueDate %>"
                           required>

                </div>

                <!-- BUTTON -->

                <div style="margin-top:35px;">

                    <button class="search-btn">

                        <i class="fa-solid fa-floppy-disk"></i>

                        Update Task

                    </button>

                </div>

            </form>

        </div>

    </div>

</div>

<script src="js/theme.js"></script>

</body>

</html>