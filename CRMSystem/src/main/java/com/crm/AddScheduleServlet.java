package com.crm;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddScheduleServlet")

public class AddScheduleServlet
extends HttpServlet{

protected void doPost(
HttpServletRequest request,
HttpServletResponse response)

throws ServletException,
IOException{

String title =
request.getParameter(
"title"
);

String scheduleDate =
request.getParameter(
"schedule_date"
);

String scheduleTime =
request.getParameter(
"schedule_time"
);

try{

Connection con =
DBConnection.getConnection();

PreparedStatement ps =
con.prepareStatement(

"INSERT INTO schedules(title,schedule_date,schedule_time) VALUES(?,?,?)"

);

ps.setString(
1,
title
);

ps.setString(
2,
scheduleDate
);

ps.setString(
3,
scheduleTime
);

ps.executeUpdate();

response.sendRedirect(
"calendar.jsp"
);

}
catch(Exception e){

e.printStackTrace();
}

}
}