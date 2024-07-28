<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="com.g7sims.ishini.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Submit Successful</title>
        <link rel="stylesheet" href="/G7SIMS/Pabasara/done.css" />
    </head>
    <body style="background:linear-gradient(rgba(0, 0, 0, 0.443), rgba(0, 0, 0, 0.395)), url('images/BackgroundImage.jpg') no-repeat center center fixed; background-size: cover; height: 100vh; padding-top: 10vh;">
        <div class="full">
            <div class="box-content py-4">
                <img src="images/done.webp" alt="done img" class="dnimg" /><br />
                <div class="btncls">
                    <form action="/G7SIMS/viewAllResults" method="post">
                        <button id="redirect">View All Exam Details</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var redirectButton = document.getElementById('redirect');
        if (redirectButton) {
            redirectButton.click();
        }
    });
</script>
