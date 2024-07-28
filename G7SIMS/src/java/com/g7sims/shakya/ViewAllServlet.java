package com.g7sims.shakya;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//@WebServlet("/ViewAll")
public class ViewAllServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<User> allAdmins = UserDBUtil.getAllAdmins(); // Modify AdminDBUtil to fetch all records.
        request.setAttribute("allAdmins", allAdmins);

        RequestDispatcher dispatcher = request.getRequestDispatcher("Shakya/ViewAll.jsp");
        dispatcher.forward(request, response);

    }

}
