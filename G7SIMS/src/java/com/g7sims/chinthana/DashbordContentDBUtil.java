package com.g7sims.chinthana;

import java.sql.ResultSet;

public class DashbordContentDBUtil {

    private DatabaseConnection dbConnect;
    private ResultSet resSet;
    private String query;

    public int countStudents() throws Exception {
        dbConnect = new DatabaseConnection();
        int numberOfStudents = 0;

        try {
            query = "SELECT COUNT(*) as NumberOfStudents FROM g7sims_db.student";
            resSet = dbConnect.getResults(query);
            resSet.next();
            numberOfStudents = resSet.getInt("NumberOfStudents");

        } finally {
            // close JDBC objects
            close(resSet);
            dbConnect.Close();
        }
        return numberOfStudents;
    }
    
    public int countTeachers() throws Exception {
        dbConnect = new DatabaseConnection();
        int numberOfTeachers = 0;

        try {
            query = "SELECT COUNT(*) as NumberOfTeachers FROM g7sims_db.teacher";
            resSet = dbConnect.getResults(query);
            resSet.next();
            numberOfTeachers = resSet.getInt("NumberOfTeachers");

        } finally {
            // close JDBC objects
            close(resSet);
            dbConnect.Close();
        }
        return numberOfTeachers;
    }
    
    public int countCourses() throws Exception {
        dbConnect = new DatabaseConnection();
        int numberOfCourses = 0;

        try {
            query = "SELECT COUNT(*) as NumberOfCourses FROM g7sims_db.Course";
            resSet = dbConnect.getResults(query);
            resSet.next();
            numberOfCourses = resSet.getInt("NumberOfCourses");

        } finally {
            // close JDBC objects
            close(resSet);
            dbConnect.Close();
        }
        return numberOfCourses;
    }
    
    public int countSubjects() throws Exception {
        dbConnect = new DatabaseConnection();
        int numberOfSubjects = 0;

        try {
            query = "SELECT COUNT(*) as NumberOfSubjects FROM g7sims_db.subject";
            resSet = dbConnect.getResults(query);
            resSet.next();
            numberOfSubjects = resSet.getInt("NumberOfSubjects");

        } finally {
            // close JDBC objects
            close(resSet);
            dbConnect.Close();
        }
        return numberOfSubjects;
    }
    
    

    private void close(ResultSet resSet) {
        try {
            if (resSet != null) {
                resSet.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
