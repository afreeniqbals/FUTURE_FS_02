package com.crm;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteScheduleServlet")

public class DeleteScheduleServlet
extends HttpServlet{

protected void doGet(
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

try{

Connection con =
DBConnection.getConnection();

PreparedStatement ps =
con.prepareStatement(

"DELETE FROM schedules WHERE id=?"

);

ps.setInt(
1,
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