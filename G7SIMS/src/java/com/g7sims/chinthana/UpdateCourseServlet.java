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

public class UpdateCourseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Updating...</title>");
            out.println("<style> body {background-color: #2e59d9; color: #fff;}</style>");
            out.println("</head>");
            out.println("<body>");

            String courseID = request.getParameter("updatedCourseID");
            String courseDuration = request.getParameter("updatedCourseDuration");
            String courseFee = request.getParameter("updatedCourseFee");
            String courseLevel = request.getParameter("updatedCourseLevel");
            String courseDescription = request.getParameter("updatedCourseDescription");

            courseDuration = (courseDuration == null) ? "12" : courseDuration;

            Course tempCourse = new Course(Integer.decode(courseID), Integer.decode(courseDuration), courseFee, courseLevel, courseDescription);
            try {
                int rowsAffected = new CourseDBUtil().updateCourse(tempCourse);

                if (rowsAffected > 0) {
                    // Data updated successfully
                    out.println("<script>window.alert('Data updated successfully!')</script>");
                } else {
                    out.println("<script>window.alert('Failed to update data.')</script>");
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
