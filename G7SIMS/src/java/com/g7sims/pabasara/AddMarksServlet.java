package com.g7sims.pabasara;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import static java.lang.System.out;
import java.util.List;
import java.sql.SQLException;

@WebServlet("/AddMarksServlet")
public class AddMarksServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String sid = request.getParameter("sid");
        String oop = request.getParameter("oop");
        String se = request.getParameter("se");
        String dms = request.getParameter("dms");
        String cn = request.getParameter("cn");
        String ossa = request.getParameter("ossa");
        String credits = request.getParameter("credits");
        String gpa = request.getParameter("gpa");

        boolean result;

        try {
            result = ExamUnitDB.insertGrades(sid, oop, se, dms, cn, ossa, credits, gpa);

            if (result == true) {

                List<ExamUnit> details = ExamUnitDB.getAllData();
                request.setAttribute("details", details);

                RequestDispatcher dis1 = request.getRequestDispatcher("Pabasara/examUnitDashboard.jsp");
                dis1.forward(request, response);
            } else {
                RequestDispatcher dis2 = request.getRequestDispatcher("Pabasara/Error.jsp");
                dis2.forward(request, response);
            }
        } catch (SQLException sqlE) {
            
            out.println("<h2>Error! : " + sqlE.getMessage() + "</h2>");
        }

    }

}
