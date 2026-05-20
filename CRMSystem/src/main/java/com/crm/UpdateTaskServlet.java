package com.crm;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateTaskServlet")

public class UpdateTaskServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)

            throws ServletException, IOException {

        int id =
        Integer.parseInt(
        request.getParameter("id")
        );

        String taskName =
        request.getParameter("task_name");

        String clientName =
        request.getParameter("client_name");

        String priority =
        request.getParameter("priority");

        String status =
        request.getParameter("status");

        String dueDate =
        request.getParameter("due_date");

        try {

            Connection con =
            DBConnection.getConnection();

            PreparedStatement ps =
            con.prepareStatement(

            "UPDATE tasks SET task_name=?, client_name=?, priority=?, status=?, due_date=? WHERE id=?"

            );

            ps.setString(1, taskName);

            ps.setString(2, clientName);

            ps.setString(3, priority);

            ps.setString(4, status);

            ps.setString(5, dueDate);

            ps.setInt(6, id);

            ps.executeUpdate();

            response.sendRedirect(
            "tasks.jsp?msg=updated"
            );

        } catch (Exception e) {

            e.printStackTrace();
        }

    }

}