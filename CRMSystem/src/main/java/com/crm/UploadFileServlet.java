package com.crm;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UploadFileServlet")

@MultipartConfig

public class UploadFileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)

            throws ServletException, IOException {

        // CLIENT NAME

        String clientName =
        request.getParameter("client_name");

        // FILE PART

        Part filePart =
        request.getPart("file");

        String fileName =
        filePart.getSubmittedFileName();

        // UPLOAD PATH

        String uploadPath =
        getServletContext().getRealPath("")
        + File.separator
        + "uploads";

        File uploadDir =
        new File(uploadPath);

        // CREATE FOLDER

        if(!uploadDir.exists()){

            uploadDir.mkdir();
        }

        // SAVE FILE

        filePart.write(
        uploadPath
        + File.separator
        + fileName
        );

        try {

            Connection con =
            DBConnection.getConnection();

            PreparedStatement ps =
            con.prepareStatement(

            "INSERT INTO files(client_name, file_name) VALUES(?,?)"

            );

            ps.setString(1, clientName);

            ps.setString(2, fileName);

            ps.executeUpdate();

            response.sendRedirect(
            "files.jsp?msg=success"
            );

        } catch (Exception e) {

            e.printStackTrace();
        }

    }

}