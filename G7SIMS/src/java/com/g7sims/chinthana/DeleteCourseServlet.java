package com.g7sims.chinthana;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


public class DeleteCourseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String id = request.getParameter("DeleteCourseID");

            Course tempCourse = new Course(Integer.decode(id));

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Deleting...</title>");
            out.println("<style> body {background-color: #2e59d9;}</style>");
            out.println("</head>");
            out.println("<body>");

            try {
                int rowsAffected = new CourseDBUtil().deleteCourse(tempCourse);

                if (rowsAffected > 0) {
                    // Data deleted successfully
                    out.println("<script>window.alert('Data Deleted successfully!')</script>");
                } else {
                    out.println("<script>window.alert('Failed to Deleted data.')</script>");
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
