<%-- 
    IT22090294
    Chinthana Weligamage
    G7SIMS - School Information Management System
--%>

<%@ page import="java.util.*" %>
<%@ page import="com.g7sims.chinthana.*" %>

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Special Notices</h1>
    <!-- Search -->
    <form
        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 pl-3 navbar-search ">
        <div class="input-group">
            <input type="text" id="searchQuery" class="form-control bg-light small" placeholder="Search for..."
                   aria-label="Search" aria-describedby="basic-addon2" 
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

            <div class="input-group-append">
                <button class="btn btn-outline-primary rounded-right" type="button">
                    <i class="fas fa-search fa-sm"></i>
                </button>
            </div>
            <div id="searchResultsContainer" class="dropdown-menu text-dark custom-dropdown-menu" aria-labelledby="dropdownMenuButton"></div>
        </div>
    </form>
    <a href="#" class="d-none d-sm-inline-block btn btn-lg btn-primary shadow-sm" data-toggle="modal" data-target="#AddNoticeModal">
        <i class="fas fa-plus-square fa-sm text-white-50"></i> &nbsp;Add New Notice</a>
</div>

<div class="row">

    <% 
            try {
                // Create an instance of NoticeDBUtil
                NoticeDBUtil dbUtil = new NoticeDBUtil();
            
                // Retrieve all notices
                List<Notice> notices = dbUtil.getAllNotices();
            
                // Display the notices
                for (Notice notice : notices) {
    %>

    <div class="col-sm-6">
        <div class="card shadow mb-4">
            <img src="<%= notice.getNoticeImage() %>" class="card-img-top img-fluid" alt="<%= notice.getNoticeTitle() %>" height="200px">
            <div class="card-body">
                <h5 class="card-title m-0 font-weight-bold text-primary"><%= notice.getNoticeTitle() %></h5>
                <p class="card-text mb-1 small text-dark"><%= notice.getNoticeContent() %></p>
                <p class="card-text"><small class="text-muted"><%= notice.getNoticeDate() %> &nbsp; 
                        <span class="badge badge-primary p-1">For : <%= notice.getNoticeGroup() %></span></small></p>


                <a href="#" class="btn btn-success btn-circle btn-sm" title="View Notice"
                   data-toggle="modal" data-target="#ViewNoticeModal<%= notice.getNoticeID() %>">
                    <i class="fas fa-eye"></i></a>&nbsp;

                <a href="#" class="btn btn-warning btn-circle btn-sm" title="Update Notice"
                   data-toggle="modal" data-target="#UpdateNoticeModal<%= notice.getNoticeID() %>">
                    <i class="fas fa-regular fa-address-book"></i></a>&nbsp;

                <a href="#" class="btn btn-danger btn-circle btn-sm"title="Delete Notice"
                   data-toggle="modal" data-target="#DeleteNoticeModal<%= notice.getNoticeID() %>">
                    <i class="fas fa-trash"></i></a>



            </div>
        </div>
    </div>

    <!-- View Notice Modal -->
    <div class="modal fade" id="ViewNoticeModal<%= notice.getNoticeID() %>" tabindex="-1" role="dialog" aria-labelledby="ViewNoticeModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-primary font-weight-bold" id="ViewNoticeModalTitle"><%= notice.getNoticeTitle() %></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="card mb-3">
                        <img src="<%= notice.getNoticeImage() %>" class="card-img-top" alt="<%= notice.getNoticeTitle() %>">
                        <div class="card-body">
                            <p class="card-text text-dark"><%= notice.getNoticeContent() %></p>
                            <p class="card-text"><small class="text-muted"><%= notice.getNoticeDate() %> &nbsp; 
                                    <span class="badge badge-primary p-1">For : <%= notice.getNoticeGroup() %></span></small></p>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Update Notice Modal -->
    <div class="modal fade" id="UpdateNoticeModal<%= notice.getNoticeID() %>" tabindex="-1" role="dialog" aria-labelledby="UpdateNoticeModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-primary font-weight-bold" id="UpdateNoticeModalTitle">Update Notice</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="/G7SIMS/UpdateNoticeServlet" method="post" enctype="multipart/form-data">
                    <input type="hidden" class="form-control" id="updatedNoticeID" value="<%= notice.getNoticeID() %>" name="updatedNoticeID" required>
                    <input type="hidden" class="form-control" id="updatedNoticedCurrentImage" value="<%= notice.getNoticeImage() %>" name="updatedNoticedCurrentImage" >
                    <div class="modal-body">
                        <div class="card mb-3">

                            <div class="imgUp card-img-top">
                                <div class="imagePreview" style = "background:url('<%= notice.getNoticeImage() %>')"></div>
                                <br><br>
                                <label class="btn btn-primary">
                                    Change Image<input type="file" class="uploadFile img" value="<%= notice.getNoticeImage() %>" style="width: 0px;height: 0px;overflow: hidden;" name="updatedNoticeImage">
                                </label>
                            </div><br>

                            <div class="form-group">
                                <label class="text-primary font-weight-bold" for="updatedNoticeTitle">Change Notice Title</label>
                                <input type="text" class="form-control" id="updatedNoticeTitle" placeholder="Notice Title" value="<%= notice.getNoticeTitle() %>" name="updatedNoticeTitle">
                            </div>

                            <div class="form-group">
                                <label class="text-primary font-weight-bold" for="updatedNoticeContent">Change Notice Content</label>
                                <textarea class="form-control" id="updatedNoticeContent" rows="3" name="updatedNoticeContent"><%= notice.getNoticeContent() %></textarea>
                            </div>

                            <div class="form-row">
                                <div class="col">
                                    <label class="text-primary font-weight-bold" for="updatedNoticeGroup">Change Target Group</label>
                                    <select class="form-control" id="updatedNoticeGroup" value="<%= notice.getNoticeGroup() %>" name="updatedNoticeGroup">
                                        <option>All</option>
                                        <option>Student</option>
                                        <option>Staff</option>
                                    </select>
                                </div>

                                <div class="col">
                                    <label class="text-primary font-weight-bold" for="updatedNoticeDate">Change Notice Date</label>
                                    <input type="date" class="form-control" value="<%= notice.getNoticeDate() %>" name="updatedNoticeDate">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary">Update Notice</button>
                    </div>
                </form><!-- update form -->
            </div>
        </div>
    </div>

    <!-- Delete Notice Modal -->
    <div class="modal fade" id="DeleteNoticeModal<%= notice.getNoticeID() %>" tabindex="-1" role="dialog" aria-labelledby="DeleteNoticeModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-primary font-weight-bold" id="DeleteNoticeModalTitle">Are You Sure?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p class="card-text text-dark">Notice Titled "<%= notice.getNoticeTitle() %>" will be Unpublished & Deleted.</p>
                    <h6 class="modal-title text-primary font-weight-bold" id="DeleteNoticeModalTitle">Do you want to Delete this Notice?</h6>

                </div>
                <div class="modal-footer">
                    <form action="/G7SIMS/DeleteNoticeServlet" method="post">
                        <input type="hidden" class="form-control" id="DeleteNoticeModalID" value="<%= notice.getNoticeID() %>" name="DeleteNoticeModalID">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary">Yes Delete Notice</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
    %>

</div>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    // Get the current date
    Date currentDate = new Date();

    // Create a SimpleDateFormat object to format the date
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    // Format the date to a string
    String formattedDate = dateFormat.format(currentDate);
%>

<!-- Add Notice Modal -->
<div class="modal fade" id="AddNoticeModal" tabindex="-1" role="dialog" aria-labelledby="AddNoticeModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-primary font-weight-bold" id="AddNoticeModalTitle">Publish New Notice</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/G7SIMS/AddNoticeServlet" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="card mb-3">

                        <div class="imgUp card-img-top">
                            <div class="imagePreview" style = "background:url('../images/upload-image.jpg')"></div>
                            <br><br>
                            <label class="btn btn-primary">
                                Insert Image<input type="file" accept="image/jpg" class="uploadFile img" value="Upload Photo" style="width: 0px;height: 0px;overflow: hidden;" name="insertNoticeImage">
                            </label>
                        </div><br>

                        <div class="form-group">
                            <label class="text-primary font-weight-bold" for="insertNoticeTitle">Insert Notice Title</label>
                            <input type="text" class="form-control" id="insertNoticeTitle" placeholder="Insert notice title" name="insertNoticeTitle">
                        </div>

                        <div class="form-group">
                            <label class="text-primary font-weight-bold" for="insertNoticeContent">Insert Notice Content</label>
                            <textarea class="form-control" id="insertNoticeContent" rows="3" name="insertNoticeContent"></textarea>
                        </div>

                        <div class="form-row">
                            <div class="col">
                                <label class="text-primary font-weight-bold" for="insertNoticeGroup">Insert Target Group</label>
                                <select class="form-control" id="insertNoticeGroup" name="insertNoticeGroup">
                                    <option>All</option>
                                    <option>Student</option>
                                    <option>Staff</option>
                                </select>
                            </div>

                            <div class="col">
                                <label class="text-primary font-weight-bold" for="insertNoticeDate">Insert Notice Date</label>
                                <input type="date" class="form-control" value="<%= formattedDate %>" name="insertNoticeDate">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-primary">Publish Notice</button>
                </div>
            </form><!-- add form -->
        </div>
    </div>
</div>


<