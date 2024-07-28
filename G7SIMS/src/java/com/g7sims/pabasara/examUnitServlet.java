package com.g7sims.pabasara;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//inherit HttpServlet class
public class examUnitServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<ExamUnit> details = ExamUnitDB.getAllData();
        request.setAttribute("details", details);

        RequestDispatcher dis1 = request.getRequestDispatcher("/Pabasara/examUnitDashboard.jsp");
        dis1.forward(request, response);
    }
}
