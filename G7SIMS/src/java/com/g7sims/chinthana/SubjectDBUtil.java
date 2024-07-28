package com.g7sims.chinthana;

import java.sql.ResultSet;
import java.util.ArrayList;

public class SubjectDBUtil {

    private DatabaseConnection dbConnect;
    private ResultSet resSet;
    private String query;

    public ArrayList<Subject> getAllSubjects() throws Exception {
        dbConnect = new DatabaseConnection();
        ArrayList<Subject> subjects = new ArrayList<>();

        try {
            query = "SELECT SubjectID, SubjectName, SubjectDiscription, Subject.CourseID, CourseDiscription FROM g7sims_db.Subject "
                    + "LEFT JOIN g7sims_db.Course ON Subject.CourseID = Course.CourseID;";
            
            resSet = dbConnect.getResults(query);

            // process results set
            while (resSet.next()) {
                int subjectID = resSet.getInt("SubjectID");
                String subjectName = resSet.getString("SubjectName");
                String subjectDiscription = resSet.getString("SubjectDiscription");
                int courseID = resSet.getInt("CourseID");
                String courseDiscription = resSet.getString("CourseDiscription");

                Subject tempSubject = new Subject(subjectID, subjectName, subjectDiscription, courseID, courseDiscription);
                subjects.add(tempSubject);
            }

            return subjects;
        } finally {
            // close JDBC objects
            close(resSet);
            dbConnect.Close();
        }
    }

    public int addNewCourse(Course tempCourse) throws Exception {
        dbConnect = new DatabaseConnection();
        int res = -1;

        try {
            query = "INSERT INTO g7sims_db.course (CourseDuration, CourseFee, CourseLevel, CourseDiscription)"
                    + " VALUES ('" + tempCourse.getCourseDuration() + "', '" + tempCourse.getCourseFee() + "', '"
                    + tempCourse.getCourseLevel() + "', '" + tempCourse.getCourseDiscription() + "')";

            res = dbConnect.executeUpdates(query);

        } finally {
            // close JDBC objects
            close(resSet);
            dbConnect.Close();
        }
        return res;
    }

    public int updateCourse(Course tempCourse) throws Exception {
        dbConnect = new DatabaseConnection();
        int res = -1;

        try {

            String formattedCourseFee = tempCourse.getCourseFee();

            // Remove "$" and commas and parse it to an integer
            int courseFee = Integer.parseInt(formattedCourseFee.replaceAll("[^\\d]", ""));

            // Now you have the course fee as an integer
            query = "UPDATE g7sims_db.course SET CourseDuration = '" + tempCourse.getCourseDuration() + "', CourseFee = '" + courseFee
                    + "', CourseLevel = '" + tempCourse.getCourseLevel() + "', CourseDiscription = '" + tempCourse.getCourseDiscription() + "' WHERE CourseID = '" + tempCourse.getCourseID() + "'";

            res = dbConnect.executeUpdates(query);

        } finally {
            // close JDBC objects
            close(resSet);
            dbConnect.Close();
        }
        return res;
    }

    public int deleteCourse(Course tempCourse) throws Exception {
        dbConnect = new DatabaseConnection();
        int res = -1;

        try {
            query = "UPDATE g7sims_db.subject SET CourseID = NULL WHERE CourseID IN ('" + tempCourse.getCourseID() + "')";

            dbConnect.executeUpdates(query);

            query = "DELETE FROM g7sims_db.course WHERE CourseID = '" + tempCourse.getCourseID() + "'";

            res = dbConnect.executeUpdates(query);

        } finally {
            // close JDBC objects
            close(resSet);
            dbConnect.Close();
        }
        return res;
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
