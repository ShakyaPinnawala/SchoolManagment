<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="com.g7sims.ishini.*" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Edit Profile Page</title>
        <link rel="stylesheet" href="/G7SIMS/Ishini/CSS/Update.css" />
    </head>
    <body>

        <%
          String id = request.getParameter("id");
          String name = request.getParameter("name");
              String course = request.getParameter("course");  
              String method = request.getParameter("method");
              String status = request.getParameter("status");
              String date = request.getParameter("date");
              String fees = request.getParameter("fees");
        %>


        <h1>Update Student Payment Details</h1>
        <div class="container">
            <div class="right-half">



                <form  action="/G7SIMS/updatePayment" method="post">

                    <div class="form-group">

                        <label for="username">Student ID</label>
                        <input type="text" id="id" name="id"  value="<%= id %>"  readonly />
                    </div>
                    <div class="form-group">
                        <label for="username">Student Name</label>
                        <input type="text" id="name" name="name" value="<%= name %>" required />
                    </div>

                    <div class="form-group">
                        <label for="email">Course</label>
                        <select id="course" name="course" value="<%= course %>" required>
                            <option value="SoftwareEngineering">Software Engineering</option>
                            <option value="ComputerScience">Computer Science</option>
                            <option value="DataScience">Data Science</option>
                            <option value="Network">Computer System Network</option>
                        </select>
                    </div>


                    <div class="form-group">
                        <label for="password">Payment Method</label>
                        <select id="method" name="method" value="<%= method %>" required>
                            <option value="cash">Cash</option>
                            <option value="card">Card</option>
                            <option value="paypal">Paypal</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="password">Status</label>
                        <select id="status" name="status" value="<%= status %>" required>
                            <option value="pendig">Pending</option>
                            <option value="varified">Varified</option>

                        </select>
                    </div>

                    <div class="form-group">
                        <label for="password">Date</label>
                        <input type="date" id="date" name="date" value="<%= date %>" required />
                    </div>

                    <div class="form-group">
                        <label for="password">Fees</label>
                        <input type="text" id="fees" name="fees" value="<%= fees %>" required />
                    </div>


                    <div class="btncls">
                        <button type="submit">UPDATE</button>
                    </div>
                </form>


            </div>
        </div>
    </body>
</html>
