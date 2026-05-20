package com.crm;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.crm.dao.TaskDAO;
import com.crm.model.Task;

@WebServlet("/AddTaskServlet")

public class AddTaskServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)

            throws ServletException, IOException {

        // FORM DATA

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

        // TASK OBJECT

        Task t = new Task();

        t.setTaskName(taskName);

        t.setClientName(clientName);

        t.setPriority(priority);

        t.setStatus(status);

        t.setDueDate(dueDate);

        // DAO

        TaskDAO dao =
        new TaskDAO();

        dao.addTask(t);

        // REDIRECT

        response.sendRedirect(
        "tasks.jsp?msg=success"
        );
    }

}