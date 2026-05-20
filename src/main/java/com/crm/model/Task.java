package com.crm.model;

public class Task {

    private int id;

    private String taskName;

    private String clientName;

    private String priority;

    private String status;

    private String dueDate;

    // GET ID

    public int getId() {

        return id;
    }

    // SET ID

    public void setId(int id) {

        this.id = id;
    }

    // GET TASK NAME

    public String getTaskName() {

        return taskName;
    }

    // SET TASK NAME

    public void setTaskName(String taskName) {

        this.taskName = taskName;
    }

    // GET CLIENT NAME

    public String getClientName() {

        return clientName;
    }

    // SET CLIENT NAME

    public void setClientName(String clientName) {

        this.clientName = clientName;
    }

    // GET PRIORITY

    public String getPriority() {

        return priority;
    }

    // SET PRIORITY

    public void setPriority(String priority) {

        this.priority = priority;
    }

    // GET STATUS

    public String getStatus() {

        return status;
    }

    // SET STATUS

    public void setStatus(String status) {

        this.status = status;
    }

    // GET DUE DATE

    public String getDueDate() {

        return dueDate;
    }

    // SET DUE DATE

    public void setDueDate(String dueDate) {

        this.dueDate = dueDate;
    }

}