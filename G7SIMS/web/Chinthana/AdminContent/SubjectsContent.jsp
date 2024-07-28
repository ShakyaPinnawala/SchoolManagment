<%-- 
    IT22090294
    Chinthana Weligamage
    G7SIMS - School Information Management System
--%>

<%@ page import="java.util.*" %>
<%@ page import="com.g7sims.chinthana.*" %>

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Our Subjects</h1>
    <a href="#" class="d-none d-sm-inline-block btn btn-lg btn-primary shadow-sm" data-toggle="modal" data-target="#AddCourseModal">
        <i class="fas fa-plus-square fa-sm text-white-50"></i> &nbsp;Add New Subject</a>
</div>


<!-- Courses Table -->
<div class="card shadow mb-4">
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Subject Name</th>
                        <th>Subject Description</th>
                        <th>Course Name</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        try {
                            // Create an instance of SubjectDBUtil
                            SubjectDBUtil dbUtil = new SubjectDBUtil();

                            // Retrieve all courses
                            List<Subject> subjects = dbUtil.getAllSubjects();

                            // Display the courses
                            for (Subject subject : subjects) {
                    %> 

                    <tr>
                        <td><%= subject.getSubjectName() %></td>
                        <td><%= subject.getSubjectDescription() %></td>
                        <td><%= subject.getCourseDescription() %></td>
                        <td>
                            <a href="#" class="btn btn-warning btn-circle btn-sm" title="Update Notice"
                               data-toggle="modal" data-target="#UpdateCourseModal<%= subject.getSubjectID() %>">
                                <i class="fas fa-regular fa-address-book"></i></a>&nbsp;

                            <a href="#" class="btn btn-danger btn-circle btn-sm"title="Delete Notice"
                               data-toggle="modal" data-target="#DeleteCourseModal<%= subject.getSubjectID() %>">
                                <i class="fas fa-trash"></i></a>
                        </td>
                    </tr>

                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!-- Add Course Modal -->
<div class="modal fade" id="AddCourseModal" tabindex="-1" role="dialog" aria-labelledby="AddCourseModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-primary font-weight-bold" id="AddCourseModalTitle">Create New Course</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/G7SIMS/AddCourseServlet" method="post"">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="text-primary font-weight-bold" for="insertCourseDescription">Insert Course Name</label>
                        <input type="text" class="form-control" id="insertCourseDescription" placeholder="Course Name" name="insertCourseDescription">
                    </div>

                    <div class="form-row">
                        <div class="col">
                            <label class="text-primary font-weight-bold" for="insertCourseLevel">Course Level</label>
                            <select class="form-control" id="insertCourseLevel" name="insertCourseLevel">
                                <option>Degree</option>
                                <option>Diploma</option>
                                <option>Certificate</option>
                            </select>
                        </div>

                        <div class="col">
                            <label class="text-primary font-weight-bold" for="insertNoticeDate">Course Duration (months)</label>
                            <input type="number" class="form-control" placeholder="12 months" name="insertNoticeDate" min="1" max="120">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="text-primary font-weight-bold" for="insertCourseFee">Insert Course Fee ($)</label>
                        <input type="text" class="form-control" id="insertCourseFee" placeholder="$ 1,000.00" name="insertCourseFee">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-primary">Create Course</button>
                </div>
            </form><!-- add form -->
        </div>
    </div>
</div>