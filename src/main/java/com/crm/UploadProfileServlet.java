package com.crm;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UploadProfileServlet")

@MultipartConfig

public class UploadProfileServlet
extends HttpServlet{

protected void doPost(

HttpServletRequest request,

HttpServletResponse response)

throws ServletException,
IOException{

Part filePart =
request.getPart(
"profileImage"
);

String fileName =
Paths.get(

filePart.getSubmittedFileName()

).getFileName()
.toString();

String uploadPath =

getServletContext()
.getRealPath("")

+"uploads";

File folder =
new File(uploadPath);

if(!folder.exists()){

folder.mkdir();
}

filePart.write(

uploadPath
+ File.separator
+ fileName

);

HttpSession session =
request.getSession();

String email =

(String)
session.getAttribute(
"userEmail"
);

try{

Connection con =
DBConnection.getConnection();

PreparedStatement ps =
con.prepareStatement(

"UPDATE users SET profile_image=? WHERE email=?"

);

ps.setString(
1,
fileName
);

ps.setString(
2,
email
);

ps.executeUpdate();

response.sendRedirect(
"settings.jsp"
);

}
catch(Exception e){

e.printStackTrace();
}

}
}