<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.g7sims.shakya.*" %>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Edit Profile Page</title>
    <link rel="stylesheet" href="/G7SIMS/Shakya/CSS/Update.css" />
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
 
 
  
    <div class="container">

      <div class="right-half">
        <h1>Update Lecture Details</h1>
        
        
        
        
        <form  action="/G7SIMS/updateTute" method="post">
        
        <div class="form-group">
          
          <label for="username">Teacher ID</label>
            <input type="text" id="id" name="id" required value="<%= id %>"  readonly  />
          </div>
          <div>
          <label for="username">Teacher Name</label>
            <input type="text" id="name" name="name" required value="<%= name %>"   />
          </div>
          
          <div class="form-group">
            <label for="email">Subject</label>
           <select id="subject" name="subject" value="<%= subject %>"  required>
		          <option value="OOP">OOP</option>
			    <option value="IWT">IWT</option>
			    <option value="SPM">SPM</option>
			    <option value="EAP">EAP</option>
			    <option value="ISDM">ISDM</option>
			    <option value="CN">CN</option>
			  </select>
			          </div>
			    
			    <div class="form-group">
            <label for="password">Date</label>
            <input type="date" id="date" name="date" value="<%= date %>"  required />
          </div>      
			          
          <div class="form-group">
            <label >Lecture PDF</label>
          <input type="text" id="lecture" name="lecture" value="<%= lecture %>"  required />
			</div>
				          
           <div class="form-group">
            <label for="password">Lecture Recording</label>
            <input type="text" id="recording" name="recording" value="<%= recording %>"  required />
          </div>
          
           
           <div class="form-group">
            <label for="password">Duration</label>
            <input type="text" id="duration" name="duration" value="<%= duration %>" required />
          </div>
          
          
          
            <div class="btncls">
          <button type="submit">UPDATE</button>
          </div>
        </form>
        
        
      </div>
    </div>
  </body>
</html>
