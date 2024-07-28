package com.g7sims.ishini;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//@WebServlet("/DeleteCustomerServlet")
public class DeleteServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        boolean isTrue;

        isTrue = UserDBUtil.deleteCustomer(id);

        if (isTrue == true) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("Ishini/Home.jsp");
            dispatcher.forward(request, response);
        } else {

            List<User> cusDetails = UserDBUtil.getCustomerDetails(id);
            request.setAttribute("cusDetails", cusDetails);

            RequestDispatcher dispatcher = request.getRequestDispatcher("Ishini/Display.jsp");
            dispatcher.forward(request, response);
        }

    }

}
