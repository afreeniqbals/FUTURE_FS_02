<%@ page contentType="text/html;charset=UTF-8" %>

<%@page import="java.util.*"%>
<%@page import="com.crm.dao.ClientDAO"%>
<%@page import="com.crm.model.Client"%>
<%@page import="java.sql.*"%>
<%@page import="com.crm.DBConnection"%>



<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    if(session.getAttribute("userEmail")==null){
    	
    	

        response.sendRedirect("login.jsp");

        return;
    }
    
    String user =
    		(String) session.getAttribute("userEmail");

    ClientDAO dao = new ClientDAO();

    List<Client> recentClients = dao.getAllClients();

    int totalClients = recentClients.size();

    int activeClients = totalClients;

    int inactiveClients = 0;
    
    /* CHART DATA */

    int jan = totalClients / 6;
    int feb = totalClients / 5;
    int mar = totalClients / 4;
    int apr = totalClients / 3;
    int may = totalClients / 2;
    int jun = totalClients;
    
    /* DATABASE ANALYTICS */

    Connection con =
    DBConnection.getConnection();

    /* TOTAL TASKS */

    PreparedStatement taskPs =
    con.prepareStatement(
    "SELECT COUNT(*) FROM tasks"
    );

    ResultSet taskRs =
    taskPs.executeQuery();

    int totalTasks = 0;

    if(taskRs.next()){

        totalTasks =
        taskRs.getInt(1);
    }

    /* TOTAL COMMUNICATIONS */

    PreparedStatement commPs =
    con.prepareStatement(
    "SELECT COUNT(*) FROM communications"
    );

    ResultSet commRs =
    commPs.executeQuery();

    int totalCommunications = 0;

    if(commRs.next()){

        totalCommunications =
        commRs.getInt(1);
    }

    /* TOTAL REVENUE */

    PreparedStatement revenuePs =
    con.prepareStatement(
    "SELECT SUM(amount) FROM invoices"
    );

    ResultSet revenueRs =
    revenuePs.executeQuery();

    double totalRevenue = 0;

    if(revenueRs.next()){

        totalRevenue =
        revenueRs.getDouble(1);
    }
    
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Dashboard</title>

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

<!-- BACKGROUND LIGHTS -->

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

            <li class="active"
    onclick="window.location.href='dashboard.jsp'">

    <i class="fa-solid fa-house"></i>

    Dashboard

</li>
<li onclick="window.location.href='viewClients.jsp'">

    <i class="fa-solid fa-users"></i>

    Clients

</li>

<li onclick="window.location.href='addClient.jsp'">

    <i class="fa-solid fa-user-plus"></i>

    Add Client

</li>

            <li onclick="window.location.href='tasks.jsp'">
                <i class="fa-solid fa-list-check"></i>
                Tasks
            </li>

            <li  onclick="window.location.href='communications.jsp'">
                <i class="fa-solid fa-comments"></i>
                Communication
            </li>

            <li  onclick="window.location.href='files.jsp'">
                <i class="fa-solid fa-file"></i>
                Files
            </li>

            <li  onclick="window.location.href='invoices.jsp'">
                <i class="fa-solid fa-credit-card"></i>
                Payments
            </li>

            <li onclick="window.location.href='reports.jsp'" >
                <i class="fa-solid fa-chart-pie"></i>
                Reports
            </li>

            <li onclick="window.location.href='settings.jsp'" >
                <i class="fa-solid fa-gear"></i>
                Settings
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
        
        <button id="menuToggle"
        class="menu-toggle">

    <i class="fa-solid fa-bars"></i>

</button>


            <div>

                <h2 class="dashboard-title">
                    Dashboard
                </h2>

                <p class="dashboard-subtitle">
                    Welcome back,
                    <strong>
                        <%= session.getAttribute("userEmail") %>
                    </strong>
                </p>

            </div>

            <!-- RIGHT TOP -->

            <div class="top-bar">

               <div class="top-right">

    <!-- NOTIFICATION -->

    <div class="notification-wrapper">

        <!-- BELL -->

        <div class="notification-box"
             id="notificationBtn">

            <i class="fa-solid fa-bell"></i>

            <span class="notification-count">

                3

            </span>

        </div>

        <!-- DROPDOWN -->

        <div class="notification-dropdown"
             id="notificationDropdown">

            <h3>
                Notifications
            </h3>

            <!-- ITEM -->

            <div class="notify-item">

                <div class="notify-icon purple-icon">

                    <i class="fa-solid fa-user-plus"></i>

                </div>

                <div>

                    <h4>
                        New Client Added
                    </h4>

                    <p>
                        John Smith joined CRM.
                    </p>

                </div>

            </div>
            
            

            <!-- ITEM -->

            <div class="notify-item">

                <div class="notify-icon cyan-icon">

                    <i class="fa-solid fa-credit-card"></i>

                </div>

                <div>

                    <h4>
                        Payment Received
                    </h4>

                    <p>
                        Invoice payment completed.
                    </p>

                </div>

            </div>
            
            

        </div>

    </div>

    <!-- PROFILE -->

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

    <!-- THEME -->

    <select id="themeSwitcher">

        <option value="dark">🌌 Dark</option>

        <option value="light">🤍 Light</option>

        <option value="gold">🖤 Gold</option>

    </select>

