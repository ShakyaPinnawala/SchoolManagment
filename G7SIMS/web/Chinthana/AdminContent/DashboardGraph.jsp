<%@ page import="java.util.*" %>
<%@ page import="com.g7sims.chinthana.*" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>


<div class="container-fluid">
    <canvas id="myChart" style="width:100%;max-width:625px;height:800px;"></canvas>
</div>
<script>
    var courseData = [];
    var barColors = ["#4e73df", "#1cc88a", "#36b9cc", "#e74a3b", "#f6c23e", "#4e73df", "#1cc88a", "#36b9cc", "#e74a3b", "#f6c23e"];

    // Use JSP to include data from Java class
    <%
    CourseDBUtil courseDBUtil = new CourseDBUtil();
    ArrayList<Course> graphCourses = courseDBUtil.getCoursesGraphData();
    for (Course course : graphCourses) {
        out.println("courseData.push({");
        out.println("    courseId: '" + course.getCourseID() + "',");
        out.println("    courseName: '" + course.getCourseDiscription() + "',");
        out.println("    studentCount: '" + course.getStudentCount() + "'");
        out.println("});");
    }
    %>

    new Chart("myChart", {
        type: "bar",
        data: {
            labels: courseData.map(course => course.courseId),
            datasets: [{
                    backgroundColor: barColors,
                    data: courseData.map(course => course.studentCount)
                }]
        },
        options: {
            tooltips: {
                callbacks: {
                    title: function (tooltipItems, data) {
                        var courseId = data.labels[tooltipItems[0].index];
                        var course = courseData.find(course => course.courseId === courseId);
                        return course.courseName;
                    },
                    label: function (tooltipItem, data) {
                        return tooltipItem.yLabel;
                    }
                }
            },

            legend: {
                display: false
            },
            title: {
                display: true,
                text: "Student Preference for Different Courses"
            }
        }
    });
</script>
