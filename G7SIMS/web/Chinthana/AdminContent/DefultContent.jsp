<%-- 
    IT22090294
    Chinthana Weligamage
    G7SIMS - School Information Management System
--%>

<% 
    int numberOfStudents = 0;
    int numberOfTeachers = 0;
    int numberOfCourses = 0;
    int numberOfSubjects = 0;
    
    try {
    // Create an instance of DashbordContentDBUtil
    DashbordContentDBUtil dbUtil = new DashbordContentDBUtil();

    numberOfStudents = dbUtil.countStudents();
    numberOfTeachers = dbUtil.countTeachers();
    numberOfCourses = dbUtil.countCourses();
    numberOfSubjects = dbUtil.countSubjects();
    
    } 
    
    catch (Exception e) {
        e.printStackTrace();
    }
%> 


<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Admin Dashboard</h1>
</div>

<!-- Content Row -->
<div class="row">

    <!-- number Of Students -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                            Registered</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%= numberOfStudents %> Students</div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-users fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- number Of Teachers -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                            Staff of</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%= numberOfTeachers %> Teachers</div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-street-view fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- number Of Courses -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-info shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                            We Offer</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%= numberOfCourses %> Courses</div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-graduation-cap fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- number Of Subjects -->
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-warning shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                            We Teach</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><%= numberOfSubjects %> Subjects</div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-book fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Content Row -->

<div class="row">

    <!-- Area Chart -->
    <div class="col-xl-8 col-lg-7">
        <div class="card shadow mb-4">
            <!-- Calender -->
            <div
                class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">Course Preferences</h6>
                
            </div>
            <!-- Card Body -->
            <div class="card-body col-md-12">
                <%@ include file = "DashboardGraph.jsp" %>
            </div>
        </div>
    </div>

    <!-- Latest Notices -->
    <div class="col-xl-4 col-lg-5">
        <div class="card shadow mb-4">
            <!-- Card Header -->
            <div
                class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">Latest Notices</h6>
            </div>
            <!-- Card Body -->
            <div class="card-body pb-2">
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <% 
                        try {
                            // Create an instance of NoticeDBUtil
                            NoticeDBUtil dbUtil = new NoticeDBUtil();

                            // Retrieve latest 3 notices
                            List<Notice> notices = dbUtil.get3Notices();
                            
                            boolean isFirst = true;
                            // Display the notices
                            for (Notice notice : notices) {
                        %>

                        <div class="carousel-item <%= isFirst ? "active" : "" %>">
                            <div class="card mb-3">
                                <img src="<%= notice.getNoticeImage() %>" class="card-img-top img-fluid" alt="<%= notice.getNoticeTitle() %>" height="200px">
                                <div class="card-body">
                                    <h5 class="card-title m-0 font-weight-bold text-primary"><%= notice.getNoticeTitle() %></h5>
                                    <p class="card-text mb-1 small text-dark"><%= notice.getNoticeContent() %></p>
                                    <p class="card-text"><small class="text-muted"><%= notice.getNoticeDate() %> &nbsp;|&nbsp; For : <%= notice.getNoticeGroup() %></small></p>

                                </div>
                            </div>
                        </div>

                        <%
                            isFirst = false;
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>

                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>


    </div>
</div>

