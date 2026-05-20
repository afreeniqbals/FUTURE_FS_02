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

<title>Files</title>

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

            <li onclick="window.location.href='viewClients.jsp'">

                <i class="fa-solid fa-users"></i>

                Clients

            </li>

            <li onclick="window.location.href='tasks.jsp'">

                <i class="fa-solid fa-list-check"></i>

                Tasks

            </li>

            <li onclick="window.location.href='communications.jsp'">

                <i class="fa-solid fa-comments"></i>

                Communications

            </li>

            <li class="active">

                <i class="fa-solid fa-folder-open"></i>

                Files

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
                    File Management
                </h2>

                <p class="dashboard-subtitle">
                    Upload and manage all client documents beautifully.
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

        <!-- HERO -->

        <div class="welcome-banner">

            <div class="welcome-content">

                <h2>
                    File Storage 📁
                </h2>

                <p>
                    Store contracts, invoices, PDFs,
                    screenshots and important client documents securely.
                </p>

            </div>

            <div class="welcome-circle">

                <i class="fa-solid fa-folder-open"></i>

            </div>

        </div>

        <!-- UPLOAD BUTTON -->

        <div style="margin-bottom:25px;">

            <a href="uploadFile.jsp"
               class="search-btn"
               style="text-decoration:none;
                      display:inline-flex;
                      align-items:center;">

                <i class="fa-solid fa-upload"></i>

                &nbsp; Upload File

            </a>

        </div>

        <!-- SUCCESS -->

        <%
        String msg =
        request.getParameter("msg");

        if("success".equals(msg)){
        %>

        <div class="mini-tag"
             style="margin-bottom:20px;">

            File Uploaded Successfully 📁

        </div>

        <%
        }
        %>

        <!-- FILE GRID -->

        <div class="stats-grid">

        <%

        Connection con =
        DBConnection.getConnection();

        PreparedStatement ps =
        con.prepareStatement(

        "SELECT * FROM files ORDER BY uploaded_at DESC"

        );

        ResultSet rs =
        ps.executeQuery();

        while(rs.next()){
        %>

        <!-- FILE CARD -->

        <div class="stat-card">

            <!-- ICON -->

            <div class="card-icon"
                 style="background:linear-gradient(135deg,#8b5cf6,#06b6d4);">

                <i class="fa-solid fa-file"></i>

            </div>

            <!-- INFO -->

            <div class="card-info">

                <h4>

                    <%= rs.getString("client_name") %>

                </h4>

                <p style="margin-bottom:14px;">

                    <%= rs.getString("file_name") %>

                </p>

                <!-- DOWNLOAD -->

                <a href="uploads/<%= rs.getString("file_name") %>"
                   target="_blank"
                   class="search-btn"
                   style="text-decoration:none;
                          display:inline-flex;
                          align-items:center;
                          height:42px;
                          padding:0 18px;
                          font-size:13px;">

                    <i class="fa-solid fa-download"></i>

                    &nbsp; Open File

                </a>

            </div>

        </div>

        <%
        }
        %>

        </div>

    </div>

</div>

<script src="js/theme.js"></script>

</body>

</html>