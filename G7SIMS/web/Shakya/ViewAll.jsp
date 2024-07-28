<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.g7sims.shakya.*" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View All Details</title>
        <link rel="stylesheet" href="/G7SIMS/Shakya/CSS/tble.css" /> 
    </head>
    <body>
        <h1>Teachers Details Table</h1>
        <div class="fully">
            <form action="/G7SIMS/searchTute" method="post">
                <label>Teacher Id:</label>
                <input type="text" name="id" class="form-group" />
                <label>Teacher Name:</label>
                <input type="text" name="name" class="form-group" />
                <div class="btncls">
                    <button class="btnn">Search</button>
                </div>
            </form>
            <div class="lftbtn">
                <a href="/G7SIMS/Shakya/Insert.jsp">
                    <button>Add New Lecture</button></a
                >
            </div>
            <br />
            <div class="tblefull">
                <table id="customers">
                    <thead>
                        <tr>
                            <th>Student ID</th>
                            <th>Teacher Name</th>
                            <th>Subject</th>
                            <th>Date</th>
                            <th>Lecture PDF </th>
                            <th>Lecture Recording</th>
                            <th>Duration</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="row" items="${allAdmins}">
                            <tr>
                                <td>${row.id}</td>
                                <td>${row.name}</td>
                                <td>${row.subject}</td>
                                <td>${row.date}</td>
                                <td><a href="${row.lecture}" target="_blank" ><button>Download</button></a></td>
                                <td><a href="${row.recording}" target="_blank"><button>Watch</button></a></td>
                                <td>${row.duration}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
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
