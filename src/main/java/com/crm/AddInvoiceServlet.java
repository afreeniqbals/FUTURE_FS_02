package com.crm;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddInvoiceServlet")

public class AddInvoiceServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)

            throws ServletException, IOException {

        // FORM DATA

        String clientName =
        request.getParameter("client_name");

        double amount =
        Double.parseDouble(
        request.getParameter("amount")
        );

        String status =
        request.getParameter("status");

        try {

            Connection con =
            DBConnection.getConnection();

            PreparedStatement ps =
            con.prepareStatement(

            "INSERT INTO invoices(client_name, amount, status) VALUES(?,?,?)"

            );

            ps.setString(1, clientName);

            ps.setDouble(2, amount);

            ps.setString(3, status);

            ps.executeUpdate();

            response.sendRedirect(
            "invoices.jsp?msg=success"
            );

        } catch (Exception e) {

            e.printStackTrace();
        }

    }

}