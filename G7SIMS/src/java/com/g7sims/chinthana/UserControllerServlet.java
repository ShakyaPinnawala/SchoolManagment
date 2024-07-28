/*
IT22090294
Chinthana Weligamage
G7SIMS - School Information Management System
 */
package com.g7sims.chinthana;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

public class UserControllerServlet extends HttpServlet {

    private UserDBUtil userDBUtil;

    @Override
    public void init() throws ServletException {
        super.init();

        // create student db util and pass in the conn pool
        try {
            // userDBUtil = new UserDBUtil(dataSource);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // list the students
            listUsers(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }

    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws Exception {

        // get student from db util
        List<User> users = userDBUtil.getUser();

        // add students to the request
        request.setAttribute("USER_LIST", users);

        //send to JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/list-users.jsp");
        dispatcher.forward(request, response);

    }

}
