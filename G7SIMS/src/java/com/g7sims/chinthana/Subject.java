package com.g7sims.chinthana;

public class Subject {

    private int subjectID;
    private String subjectName;
    private String subjectDescription;
    private int courseID;
    private String courseDescription;

    public Subject(int subjectID, String subjectName, String subjectDescription, int courseID, String courseDescription) {
        this.subjectID = subjectID;
        this.subjectName = subjectName;
        this.subjectDescription = subjectDescription;
        this.courseID = courseID;
        this.courseDescription = courseDescription;
    }

    public int getSubjectID() {
        return subjectID;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public String getSubjectDescription() {
        return subjectDescription;
    }

    public int getCourseID() {
        return courseID;
    }

    public String getCourseDescription() {
        return courseDescription;
    }

    
}
