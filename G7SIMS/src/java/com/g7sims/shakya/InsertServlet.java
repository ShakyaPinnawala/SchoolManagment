package com.g7sims.shakya;

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
        String subject = request.getParameter("subject");
        String date = request.getParameter("date");
        String lecture = request.getParameter("lecture");
        String recording = request.getParameter("recording");
        String duration = request.getParameter("duration");

        boolean isTrue;

        isTrue = UserDBUtil.insertcustomer(name, subject, date, lecture, recording, duration);

        if (isTrue == true) {
            RequestDispatcher dis = request.getRequestDispatcher("Shakya/Home.jsp");
            dis.forward(request, response);
        } else {
            RequestDispatcher dis2 = request.getRequestDispatcher("Shakya/unsuccess.jsp");
            dis2.forward(request, response);
        }

    }

}
