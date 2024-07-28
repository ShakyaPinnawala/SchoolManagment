<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Session Values</title>
</head>
<body>

<%
// Retrieve session attributes
String currentUserID = (String) session.getAttribute("currentUserID");
String currentUserType = (String) session.getAttribute("currentUserType");
%>

<h1>Welcome, <%= currentUserID %>!</h1>
<p>Your user type is <%= currentUserType %>.</p>

</body>
</html>
