package com.g7sims.pabasara;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/updateExamDetailsServlet")
public class updateExamDetailsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

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

        result = ExamUnitDB.updateExamDetails(sid, oop, se, dms, cn, ossa, credits, gpa);

        try {
            if (result) {

                List<ExamUnit> getAllData = ExamUnitDB.getAllData();
                request.setAttribute("getAllData", getAllData);

                if (getAllData.isEmpty()) {
                    RequestDispatcher dis2 = request.getRequestDispatcher("/Pabasara/Error.jsp");
                    dis2.forward(request, response);
                } else {
                    request.setAttribute("details", getAllData);
                    RequestDispatcher dis2 = request.getRequestDispatcher("/Pabasara/examUnitDashboard.jsp");
                    dis2.forward(request, response);
                }
            } else {
                RequestDispatcher dis = request.getRequestDispatcher("/Pabasara/Error.jsp");
                dis.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
