<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.g7sims.shakya.*" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register Page</title>
    <link rel="stylesheet" href="/G7SIMS/Shakya/CSS/insert.css" />
  </head>
  <body>
     <h1>Enter Lecture Details</h1>
    <div class="container">
      <div class="right-half">

        
        <form  action="/G7SIMS/insertTute" method="post">
          <div class="form-group">
          
            <label for="username">Teacher Name</label>
            <input type="text" id="name" name="name" required />
          </div>
          
          <div class="form-group">
            <label for="email">Subject</label>
           <select id="subject" name="subject" required>
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
            <input type="date" id="date" name="date" required />
          </div>      
			          
          <div class="form-group">
            <label >Lecture PDF Link</label>
          <input type="text" id="lecture" name="lecture" required />
			</div>
				          
           <div class="form-group">
            <label for="password">Lecture Recording Link</label>
            <input type="text" id="recording" name="recording" required />
          </div>
          
           
          
           <div class="form-group">
            <label for="password">Duration</label>
            <input type="text" id="duration" name="duration" required />
          </div>
          
  
                   <div class="btncls">
            <button type="submit">Submit</button>
          </div>
        </form>
      </div>
    </div>
  </body>
</html>
