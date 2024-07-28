<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.g7sims.ishini.*" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>View All Details</title>
        <link rel="stylesheet" href="/G7SIMS/Ishini/CSS/tble.css" />
        <!-- Add your CSS file here -->
    </head>
    <body>
        <h1>Student Payment Details Table</h1>


        <form action="/G7SIMS/searchPayment" method="post">
            <label>Student Id:</label>
            <input type="text" name="id" class="form-group" />
            <label>Student Name:</label>
            <input type="text" name="name" class="form-group" />
            <div class="btncls">
                <button class="btnn">Search</button>
            </div>
        </form>
        <div class="lftbtn">
            <a href="/G7SIMS/Ishini/Insert.jsp">
                <button>Add New Payment</button></a
            >
        </div>
        <br />
        <div class="tblefull">
            <table id="customers">
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Student Name</th>
                        <th>Course</th>
                        <th>Payment Method</th>
                        <th>Status</th>
                        <th>Date</th>
                        <th>Fees</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="row" items="${allAdmins}">
                        <tr>
                            <td>${row.id}</td>
                            <td>${row.name}</td>
                            <td>${row.course}</td>
                            <td>${row.method}</td>
                            <td>${row.status}</td>
                            <td>${row.date}</td>
                            <td>${row.fees}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="logout" style="padding: 25px 50px 75px 100px">
            <a href="/G7SIMS">
                <button style="background:#e74a3b;color:white;">
                    Log out
                </button>
            </a>
        </div>
    </body>
</html>


