<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*,com.crm.DBConnection"%>

<%
String user =
(String)session.getAttribute(
"userEmail"
);

if(user==null){

response.sendRedirect(
"login.jsp"
);

return;
}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Calendar</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

<link rel="stylesheet"
href="css/style.css">

<link rel="stylesheet"
href="css/dashboard.css">

<link rel="stylesheet"
href="css/themes.css">

<link rel="stylesheet"
href="css/responsive.css">

</head>

<body class="dark">

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

<li class="active">

<i class="fa-solid fa-calendar-days"></i>

Calendar

</li>

<li onclick="window.location.href='LogoutServlet'">

<i class="fa-solid fa-right-from-bracket"></i>

Logout

</li>

</ul>

</div>

<!-- MAIN -->

<div class="main-content">

<!-- TOP BAR -->

<div class="top-navbar">

<div>

<h2 class="dashboard-title">

Calendar Planner

</h2>

<p class="dashboard-subtitle">

Manage meetings & schedules

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

<option value="dark">

🌌 Dark

</option>

<option value="light">

🤍 Light

</option>

<option value="gold">

🖤 Gold

</option>

</select>

</div>

</div>

<!-- FORM -->

<div class="table-box">

<h3>

Add Schedule

</h3>

<form action="AddScheduleServlet"
method="post">

<div class="search-form">

<input type="text"
name="title"
placeholder="Meeting Title"
class="search-input"
required>

<input type="date"
name="schedule_date"
class="search-input"
required>

<input type="time"
name="schedule_time"
class="search-input"
required>

<button class="search-btn">

<i class="fa-solid fa-plus"></i>

Add Schedule

</button>

</div>

</form>

</div>

<!-- UPCOMING -->

<div class="table-box">

<h3>

Upcoming Meetings

</h3>

<table class="crm-table">

<tr>

<th>Title</th>

<th>Date</th>

<th>Time</th>

<th>Action</th>

</tr>

<%

try{

Connection con =
DBConnection.getConnection();

PreparedStatement ps =
con.prepareStatement(

"SELECT * FROM schedules ORDER BY schedule_date ASC"

);

ResultSet rs =
ps.executeQuery();

while(rs.next()){

%>

<tr>

<td>

<%= rs.getString(
"title"
)%>

</td>

<td>

<%= rs.getString(
"schedule_date"
)%>

</td>

<td>

<%= rs.getString(
"schedule_time"
)%>

<td>

<a href="editSchedule.jsp?id=<%= rs.getInt("id") %>"
class="btn btn-primary btn-sm">

Edit

</a>

<a href="DeleteScheduleServlet?id=<%= rs.getInt("id") %>"
class="btn btn-danger btn-sm"
onclick="return confirm('Delete schedule?')">

Delete

</a>

</td>

</td>

</tr>

<%
}

}catch(Exception e){

e.printStackTrace();
}
%>

</table>

</div>

</div>

</div>

<script src="js/theme.js"></script>

</body>

</html>