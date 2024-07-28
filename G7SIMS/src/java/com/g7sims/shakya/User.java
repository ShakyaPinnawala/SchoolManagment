package com.g7sims.shakya;

public class User {

    private int id;
    private String name;
    private String subject;
    private String date;
    private String lecture;
    private String recording;
    private String duration;

    public User(int id, String name, String subject, String date, String lecture, String recording, String duration) {
        super();
        this.id = id;
        this.name = name;
        this.subject = subject;
        this.date = date;
        this.lecture = lecture;
        this.recording = recording;
        this.duration = duration;
    }

    public User(String name, String subject, String date, String lecture, String recording, String duration) {
        this.name = name;
        this.subject = subject;
        this.date = date;
        this.lecture = lecture;
        this.recording = recording;
        this.duration = duration;
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

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getLecture() {
        return lecture;
    }

    public void setLecture(String lecture) {
        this.lecture = lecture;
    }

    public String getRecording() {
        return recording;
    }

    public void setRecording(String recording) {
        this.recording = recording;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

}
