<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="com.g7sims.ishini.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Submit Successful</title>
        <link rel="stylesheet" href="/G7SIMS/Ishini/CSS/done.css" />
    </head>
    <body>
        <div class="full">
            <div class="box-content">
                <img src="/G7SIMS/Ishini/CSS/done.webp" alt="done img" class="dnimg" /><br />
                <div class="btncls">
                    <form action="/G7SIMS/viewAllPayments" method="post">
                        <button>View All Payment Details</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