</div>

            </div>

        </div>
        
       <div class="dashboard-main">

<div class="left-section">

<!-- WELCOME -->

<div class="welcome-banner">

    <div class="welcome-content">

        <h2>
            Welcome Back 👋
        </h2>

        <p>
            Manage your clients, analytics and workflow
            beautifully with your premium CRM dashboard.
        </p>

        <div class="welcome-tags">

            <span>🚀 Productivity</span>

            <span>📈 Analytics</span>

            <span>💼 CRM</span>

        </div>

    </div>

    <div class="welcome-circle">

        <i class="fa-solid fa-chart-line"></i>

    </div>

</div>

        <!-- STATS -->

        <div class="stats-grid">

            <!-- TOTAL CLIENTS -->

            <div class="stat-card card-purple">

    <div class="card-icon">
        <i class="fa-solid fa-users"></i>
    </div>

    <div class="card-info">

        <h4>Total Clients</h4>

        <h2><%= totalClients %></h2>

        <p>
            <i class="fa-solid fa-arrow-trend-up"></i>
            +12% this month
        </p>

    </div>

</div>

            <!-- ACTIVE -->

            <div class="stat-card card-cyan">

    <div class="card-icon">
        <i class="fa-solid fa-user-check"></i>
    </div>

    <div class="card-info">

        <h4>Active Clients</h4>

        <h2><%= activeClients %></h2>

        <p>
            <i class="fa-solid fa-circle-check"></i>
            Currently active
        </p>

    </div>

</div>

            <!-- INACTIVE -->

            <div class="stat-card card-gold">

    <div class="card-icon">
        <i class="fa-solid fa-user-xmark"></i>
    </div>

    <div class="card-info">

        <h4>Inactive Clients</h4>

        <h2><%= inactiveClients %></h2>

        <p>
            <i class="fa-solid fa-clock"></i>
            Need follow-up
        </p>

    </div>

</div>

            <!-- TASKS -->

            <!-- TASKS -->

<div class="stat-card card-pink">

    <div class="card-icon">

        <i class="fa-solid fa-list-check"></i>

    </div>

    <div class="card-info">

        <h4>Total Tasks</h4>

        <h2><%= totalTasks %></h2>

        <p>

            <i class="fa-solid fa-briefcase"></i>

            Workflow tasks

        </p>

    </div>

</div>

<!-- COMMUNICATIONS -->

<div class="stat-card card-cyan">

    <div class="card-icon">

        <i class="fa-solid fa-comments"></i>

    </div>

    <div class="card-info">

        <h4>Communications</h4>

        <h2><%= totalCommunications %></h2>

        <p>

            <i class="fa-solid fa-message"></i>

            Client interaction logs

        </p>

    </div>

</div>

<!-- REVENUE -->

<div class="stat-card card-gold">

    <div class="card-icon">

        <i class="fa-solid fa-wallet"></i>

    </div>

    <div class="card-info">

        <h4>Revenue</h4>

        <h2>₹ <%= String.format("%.0f", totalRevenue) %></h2>

        <p>

            <i class="fa-solid fa-chart-line"></i>

            Business earnings

        </p>

    </div>

</div>

        </div>
        
        
        <!-- CHART SECTION -->

<div class="chart-grid">

    <!-- CHART CARD -->

    <div class="chart-card">

        <div class="chart-header">

            <div>

                <h3>
                    Client Growth
                </h3>

                <p>
                    Monthly client analytics overview
                </p>

            </div>

            <div class="chart-badge">
                +24%
            </div>

        </div>

        <canvas id="clientChart"></canvas>

    </div>

</div>
        

        <!-- SEARCH -->

        
        
        <!-- UPCOMING MEETINGS -->

<div class="table-box">

<h3>

Upcoming Meetings

</h3>

<table class="crm-table">

<tr>

<th>Title</th>

<th>Date</th>

<th>Time</th>

</tr>

<%

