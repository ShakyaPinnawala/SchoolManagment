<%@ page import="com.g7sims.jdbc.DatabaseConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Test Connection</title>
</head>
<body>

<%
DatabaseConnection dbConnect = new DatabaseConnection();
boolean isConnected = dbConnect.testConnection();

if (isConnected) {
%>
    <h1>Connection successful!</h1>
<%
} else {
%>
    <h1>Connection failed!</h1>
<%
}
%>

</body>
</html>
