<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Add Marks</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>

    <body style="background:linear-gradient(rgba(0, 0, 0, 0.443), rgba(0, 0, 0, 0.395)), url('images/BackgroundImage.jpg') no-repeat center center fixed; background-size: cover; height: 100vh;">
        <div class="container mt-4">
            <form action="/G7SIMS/AddMarksServlet" method="post">

                <div class="form-group">
                    <label for="sid" style="color: white; font-weight:bold; font-size:18px;">Student Id</label>
                    <input type="text" required maxlength="10" minlength="10" class="form-control" placeholder="Enter Student Id" name="sid">
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
                            <td><input type="text" required class="form-control" placeholder="Enter OOP Grade" name="oop"></td>
                        </tr>
                        <tr>
                            <td>IT2030</td>
                            <td><input type="text" required class="form-control" placeholder="Enter SE Grade" name="se"></td>
                        </tr>
                        <tr>
                            <td>IT2040</td>
                            <td><input type="text" required class="form-control" placeholder="Enter DMS Grade" name="dms"></td>
                        </tr>
                        <tr>
                            <td>IT2050</td>
                            <td><input type="text" required class="form-control" placeholder="Enter CN Grade" name="cn"></td>
                        </tr>
                        <tr>
                            <td>IT2060</td>
                            <td><input type="text" required class="form-control" placeholder="Enter OSSA Grade" name="ossa"></td>
                        </tr>
                    </tbody>
                </table>

                <div class="form-group" style="color: white; font-weight:bold; font-size:15px;">
                    <label for="credits">Total Credits</label>
                    <input type="text" required class="form-control" placeholder="Enter Credits" name="credits">
                </div>

                <div class="form-group" style="color: white; font-weight:bold; font-size:15px;">
                    <label for="gpa">GPA</label>
                    <input type="text" required class="form-control" placeholder="Enter GPA" name="gpa">
                </div>

                <button type="submit" class="btn btn-primary">Publish</button>

            </form>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>

</html>
