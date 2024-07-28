<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.g7sims.ishini.*" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Register Page</title>
        <link rel="stylesheet" href="/G7SIMS/Ishini/CSS/disply.css" />
    </head>
    <body>
        <c:forEach var="cus" items="${cusDetails}">

            <c:set var="id" value="${ cus.id}" />
            <c:set var="name" value="${ cus.name}" />
            <c:set var="course" value="${ cus.course}" />
            <c:set var="method" value="${ cus.method}" />
            <c:set var="status" value="${ cus.status}" />
            <c:set var="date" value="${ cus.date}" />
            <c:set var="fees" value="${ cus.fees}" />


            <h1>Student Account Details</h1>
            <div class="container">
                <div class="right-half">

                    <div class="form-group">
                        <label for="username">Student ID</label>
                        <input type="text" id="id" name="id" value="${cus.id}" readonly />
                    </div>

                    <label for="username">Student Name</label>
                    <input
                        type="text"
                        id="name"
                        name="name"
                        value="${ cus.name}"
                        readonly

                        />

                    <div class="form-group">
                        <label for="email">Course</label>
                        <input
                            type="text"
                            id="course"
                            name="course"
                            value="${ cus.course}"
                            readonly

                            />

                    </div>

                    <div class="form-group">
                        <label for="password">Payment Method</label>
                        <input
                            type="text"
                            id="method"
                            name="method"
                            value="${ cus.method}"
                            readonly

                            />

                    </div>

                    <div class="form-group">
                        <label for="password">Status</label>
                        <input
                            type="text"
                            id="status"
                            name="status"
                            value="${ cus.status}"
                            readonly

                            />

                    </div>

                    <div class="form-group">
                        <label for="password">Date</label>
                        <input
                            type="text"
                            id="date"
                            name="date"
                            value="${ cus.date}"
                            readonly

                            />
                    </div>

                    <div class="form-group">
                        <label for="password">Fees</label>
                        <input
                            type="text"
                            id="fees"
                            name="fees"
                            value="${ cus.fees}"
                            readonly

                            />
                    </div>




                </c:forEach>

                <c:url value="Ishini/Update.jsp" var="cusupdate">

                    <c:param name="id" value="${id}"/>
                    <c:param name="name" value="${name}"/>
                    <c:param name="course" value="${course}"/>
                    <c:param name="method" value="${method}"/>
                    <c:param name="status" value="${status}"/>
                    <c:param name="date" value="${date}"/>
                    <c:param name="fees" value="${fees}"/>

                </c:url>

                <c:url value="Ishini/Delete.jsp" var="cusdelete">

                    <c:param name="id" value="${id}"/>
                    <c:param name="name" value="${name}"/>
                    <c:param name="course" value="${course}"/>
                    <c:param name="method" value="${method}"/>
                    <c:param name="status" value="${status}"/>
                    <c:param name="date" value="${date}"/>
                    <c:param name="fees" value="${fees}"/>

                </c:url>
                <div class="btncls">

                    <a href="${cusupdate }"><button name="update" >Update</button></a>
                    <a href="${cusdelete }"><button name="delete" class="dlt">Delete</button></a>
                    <a href="/G7SIMS/Ishini/Home.jsp"><button>Back</button></a>
                </div>
            </div>
        </div>
    </div>



</body>
</html>

