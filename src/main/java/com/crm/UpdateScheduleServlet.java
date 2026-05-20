package com.crm;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateScheduleServlet")

public class UpdateScheduleServlet
extends HttpServlet{

protected void doPost(
HttpServletRequest request,
HttpServletResponse response)

throws ServletException,
IOException{

int id =
Integer.parseInt(
request.getParameter(
"id"
)
);

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

"UPDATE schedules SET title=?, schedule_date=?, schedule_time=? WHERE id=?"

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

ps.setInt(
4,
id
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