package com.g7sims.shakya;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//@WebServlet("/UpdateCustomerServlet")
public class UpdateServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String subject = request.getParameter("subject");
        String date = request.getParameter("date");
        String lecture = request.getParameter("lecture");
        String recording = request.getParameter("recording");
        String duration = request.getParameter("duration");

        boolean isTrue;

        isTrue = UserDBUtil.updatecustomer(id, name, subject, date, lecture, recording, duration);

        if (isTrue == true) {

            List<User> cusDetails = UserDBUtil.getCustomerDetails(id);
            request.setAttribute("cusDetails", cusDetails);

            RequestDispatcher dis = request.getRequestDispatcher("Shakya/Display.jsp");
            dis.forward(request, response);
        } else {
            List<User> cusDetails = UserDBUtil.getCustomerDetails(id);
            request.setAttribute("cusDetails", cusDetails);

            RequestDispatcher dis = request.getRequestDispatcher("Shakya/Display.jsp");
            dis.forward(request, response);
        }
    }

}
