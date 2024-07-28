/*
IT22090294
Chinthana Weligamage
G7SIMS - School Information Management System
 */
package com.g7sims.chinthana;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class LoginControlServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String direction = "/G7SIMS";
        Cookie[] cookies = request.getCookies();
        String cookieString = "0";
        int cookieMaxAgeInSeconds = 60; // 1 min
        Boolean isAvailable = true;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("loginAttemt")) {
                    int cookieValue = Integer.decode(cookie.getValue());
                    if (cookieValue < 3) {
                        isAvailable = true;
                        cookieString = String.valueOf(cookieValue + 1);
                    } else {
                        cookieString = String.valueOf(10);
                        isAvailable = false;
                    }
                }
            }
        }

        Cookie loginAttemptCookie = new Cookie("loginAttemt", cookieString);
        loginAttemptCookie.setMaxAge(cookieMaxAgeInSeconds);

        response.addCookie(loginAttemptCookie);

        if (isAvailable) {
            try {
                var userDBUtil = new UserDBUtil();
                ArrayList<String> userData = userDBUtil.CheckUser(request.getParameter("txtUsername"), request.getParameter("txtPassword"));

                if (!(userData == null)) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("currentUserID", userData.get(0));
                    session.setAttribute("currentUserType", userData.get(1));
                    session.setAttribute("currentUsername", userData.get(2));
                    direction = "/G7SIMS/Chinthana/CheckUserType.jsp";
                    loginAttemptCookie = new Cookie("loginAttemt", null);
                    loginAttemptCookie.setMaxAge(0);
                    response.addCookie(loginAttemptCookie);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect(direction);
    }

}
