<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Dashboard</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    </head>
    <body style="background:linear-gradient(rgba(0, 0, 0, 0.443), rgba(0, 0, 0, 0.395)), url('Pabasara/images/BackgroundImage.jpg') no-repeat center center fixed; background-size: cover; height: 100vh; padding-top: 2vh; padding-bottom: 10vh;">

        <div class="container pb-5">
            <div class="row">
                <div class="d-flex justify-content-around">
                    <h1 id="topic" style="color:white;">Dashboard</h1>
                    <div id="btn">
                        <a href="Pabasara/AddMarks.jsp"><button class="btn btn-primary">Add Exam Details</button></a>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <table class="table table-bordered table-striped transparent-table pt-4" style="margin: auto; width: 90%;">
                <tr style="background-color: rgba(255, 255, 255, 0.5);">
                    <th>Student Id</th>
                    <th>IT2020</th>
                    <th>IT2030</th>
                    <th>IT2040</th>
                    <th>IT2050</th>
                    <th>IT2060</th>
                    <th>Total Credits</th>
                    <th>GPA</th>
                    <th style="text-align:center;">Actions</th>
                </tr>

                <c:forEach var="student" items="${details}">
                    <c:set var="sid" value="${student.sid }" />
                    <c:set var="oop" value="${student.oop }" />
                    <c:set var="se" value="${student.se }" />
                    <c:set var="dms" value="${student.dms }" />
                    <c:set var="cn" value="${student.cn }" />
                    <c:set var="ossa" value="${student.ossa }" />
                    <c:set var="credits" value="${student.credits }" />
                    <c:set var="gpa" value="${student.gpa }" />

                    <tr>
                        <td>${student.sid}</td>
                        <td>${student.oop}</td>
                        <td>${student.se}</td>
                        <td>${student.dms}</td>
                        <td>${student.cn}</td>
                        <td>${student.ossa}</td>
                        <td>${student.credits}</td>
                        <td>${student.gpa}</td>
                        <td>
                            <c:url value="Pabasara/updateExamDetails.jsp" var="examUpdate">
                                <c:param name="sid" value="${sid}" />
                                <c:param name="oop" value="${oop}" />
                                <c:param name="se" value="${se}" />
                                <c:param name="dms" value="${dms}" />
                                <c:param name="cn" value="${cn}" />
                                <c:param name="ossa" value="${ossa}" />
                                <c:param name="credits" value="${credits}" />
                                <c:param name="gpa" value="${gpa}" />
                            </c:url>
                            <a href="${examUpdate}">
                                <button class="btn btn-info" style="margin-left: 100px;">Update</button>
                            </a>
                            <c:url value="Pabasara/deleteDetails.jsp" var="examDelete">
                                <c:param name="sid" value="${sid}" />
                            </c:url>
                            <a href="${examDelete}">
                                <button class="btn btn-danger">Delete</button>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <div class="logout" style="padding: 25px 50px 75px 100px">
                <a href="/G7SIMS">
                    <button style="background:#e74a3b;color:white;">
                        Log out
                    </button>
                </a>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    </body>
</html>