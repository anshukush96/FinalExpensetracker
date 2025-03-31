<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Login Page</title>
 <script>
        function showPopup(message) {
            alert(message); // Simple alert for demonstration
        }
    </script>
        <%@include file="component/all_css.jsp"%>

        <style type="text/css">
            .card-sh {
                box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
            }

            .row {
                padding-top: 70px;
            }
        </style>

    </head>
    <body>
        <%@include file="component/navbar.jsp"%>

        <div class="carousel-item active">
            <img src="https://t3.ftcdn.net/jpg/03/55/60/70/360_F_355607062_zYMS8jaz4SfoykpWz5oViRVKL32IabTP.jpg" class="d-block w-100" alt="Internet Issue"
                 height="600px">
        </div>

        <div class="container p-5">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card card-sh">
                        <div class="card-header">
                            <p class="text-center fs-3">Login Page</p>
                            <c:if test="${not empty msg}">
                                <p class="text-center text-danger fs-7">${msg}</p>
                                <c:remove var="msg" />
                            </c:if>
                        </div>
                        <div class="card-body">
                            <form action="LoginController.jsp" method="post">

                                <div class="mb-3">
                                    <label><i class="fa-solid fa-envelope"></i> Email</label> <input
                                        type="text" name="email" class="form-control" placeholder="Enter Email">
                                </div>
                                <div class="mb-3">
                                    <label><i class="fa-solid fa-key"></i> Password</label> <input
                                        type="text" name="password" class="form-control" placeholder="Enter Password">
                                </div>
                                <button class="btn btn-success col-md-12 btn btn-info"type="submit" value="submit">Login</button>
                                <div class="text-center mt-2">
                                    Don't have account? <a href="Register.jsp"
                                                           class="text-decoration-none">Create One</a>
                                </div>
                                
<!--                            <div class="text-center mt-2">
                                <a href="forgotPassword.jsp" class="text-decoration-none">Forgot Password?</a>
                            </div>-->
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
 <%
        // Example feedback based on conditions
        String feedbackMsg = (String) request.getAttribute("feedbackMsg");
        if (feedbackMsg != null) {
            out.println("<script>showPopup('" + feedbackMsg + "');</script>");
        }
    %>


    </body>
</html>