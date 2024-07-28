/*
IT22090294
Chinthana Weligamage
G7SIMS - School Information Management System
 */
package com.g7sims.chinthana;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AddCourseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Publishing...</title>");
            out.println("<style> body {background-color: #2e59d9; color: #fff;}</style>");
            out.println("</head>");
            out.println("<body>");

            String courseDuration = request.getParameter("insertCourseDuration");
            String courseFee = request.getParameter("insertCourseFee");
            String courseLevel = request.getParameter("insertCourseLevel");
            String courseDescription = request.getParameter("insertCourseDescription");

            courseDuration = (courseDuration == null) ? "12" : courseDuration;

            Course tempCourse = new Course(Integer.decode(courseDuration), courseFee, courseLevel, courseDescription);

            try {
                int rowsAffected = new CourseDBUtil().addNewCourse(tempCourse);

                if (rowsAffected > 0) {
                    // Data added successfully
                    out.println("<script>window.alert('Data added successfully!')</script>");

                } else {
                    out.println("<script>window.alert('Failed to add data.')</script>");
                }

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Redirect to a success page or perform further actions
                response.sendRedirect("/G7SIMS/Chinthana/CheckUserType.jsp");
            }

            out.println("</body>");
            out.println("</html>");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
