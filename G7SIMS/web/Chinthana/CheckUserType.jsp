<%-- 
    IT22090294
    Chinthana Weligamage
    G7SIMS - School Information Management System
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*" %>

<%
    try {
        HttpSession checkSession = request.getSession(false); // Retrieve the current session without creating a new one if it doesn't exist
        
        if (session == null) {
            // Redirect to login if session is not found
            response.sendRedirect("/G7SIMS");
        }
        
        String currentUserType = (String) session.getAttribute("currentUserType");
        
        if (currentUserType == null) {
            // Redirect to login if userType is not found in session
            response.sendRedirect("/G7SIMS");
        }
        
        if (currentUserType.equals("admin")) {
            response.sendRedirect("AdminContent/AdminDashboard.jsp");
            
        } else if (currentUserType.equals("examunit")) {
            response.sendRedirect("../Pabasara/Home.jsp");

        } else if (currentUserType.equals("financeunit")) {
        response.sendRedirect("../Ishini/Home.jsp");

        } else if (currentUserType.equals("teacher")) {
        response.sendRedirect("../Shakya/Home.jsp");

        } else if (currentUserType.equals("student")) {
        response.sendRedirect("/G7SIMS");
        
        } else {
            response.sendRedirect("/G7SIMS");
        }
    }
    
    catch (Exception e) {
        e.printStackTrace();
        //response.sendRedirect("/G7SIMS");
    }
%>
