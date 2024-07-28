<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.g7sims.shakya.*" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Register Page</title>
        <link rel="stylesheet" href="/G7SIMS/Shakya/CSS/disply.css" />
    </head>
    <body>



        <c:forEach var="cus" items="${cusDetails}">

            <c:set var="id" value="${ cus.id}" />
            <c:set var="name" value="${ cus.name}" />
            <c:set var="subject" value="${ cus.subject}" />
            <c:set var="date" value="${ cus.date}" />
            <c:set var="lecture" value="${ cus.lecture}" />
            <c:set var="recording" value="${ cus.recording}" />
            <c:set var="duration" value="${ cus.duration}" />

            <h1>Lecture Details</h1>
            <div class="container">
                <div class="right-half">

                    <div class="form-group">
                        <label for="username">Teacher ID</label>
                        <input type="text" value="${cus.id}" readonly />
                    </div>

                    <label for="username">Teacher Name</label>
                    <input
                        type="text"

                        value="${ cus.name}"
                        readonly

                        />

                    <div class="form-group">
                        <label for="email">Subject</label>
                        <input
                            type="text"

                            value="${ cus.subject}"
                            readonly

                            />

                    </div>

                    <div class="form-group">
                        <label for="password">Date</label>
                        <input
                            type="text"

                            value="${ cus.date}"
                            readonly

                            />

                    </div>

                    <div class="form-group">
                        <label for="password">Lecture PDF Link</label>
                        <input
                            type="text"

                            value="${ cus.lecture}"
                            readonly

                            />

                    </div>

                    <div class="form-group">
                        <label for="password">Lecture Recording Link</label>
                        <input
                            type="text"
                            id="date"
                            name="date"
                            value="${ cus.recording}"
                            readonly

                            />
                    </div>

                    <div class="form-group">
                        <label for="password">Duration</label>
                        <input
                            type="text"
                            value="${ cus.duration}"
                            readonly

                            />
                    </div>



                </c:forEach>

                <c:url value="Shakya/Update.jsp" var="cusupdate">

                    <c:param name="id" value="${id}"/>
                    <c:param name="name" value="${name}"/>
                    <c:param name="subject" value="${subject}"/>
                    <c:param name="date" value="${date}"/>
                    <c:param name="lecture" value="${lecture}"/>
                    <c:param name="recording" value="${recording}"/>
                    <c:param name="duration" value="${duration}"/>

                </c:url>

                <c:url value="Shakya/Delete.jsp" var="cusdelete">

                    <c:param name="id" value="${id}"/>
                    <c:param name="name" value="${name}"/>
                    <c:param name="subject" value="${subject}"/>
                    <c:param name="date" value="${date}"/>
                    <c:param name="lecture" value="${lecture}"/>
                    <c:param name="recording" value="${recording}"/>
                    <c:param name="duration" value="${duration}"/>


                </c:url>


                <a href="${cusupdate }"><button name="update" >Update Profile</button></a>
                <a href="${cusdelete }"><button name="delete" class="dlt">Delete</button></a>

                <a href="/G7SIMS/Shakya/Home.jsp"><button>Back</button></a>

            </div>
        </div>
    </div>



</body>
</html>

