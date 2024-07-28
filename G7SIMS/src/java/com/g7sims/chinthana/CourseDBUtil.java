/*
IT22090294
Chinthana Weligamage
G7SIMS - School Information Management System
 */
package com.g7sims.chinthana;

import java.sql.ResultSet;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import static java.util.Locale.*;

public class CourseDBUtil {

    private DatabaseConnection dbConnect;
    private ResultSet resSet;
    private String query;

    public ArrayList<Course> getAllCourses() throws Exception {
        dbConnect = new DatabaseConnection();
        ArrayList<Course> courses = new ArrayList<>();

        try {
            query = "SELECT * FROM g7sims_db.course";
            resSet = dbConnect.getResults(query);

            // process results set
            while (resSet.next()) {
                int courseID = resSet.getInt("CourseID");
                int courseDuration = resSet.getInt("CourseDuration");
                int amount = resSet.getInt("CourseFee");
                String courseLevel = resSet.getString("CourseLevel");
                String courseDescription = resSet.getString("CourseDiscription");

                NumberFormat formatter = NumberFormat.getCurrencyInstance(US);
                String courseFee = formatter.format(amount);

                Course tempCourse = new Course(courseID, courseDuration, courseFee, courseLevel, courseDescription);
                courses.add(tempCourse);
            }

            return courses;
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

    public ArrayList<Course> getCoursesGraphData() throws Exception {
        dbConnect = new DatabaseConnection();
        ArrayList<Course> courses = new ArrayList<>();

        try {
            query = "SELECT c.CourseID, c.CourseDiscription, COALESCE(COUNT(s.StudentID), 0) AS TotalStudents FROM g7sims_db.Course c "
                  + "LEFT JOIN g7sims_db.Student s ON c.CourseID = s.CourseID GROUP BY c.CourseID, c.CourseDiscription";

            resSet = dbConnect.getResults(query);

            // process results set
            while (resSet.next()) {
                int courseID = resSet.getInt("CourseID");
                String courseDescription = resSet.getString("CourseDiscription");
                int studentCount = resSet.getInt("TotalStudents");

                Course tempCourse = new Course(courseID, courseDescription, studentCount);
                courses.add(tempCourse);
            }

            return courses;
        } finally {
            // close JDBC objects
            close(resSet);
            dbConnect.Close();
        }
    }

    private String convertToJSON(List<Course> courses) {
        StringBuilder json = new StringBuilder("[");
        for (Course course : courses) {
            json.append("{");
            json.append("\"courseID\":\"").append(course.getCourseID()).append("\",");
            json.append("\"courseName\":\"").append(course.getCourseDiscription()).append("\",");
            json.append("\"studentCount\":\"").append(course.getStudentCount()).append("\"");
            json.append("},");
        }
        if (!courses.isEmpty()) {
            json.deleteCharAt(json.length() - 1); // Remove trailing comma for last entry
        }
        json.append("]");
        return json.toString();
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
