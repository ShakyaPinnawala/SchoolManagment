<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="com.g7sims.ishini.*" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Insert title here</title>
    <link href="/G7SIMS/Ishini/CSS/deelete.css" rel="stylesheet" />
  </head>
  <body>
    <% String id = request.getParameter("id"); String name =
    request.getParameter("name"); String course =
    request.getParameter("course"); String method =
    request.getParameter("method"); String status =
    request.getParameter("status"); String date = request.getParameter("date");
    String fees = request.getParameter("fees"); %>

    <h1>Student Payment Details Delete Confirmation</h1>
    <div class="container">
      <div class="right-half">
          <form action="/G7SIMS/deletePayment" method="post">
          <div class="form-group">
            <label for="username">Student ID</label>
            <input type="text" id="id" name="id" value="<%= id %>" readonly />
          </div>

          <label for="username">Student Name</label>
          <input
            type="text"
            id="name"
            name="name"
            value="<%= name %>"
            readonly
            
          />

          <div class="form-group">
            <label for="email">Course</label>
                               <input
              type="text"
              id="course"
              name="course"
              value="<%= course %>"
              readonly
              
            />

          </div>

          <div class="form-group">
            <label for="password">Payment Method</label>
       <input
              type="text"
              id="method"
              name="method"
              value="<%= method %>"
              readonly
              
            />
      
          </div>

          <div class="form-group">
            <label for="password">Status</label>
                   <input
              type="text"
              id="status"
              name="status"
              value="<%= status %>"
              readonly
              
            />

          </div>

          <div class="form-group">
            <label for="password">Date</label>
            <input
              type="text"
              id="date"
              name="date"
              value="<%= date %>"
              readonly
              
            />
          </div>

          <div class="form-group">
            <label for="password">Fees</label>
            <input
              type="text"
              id="fees"
              name="fees"
              value="<%= fees %>"
              readonly
              
            />
          </div>

          <input type="submit" name="submit" class="dlt" value="Delete Payment Details" />
        </form>
      </div>
    </div>
  </body>
</html>
