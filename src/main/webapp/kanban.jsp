<%@ page import="java.sql.*,com.crm.DBConnection"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Kanban Board</title>

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

<style>

.kanban-board{

display:grid;

grid-template-columns:
repeat(3,1fr);

gap:28px;

margin-top:35px;
}

.kanban-column{

background:rgba(255,255,255,0.06);

border:1px solid rgba(255,255,255,0.08);

padding:25px;

border-radius:28px;

backdrop-filter:blur(20px);
}

.kanban-column h2{

margin-bottom:25px;

text-align:center;
}

.task-card{

background:rgba(255,255,255,0.08);

padding:18px;

border-radius:20px;

margin-bottom:18px;

transition:.3s;
}

.task-card:hover{

transform:translateY(-4px);
}

.task-card h4{

margin-bottom:12px;
}

.task-card p{

opacity:.8;
}

</style>

</head>

<body class="dark">

<div class="dashboard-container">

<!-- SIDEBAR -->

<div class="sidebar">

<h2 class="logo">

CRM Dashboard

</h2>

<ul class="menu">

<li>

<a href="dashboard.jsp">

<i class="fa-solid fa-house"></i>

Dashboard

</a>

</li>

<li>

<a href="tasks.jsp">

<i class="fa-solid fa-list-check"></i>

Tasks

</a>

</li>

<li class="active">

<a href="kanban.jsp">

<i class="fa-solid fa-table-columns"></i>

Kanban

</a>

</li>

<li>

<a href="calendar.jsp">

<i class="fa-solid fa-calendar"></i>

Calendar

</a>

</li>

<li>

<a href="settings.jsp">

<i class="fa-solid fa-gear"></i>

Settings

</a>

</li>

</ul>

</div>

<!-- MAIN -->

<div class="main-content">

<div class="top-navbar">

<h2 class="dashboard-title">

Kanban Task Board

</h2>

</div>

<div class="kanban-board">

<!-- TODO -->

<div class="kanban-column">

<h2>

TODO

</h2>

<%

Connection con =
DBConnection.getConnection();

PreparedStatement ps1 =
con.prepareStatement(

"SELECT * FROM tasks WHERE task_stage='TODO'"

);

ResultSet rs1 =
ps1.executeQuery();

while(rs1.next()){

%>

<div class="task-card">

<h4>

<%= rs1.getString(
"task_name"
)%>

</h4>

<p>

Client:

<%= rs1.getString(
"client_name"
)%>

</p>

<p>

Priority:

<%= rs1.getString(
"priority"
)%>

</p>

</div>

<%
}
%>

</div>

<!-- IN PROGRESS -->

<div class="kanban-column">

<h2>

IN PROGRESS

</h2>

<%

PreparedStatement ps2 =
con.prepareStatement(

"SELECT * FROM tasks WHERE task_stage='IN PROGRESS'"

);

ResultSet rs2 =
ps2.executeQuery();

while(rs2.next()){

%>

<div class="task-card">

<h4>

<%= rs2.getString(
"task_name"
)%>

</h4>

<p>

Client:

<%= rs2.getString(
"client_name"
)%>

</p>

<p>

Priority:

<%= rs2.getString(
"priority"
)%>

</p>

</div>

<%
}
%>

</div>

<!-- DONE -->

<div class="kanban-column">

<h2>

DONE

</h2>

<%

PreparedStatement ps3 =
con.prepareStatement(

"SELECT * FROM tasks WHERE task_stage='DONE'"

);

ResultSet rs3 =
ps3.executeQuery();

while(rs3.next()){

%>

<div class="task-card">

<h4>

<%= rs3.getString(
"task_name"
)%>

</h4>

<p>

Client:

<%= rs3.getString(
"client_name"
)%>

</p>

<p>

Priority:

<%= rs3.getString(
"priority"
)%>

</p>

</div>

<%
}
%>

</div>

</div>

</div>

</div>

</body>

</html>