 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.g7sims.shakya.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Delete Lec</title>
	<link href="CSS/deelete.css" rel="stylesheet">
</head>
<body>

<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
	String subject = request.getParameter("subject");  
	String date = request.getParameter("date");
	String lecture = request.getParameter("lecture");
	String recording = request.getParameter("recording");
	String duration = request.getParameter("duration");
%>
 
	
	


	<h1>Lecture Details Delete Confirmation</h1>
    <div class="container">
      <div class="right-half">
	<form action="/G7SIMS/deleteTute" method="post">
	 
       <div class="form-group">
          
          <label for="username">Teacher ID</label>
            <input type="text" id="id" name="id" required value="<%= id %>"  readonly  />
          </div>
          <div>
          <label for="username">Teacher Name</label>
            <input type="text" id="name" name="name" readonly required value="<%= name %>"   />
          </div>
          
          <div class="form-group">
            <label for="email">Subject</label>
            <input type="text" id="subject" name="subject" readonly value="<%= subject %>"  required />
          
			          </div>
			    
			    <div class="form-group">
            <label for="password">Date</label>
            <input type="date" id="date" name="date" readonly value="<%= date %>"  required />
          </div>      
			          
          <div class="form-group">
            <label >Lecture PDF Link</label>
          <input type="text" id="lecture" name="lecture" readonly value="<%= lecture %>"  required />
			</div>
				          
           <div class="form-group">
            <label for="password">Lecture Recording Link</label>
            <input type="text" id="recording" name="recording" readonly value="<%= recording %>"  required />
          </div>
          
           
           <div class="form-group">
            <label for="duration">Duration</label>
            <input type="text" id="duration" name="duration" readonly value="<%= duration %>" required />
          </div>
          
          <input type="submit" name="submit" class="dlt" value="Delete Lecture Details" />
          
	
	</form>
</div>
</body>
</html>