package com.crm;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateSettingsServlet")

public class UpdateSettingsServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)

            throws ServletException, IOException {

        String username =
        request.getParameter("username");

        String email =
        request.getParameter("email");

        String password =
        request.getParameter("password");

        HttpSession session =
        request.getSession();

        String oldEmail =
        (String) session.getAttribute(
        "userEmail"
        );

        try {

            Connection con =
            DBConnection.getConnection();

            PreparedStatement ps =
            con.prepareStatement(

            "UPDATE users SET email=?, password=? WHERE email=?"

            );

            ps.setString(1, email);

            ps.setString(2, password);

            ps.setString(3, oldEmail);

            ps.executeUpdate();

            // UPDATE SESSION

            session.setAttribute(
            "userEmail",
            email
            );

            response.sendRedirect(
            "settings.jsp?msg=success"
            );

        } catch (Exception e) {

            e.printStackTrace();
        }

    }

}