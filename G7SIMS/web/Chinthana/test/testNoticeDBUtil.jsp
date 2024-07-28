<%@ page import="java.util.List" %>
<%@ page import="com.g7sims.jdbc.cnw.Notice" %>
<%@ page import="com.g7sims.jdbc.cnw.NoticeDBUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Test NoticeDBUtil</title>
</head>
<body>
    <h1>Testing NoticeDBUtil</h1>

    <% 
        try {
            // Create an instance of NoticeDBUtil
            NoticeDBUtil dbUtil = new NoticeDBUtil();
            
            // Retrieve all notices
            List<Notice> notices = dbUtil.getAllNotices();
            
            // Display the notices
            for (Notice notice : notices) {
    %>
                <div>
                    <h3><%= notice.getNoticeTitle() %></h3>
                    <p><%= notice.getNoticeContent() %></p>
                    <p>Date: <%= notice.getNoticeDate() %></p>
                    <hr>
                </div>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

</body>
</html>
