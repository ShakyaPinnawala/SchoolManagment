package com.g7sims.shakya;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.List;

//@WebServlet("/LoginServlet")
public class SearchServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        String name = request.getParameter("name");

        try {
            List<User> cusDetails = UserDBUtil.validate(id, name);
            request.setAttribute("cusDetails", cusDetails);

        } catch (Exception e) {
            e.printStackTrace();
        }

        RequestDispatcher dis = request.getRequestDispatcher("Shakya/Display.jsp");
        dis.forward(request, response);
    }

}
