package com.crm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.crm.DBConnection;
import com.crm.model.Task;

public class TaskDAO {

    // ADD TASK

    public void addTask(Task t) {

        try {

            Connection con =
            DBConnection.getConnection();

            PreparedStatement ps =
            con.prepareStatement(

            "INSERT INTO tasks(task_name, client_name, priority, status, due_date) VALUES(?,?,?,?,?)"

            );

            ps.setString(1,
            t.getTaskName());

            ps.setString(2,
            t.getClientName());

            ps.setString(3,
            t.getPriority());

            ps.setString(4,
            t.getStatus());

            ps.setString(5,
            t.getDueDate());

            ps.executeUpdate();

        } catch (Exception e) {

            e.printStackTrace();
        }

    }

}