<%@ page import="com.g7sims.jdbc.cnw.DatabaseConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.g7sims.jdbc.cnw.Notice" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Test NoticeControlServlet</title>


</head>
<body>
    <h1>Testing NoticeControlServlet</h1>

    <% 
        try {
            // Create a URL object for the servlet
            URL url = new URL("http://localhost:8080/G7SIMS/NoticeControlServlet");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            
            // Get the response
            InputStream inputStream = connection.getInputStream();
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                out.println(line);
            }

            // Close connections
            bufferedReader.close();
            inputStreamReader.close();
            inputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

</body>
</html>
