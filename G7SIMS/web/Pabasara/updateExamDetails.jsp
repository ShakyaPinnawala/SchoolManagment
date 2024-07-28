<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Update Details</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    </head>
    <body style="background:linear-gradient(rgba(0, 0, 0, 0.443), rgba(0, 0, 0, 0.395)), url('images/BackgroundImage.jpg') no-repeat center center fixed; background-size: cover; height: 100vh;">
        <div class="container mt-4">
            <form action="/G7SIMS/updateExamDetailsServlet" method="post">

                <%
                        String sid = request.getParameter("sid"); 
                        String oop = request.getParameter("oop"); 
                        String se = request.getParameter("se");
                        String dms = request.getParameter("dms"); 
                        String cn = request.getParameter("cn"); 
                        String ossa = request.getParameter("ossa"); 
                        String credits = request.getParameter("credits"); 
                        String gpa = request.getParameter("gpa"); 
                %>

                <div class="form-group">
                    <label for="sid" style="color: white; font-weight:bold; font-size:18px;">Student Id</label>
                    <input type="text" required maxlength="10" minlength="10" class="form-control" placeholder="Enter Student Id" name="sid" value="<%= sid %>" readonly>
                </div>

                <table class="table table-bordered">
                    <thead style="color: white;">
                        <tr>
                            <th>Module Codes</th>
                            <th>Grades</th>
                        </tr>
                    </thead>
                    <tbody style="color: white;">
                        <tr>
                            <td>IT2020</td>
                            <td><input type="text" required class="form-control" placeholder="Enter OOP Grade" name="oop" value="<%= oop %>"></td>
                        </tr>
                        <tr>
                            <td>IT2030</td>
                            <td><input type="text" required class="form-control" placeholder="Enter SE Grade" name="se" value="<%= se %>"></td>
                        </tr>
                        <tr>
                            <td>IT2040</td>
                            <td><input type="text" required class="form-control" placeholder="Enter DMS Grade" name="dms" value="<%= dms %>"></td>
                        </tr>
                        <tr>
                            <td>IT2050</td>
                            <td><input type="text" required class="form-control" placeholder="Enter CN Grade" name="cn" value="<%= cn %>"></td>
                        </tr>
                        <tr>
                            <td>IT2060</td>
                            <td><input type="text" required class="form-control" placeholder="Enter OSSA Grade" name="ossa" value="<%= ossa %>"></td>
                        </tr>
                    </tbody>
                </table>

                <div class="form-group" style="color: white; font-weight:bold; font-size:15px;">
                    <label for="credits">Total Credits</label>
                    <input type="text" required class="form-control" placeholder="Enter Credits" name="credits" value="<%= credits %>">
                </div>

                <div class="form-group" style="color: white; font-weight:bold; font-size:15px;">
                    <label for="gpa">GPA</label>
                    <input type="text" required class="form-control" placeholder="Enter GPA" name="gpa" value="<%= gpa %>">
                </div>

                <a href="Pabasara/Home.jsp">
                    <button class="btn btn-warning">Back</button>
                </a>
                <button type="submit" class="btn btn-primary">Publish</button>
                

            </form>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>

</html>
