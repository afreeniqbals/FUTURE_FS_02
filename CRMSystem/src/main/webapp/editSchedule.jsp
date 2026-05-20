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

int id =
Integer.parseInt(
request.getParameter(
"id"
)
);

Connection con =
DBConnection.getConnection();

PreparedStatement ps =
con.prepareStatement(

"SELECT * FROM schedules WHERE id=?"

);

ps.setInt(
1,
id
);

ResultSet rs =
ps.executeQuery();

rs.next();
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Edit Schedule</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

<link rel="stylesheet"
href="css/style.css">

<link rel="stylesheet"
href="css/dashboard.css">

<link rel="stylesheet"
href="css/themes.css">

</head>

<body class="dark">

<div class="dashboard-container">

<div class="main-content">

<div class="table-box">

<h2>

Edit Schedule

</h2>

<form action="UpdateScheduleServlet"
method="post">

<input type="hidden"
name="id"
value="<%= rs.getInt("id") %>">

<div class="search-form">

<input type="text"
name="title"
class="search-input"
value="<%= rs.getString("title") %>"
required>

<input type="date"
name="schedule_date"
class="search-input"
value="<%= rs.getString("schedule_date") %>"
required>

<input type="time"
name="schedule_time"
class="search-input"
value="<%= rs.getString("schedule_time") %>"
required>

<button class="search-btn">

Update Schedule

</button>

</div>

</form>

</div>

</div>

</div>

<script src="js/theme.js"></script>

</body>

</html>