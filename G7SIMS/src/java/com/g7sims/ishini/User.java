package com.g7sims.ishini;

public class User {

    private int id;
    private String name;
    private String course;
    private String method;
    private String status;
    private String date;
    private String fees;

    public User(int id, String name, String course, String method, String status, String date, String fees) {
        super();
        this.id = id;
        this.name = name;
        this.course = course;
        this.method = method;
        this.status = status;
        this.date = date;
        this.fees = fees;
    }

    public User(String name, String course, String method, String status, String date, String fees) {
        this.name = name;
        this.course = course;
        this.method = method;
        this.status = status;
        this.date = date;
        this.fees = fees;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getFees() {
        return fees;
    }

    public void setFees(String fees) {
        this.fees = fees;
    }

}
