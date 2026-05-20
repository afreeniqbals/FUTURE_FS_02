package com.crm;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddCommunicationServlet")

public class AddCommunicationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)

            throws ServletException, IOException {

        // FORM DATA

        String clientName =
        request.getParameter("client_name");

        String type =
        request.getParameter("type");

        String message =
        request.getParameter("message");

        try {

            Connection con =
            DBConnection.getConnection();

            PreparedStatement ps =
            con.prepareStatement(

            "INSERT INTO communications(client_name, type, message) VALUES(?,?,?)"

            );

            ps.setString(1, clientName);

            ps.setString(2, type);

            ps.setString(3, message);

            ps.executeUpdate();

            response.sendRedirect(
            "communications.jsp?msg=success"
            );

        } catch (Exception e) {

            e.printStackTrace();
        }

    }

}