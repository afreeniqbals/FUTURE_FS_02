<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*, com.crm.DBConnection" %>

<%
String user =
(String) session.getAttribute("userEmail");

if(user == null){

    response.sendRedirect("login.jsp");

    return;
}

/* DATABASE */

Connection con =
DBConnection.getConnection();

/* TOTAL CLIENTS */

PreparedStatement clientPs =
con.prepareStatement(
"SELECT COUNT(*) FROM clients"
);

ResultSet clientRs =
clientPs.executeQuery();

int totalClients = 0;

if(clientRs.next()){

    totalClients =
    clientRs.getInt(1);
}

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

<title>Reports</title>

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

<!-- CHART JS -->

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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

                <i class="fa-solid fa-chart-column"></i>

                Reports

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
                    Analytics Reports
                </h2>

                <p class="dashboard-subtitle">
                    Visualize your CRM performance beautifully.
                </p>

            </div>

            <select id="themeSwitcher">

                <option value="dark">🌌 Dark</option>

                <option value="light">🤍 Light</option>

                <option value="gold">🖤 Gold</option>

            </select>

        </div>

        <!-- STATS -->

        <div class="stats-grid">

            <!-- CLIENTS -->

            <div class="stat-card card-purple">

                <div class="card-icon">

                    <i class="fa-solid fa-users"></i>

                </div>

                <div class="card-info">

                    <h4>Total Clients</h4>

                    <h2>

                        <%= totalClients %>

                    </h2>

                    <p>
                        Registered clients
                    </p>

                </div>

            </div>

            <!-- TASKS -->

            <div class="stat-card card-cyan">

                <div class="card-icon">

                    <i class="fa-solid fa-list-check"></i>

                </div>

                <div class="card-info">

                    <h4>Total Tasks</h4>

                    <h2>

                        <%= totalTasks %>

                    </h2>

                    <p>
                        Workflow management
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

                    <h2>

                        ₹ <%= totalRevenue %>

                    </h2>

                    <p>
                        Business earnings
                    </p>

                </div>

            </div>

        </div>

        <!-- CHARTS -->

        <div class="table-box">

            <h3 style="margin-bottom:20px;">

                CRM Analytics Overview

            </h3>

            <div class="chart-container">

                <canvas id="crmChart"></canvas>

            </div>

        </div>

    </div>

</div>

<!-- CHART -->

<script>

const ctx =
document.getElementById(
'crmChart'
);

new Chart(ctx, {

    type:'bar',

    data:{

        labels:[
            'Clients',
            'Tasks',
            'Communications',
            'Revenue'
        ],

        datasets:[{

            label:'CRM Analytics',

            data:[

                <%= totalClients %>,

                <%= totalTasks %>,

                <%= totalCommunications %>,

                <%= totalRevenue %>
            ],

            borderWidth:2,

            borderRadius:12
        }]
    },

    options:{

        responsive:true,

        maintainAspectRatio:false
    }
});
</script>

<script src="js/theme.js"></script>

</body>

</html>