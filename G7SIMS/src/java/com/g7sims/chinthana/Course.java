/*
IT22090294
Chinthana Weligamage
G7SIMS - School Information Management System
 */
package com.g7sims.chinthana;

public class Course {

    private int courseID;
    private int courseDuration;
    private String courseFee;
    private String courseLevel;
    private String courseDescription;
    private int studentCount;

    public Course(int courseID) {
        this.courseID = courseID;
    }

    public Course(int courseDuration, String courseFee, String courseLevel, String courseDescription) {
        this.courseDuration = courseDuration;
        this.courseFee = courseFee;
        this.courseLevel = courseLevel;
        this.courseDescription = courseDescription;
    }

    public Course(int courseID, int courseDuration, String courseFee, String courseLevel, String courseDescription) {
        this.courseID = courseID;
        this.courseDuration = courseDuration;
        this.courseFee = courseFee;
        this.courseLevel = courseLevel;
        this.courseDescription = courseDescription;
    }

    public Course(int courseID, String courseDescription, int studentCount) {
        this.courseID = courseID;
        this.courseDescription = courseDescription;
        this.studentCount = studentCount;
    }

    public int getCourseID() {
        return courseID;
    }

    public int getCourseDuration() {
        return courseDuration;
    }

    public String getCourseFee() {
        return courseFee;
    }

    public String getCourseLevel() {
        return courseLevel;
    }

    public String getCourseDiscription() {
        return courseDescription;
    }

    public int getStudentCount() {
        return studentCount;
    }

}
