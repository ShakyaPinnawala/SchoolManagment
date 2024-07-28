package com.g7sims.ishini;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

//@WebServlet("/CustomerInsert")
public class InsertServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String course = request.getParameter("course");
        String method = request.getParameter("method");
        String status = request.getParameter("status");
        String date = request.getParameter("date");
        String fees = request.getParameter("fees");

        boolean isTrue;

        isTrue = UserDBUtil.insertcustomer(name, course, method, status, date, fees);

        if (isTrue == true) {
            RequestDispatcher dis = request.getRequestDispatcher("/Ishini/Home.jsp");
            dis.forward(request, response);
        } else {
            RequestDispatcher dis2 = request.getRequestDispatcher("/Ishini/unsuccess.jsp");
            dis2.forward(request, response);
        }

    }

}
