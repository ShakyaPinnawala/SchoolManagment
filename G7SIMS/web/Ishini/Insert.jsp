<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="com.g7sims.ishini.*" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Register Page</title>
        <link rel="stylesheet" href="/G7SIMS/Ishini/CSS/insert.css" />
    </head>
    <body>
        <h1>Enter new student details</h1>
        <div class="container">
            <div class="right-half">
                <form action="/G7SIMS/insertPayment" method="post">
                    <div class="form-group">
                        <label for="username">Student Name</label><br />
                        <input type="text" id="name" name="name" required />
                    </div>

                    <div class="form-group">
                        <label for="email">Course</label><br />
                        <select id="course" name="course" required>
                            <option value="SoftwareEngineering">Software Engineering</option>
                            <option value="ComputerScience">Computer Science</option>
                            <option value="DataScience">Data Science</option>
                            <option value="Network">Computer System Network</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="password">Payment Method</label><br />
                        <select id="method" name="method" required>
                            <option value="cash">Cash</option>
                            <option value="card">Card</option>
                            <option value="paypal">Paypal</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="password">Status</label><br />
                        <select id="status" name="status" required>
                            <option value="pendig">Pending</option>
                            <option value="varified">Varified</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="password">Date</label><br />
                        <input type="date" id="date" name="date" required />
                    </div>

                    <div class="form-group">
                        <label for="password">Fees</label><br />
                        <input type="text" id="fees" name="fees" required />
                    </div>

                    <div class="btncls">
                        <button type="submit">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