try{

Connection con2 =
DBConnection.getConnection();

PreparedStatement ps2 =
con2.prepareStatement(

"SELECT * FROM schedules ORDER BY schedule_date ASC LIMIT 5"

);

ResultSet rs2 =
ps2.executeQuery();

while(rs2.next()){

%>

<tr>

<td>

<%= rs2.getString(
"title"
)%>

</td>

<td>

<%= rs2.getString(
"schedule_date"
)%>

</td>

<td>

<%= rs2.getString(
"schedule_time"
)%>

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

            <h3>
                Search Clients
            </h3>

            <form class="search-form">

                <input type="text"
                       placeholder="Search client..."
                       class="search-input">

                <select class="search-select">

                    <option>All Status</option>

                    <option>Active</option>

                    <option>Inactive</option>

                </select>

                <button class="search-btn">

                    <i class="fa-solid fa-magnifying-glass"></i>

                    Search

                </button>

            </form>

        </div>

        <!-- RECENT CLIENTS -->
        
        </div>

<div class="right-section">

        <div class="table-box">

            <h3>
                Recent Clients
            </h3>

            <table class="crm-table">

                <thead>

                    <tr>

                        <th>ID</th>

                        <th>Name</th>

                        <th>Email</th>

                        <th>Phone</th>
                        
                        <th>Actions</th>

                        
                        

                    </tr>

                </thead>

                <tbody>

                    <%
                        for(Client c : recentClients){
                    %>

                    <tr>

                        <td>
                            <%= c.getId() %>
                        </td>

                        <td>
                            <%= c.getName() %>
                        </td>

                        <td>
                            <%= c.getEmail() %>
                        </td>

                        <td>
                            <%= c.getPhone() %>
                        </td>
                        
                        <td>

    <button class="table-btn edit-btn">
        <i class="fa-solid fa-pen"></i>
    </button>

    <button class="table-btn delete-btn">
        <i class="fa-solid fa-trash"></i>
    </button>

</td>
                        

                        

                    </tr>

                    <%
                        }
                    %>

                </tbody>

            </table>
            
            

        </div>

    </div>



<!-- ACTIVITY SECTION -->

<div class="table-box">

    <h3>
        Recent Activity
    </h3>

    <div class="activity-list">

        <!-- ITEM -->

        <div class="activity-item">

            <div class="activity-icon purple-icon">
                <i class="fa-solid fa-user-plus"></i>
            </div>

            <div class="activity-info">

                <h4>
                    New Client Added
                </h4>

                <p>
                    John Smith was added to CRM.
                </p>

            </div>

            <span class="activity-time">
                2 min ago
            </span>

        </div>

        <!-- ITEM -->

        <div class="activity-item">

            <div class="activity-icon cyan-icon">
                <i class="fa-solid fa-credit-card"></i>
            </div>

            <div class="activity-info">

                <h4>
                    Payment Received
                </h4>

                <p>
                    Invoice payment completed.
                </p>

            </div>

            <span class="activity-time">
                1 hour ago
            </span>

        </div>

        <!-- ITEM -->

        <div class="activity-item">

            <div class="activity-icon gold-icon">
                <i class="fa-solid fa-list-check"></i>
            </div>

            <div class="activity-info">

                <h4>
                    Task Completed
                </h4>

                <p>
                    Follow-up task marked completed.
                </p>

            </div>

            <span class="activity-time">
                Today
            </span>

        </div>

    </div>

</div>

</div>

</div>

<!-- JS -->

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>

const ctx = document.getElementById('clientChart');

new Chart(ctx, {

    type: 'line',

    data: {

        labels: [
            'Jan',
            'Feb',
            'Mar',
            'Apr',
            'May',
            'Jun'
        ],

        datasets: [{

            label: 'Clients',

            data: [

                <%= jan %>,
                <%= feb %>,
                <%= mar %>,
                <%= apr %>,
                <%= may %>,
                <%= jun %>

            ],

            borderColor: '#8b5cf6',

            backgroundColor: 'rgba(139,92,246,0.15)',

            fill: true,

            tension: 0.4,

            pointRadius: 5,

            pointBackgroundColor: '#06b6d4'

        }]
    },

    options: {

        responsive: true,

        plugins: {

            legend: {

                labels: {
                    color: '#94a3b8'
                }
            }
        },

        scales: {

            x: {

                ticks: {
                    color: '#94a3b8'
                },

                grid: {
                    color: 'rgba(255,255,255,0.05)'
                }
            },

            y: {

                ticks: {
                    color: '#94a3b8'
                },

                grid: {
                    color: 'rgba(255,255,255,0.05)'
                }
            }
        }
    }

});

</script>

<script>

const menuToggle =
document.getElementById("menuToggle");

const dashboardContainer =
document.querySelector(".dashboard-container");

menuToggle.addEventListener("click", ()=>{

    dashboardContainer.classList.toggle(
    "collapsed"
    );

});

</script>

<script>

const notificationBtn =
document.getElementById(
"notificationBtn"
);

const notificationDropdown =
document.getElementById(
"notificationDropdown"
);

notificationBtn.addEventListener(
"click",

()=>{

notificationDropdown.classList.toggle(
"show"
);

});

</script>

<script src="js/theme.js"></script>

</body>
</html>