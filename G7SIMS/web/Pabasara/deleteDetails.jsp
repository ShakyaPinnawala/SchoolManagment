<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Exam Details delete</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            .form-container {
                border: 2px solid white;
                padding: 20px;
                width: 400px;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            h1 {
                color: white;
                margin-top: 0;
            }
        </style>
    </head>

    <body class="text-center" style="background:linear-gradient(rgba(0, 0, 0, 0.443), rgba(0, 0, 0, 0.395)), url('images/BackgroundImage.jpg') no-repeat center center fixed; background-size: cover; height: 100vh; display: flex; flex-direction: column; justify-content: center; align-items: center;">

        <%
            String sid = request.getParameter("sid"); 
        %>

        <div class="form-container mt-3">
            <h1 class="mt-5">Delete Marks?</h1>
            <div class="row">
                <a href="Home.jsp">
                    <button class="btn btn-warning mt-3 mr-2 ml-2">No</button>
                </a>
                <form action="/G7SIMS/deleteDetailsServlet" method="post">
                    <input type="hidden" name="sid" value="<%= sid %>">
                    <button type="submit" class="btn btn-danger mt-3 mr-2 ml-2">Yes</button>
                </form>

            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>

</html>