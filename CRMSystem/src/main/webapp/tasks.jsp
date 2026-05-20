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

<title>Tasks</title>

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

            <li class="active">

                <i class="fa-solid fa-list-check"></i>

                Tasks

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
                    Task Management
                </h2>

                <p class="dashboard-subtitle">
                    Organize and track all client tasks.
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

        <!-- TASK HEADER -->

        <div class="welcome-banner">

            <div class="welcome-content">

                <h2>
                    Manage Tasks 🚀
                </h2>

                <p>
                    Create, organize and monitor all project
                    tasks with priority and due dates.
                </p>

            </div>

            <div class="welcome-circle">

                <i class="fa-solid fa-list-check"></i>

            </div>

        </div>

        <!-- ADD BUTTON -->

        <div style="margin-bottom:25px;">

            <a href="addTask.jsp"
               class="search-btn"
               style="text-decoration:none;
                      display:inline-flex;
                      align-items:center;">

                <i class="fa-solid fa-plus"></i>

                &nbsp; Add Task

            </a>

        </div>

        <!-- TASK TABLE -->

        <div class="table-box">
        
        <%
String msg =
request.getParameter("msg");

if("deleted".equals(msg)){
	
%>


<div class="mini-tag"
     style="margin-bottom:20px;">

    Task Deleted Successfully 🗑️

</div>

<%
}

if("updated".equals(msg)){
%>

<div class="mini-tag"
     style="margin-bottom:20px;">

    Task Updated Successfully ✨

</div>

<%
}
%>

            <table class="crm-table">

                <thead>

                    <tr>

                        <th>Task</th>

                        <th>Client</th>

                        <th>Priority</th>

                        <th>Status</th>

                        <th>Due Date</th>

                        <th>Actions</th>

                    </tr>

                </thead>

                <tbody>

                <%

                Connection con =
                DBConnection.getConnection();

                PreparedStatement ps =
                con.prepareStatement(
                "SELECT * FROM tasks"
                );

                ResultSet rs =
                ps.executeQuery();

                while(rs.next()){
                %>

                <tr>

                    <td>
                        <%= rs.getString("task_name") %>
                    </td>

                    <td>
                        <%= rs.getString("client_name") %>
                    </td>

                    <!-- PRIORITY -->

                    <td>

                        <%
String priority =
rs.getString("priority");

String priorityClass = "";

if(priority.equalsIgnoreCase("High")){

    priorityClass = "high-priority";

}else if(priority.equalsIgnoreCase("Medium")){

    priorityClass = "medium-priority";

}else{

    priorityClass = "low-priority";
}
%>

<span class="status-badge <%= priorityClass %>">

                            <%= rs.getString("priority") %>

                        </span>

                    </td>

                    <!-- STATUS -->

                    <td>

                        <%
String status =
rs.getString("status");

String statusClass = "";

if(status.equalsIgnoreCase("Completed")){

    statusClass = "active";

}else if(status.equalsIgnoreCase("Pending")){

    statusClass = "pending";

}else{

    statusClass = "inactive";
}
%>

<span class="status-badge <%= statusClass %>">

                            <%= rs.getString("status") %>

                        </span>

                    </td>

                    <td>
                        <%= rs.getString("due_date") %>
                    </td>

                    <!-- ACTIONS -->

                    <td>

                       <a href="editTask.jsp?id=<%= rs.getInt("id") %>">

    <button class="table-btn edit-btn"
            type="button">

        <i class="fa-solid fa-pen"></i>

    </button>

</a>

                        <a href="DeleteTaskServlet?id=<%= rs.getInt("id") %>"
   onclick="return confirm('Delete this task?')">

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

        </div>

    </div>

</div>

<script src="js/theme.js"></script>

</body>

</html>