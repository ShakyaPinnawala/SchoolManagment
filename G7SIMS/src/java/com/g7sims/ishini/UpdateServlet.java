package com.g7sims.ishini;

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
        String course = request.getParameter("course");
        String method = request.getParameter("method");
        String status = request.getParameter("status");
        String date = request.getParameter("date");
        String fees = request.getParameter("fees");

        boolean isTrue;

        isTrue = UserDBUtil.updatecustomer(id, name, course, method, status, date, fees);

        if (isTrue == true) {

            List<User> cusDetails = UserDBUtil.getCustomerDetails(id);
            request.setAttribute("cusDetails", cusDetails);

            RequestDispatcher dis = request.getRequestDispatcher("Ishini/Display.jsp");
            dis.forward(request, response);
        } else {
            List<User> cusDetails = UserDBUtil.getCustomerDetails(id);
            request.setAttribute("cusDetails", cusDetails);

            RequestDispatcher dis = request.getRequestDispatcher("Display.jsp");
            dis.forward(request, response);
        }
    }

}
