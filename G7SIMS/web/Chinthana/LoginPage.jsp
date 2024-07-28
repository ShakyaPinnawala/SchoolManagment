<%-- 
    IT22090294
    Chinthana Weligamage
    G7SIMS - School Information Management System
--%>

<%@ page import="javax.servlet.http.*" %>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>G7SIMS</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="Chinthana/css/sb-admin-2.css" rel="stylesheet">
    <link href="Chinthana/css/LoginPage.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary hero" >

    <div class="position-relative mt-80"></div>
    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9 ">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block"><!--  bg-login-image -->
                                <div class="text-center">
                                    <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 15rem; padding: 6rem 5rem 2rem 5rem" src="Chinthana/images/G7Logo.png" alt="...">
                                    <div class="text-center">
                                        <h2 class="h5 text-gray-900 mb-4"><b>School Information Management System</b></h3>
                                            <h3 class="h6 text-gray-900 mb-4">By: SLIIT/SE/OOP/2023/S2/MLB/WD/G7</h3>
                                    </div>
                                </div>

                            </div> 
                            <div class="col-lg-6 bg-gradient-primary">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h1 text-white-900 mb-4">G7 SIMS</h1>
                                    </div>
                                    <form class="user" action="LoginControlServlet" method="post">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                   id="exampleInputEmail" aria-describedby="emailHelp"
                                                   placeholder="Enter Username..." name="txtUsername" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                   id="exampleInputPassword" placeholder="Password" name="txtPassword" required>
                                        </div>
                                        <br>
                                        <div class="form-group">
                                            <input type="submit" class="btn btn-primary btn-user btn-block"
                                                   value="Login">
                                        </div>

                                    </form>
                                    <br>
                                    <br>
                                    <div class="text-center">
                                        <a class="small" href="#">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="Chinthana/UserRegister.jsp">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>


<%
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("loginAttemt")) {
                int cookieValue = Integer.decode(cookie.getValue());
                if (cookieValue < 3) {
                    out.println("<script>window.alert('Invalid Username or Password! You have " + (3 - cookieValue) + " more attempt.');</script>");
                }
                else {
                    out.println("<script>window.alert('Too many login attempts. Try again later');</script>");
                }
            }
        }
    }
%>