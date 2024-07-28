<%-- 
    IT22090294
    Chinthana Weligamage
    G7SIMS - School Information Management System
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*" %>

<%
    HttpSession currentSession = request.getSession(false); // Retrieve the current session without creating a new one if it doesn't exist

    if (currentSession != null) {
        currentSession.invalidate(); // Invalidate the session
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>G7SIMS - School Information Management System</title>
</head>
<body>

<jsp:include page="Chinthana/LoginPage.jsp" />

</body>
</html>
