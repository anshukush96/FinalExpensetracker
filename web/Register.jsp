<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Registration Page</title>

        <%@include file="component/all_css.jsp"%>
   <style>
        /* Popup styles */
        #popup {
            display: none;
            position: fixed;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            border: 1px solid #ccc;
            background-color: #fff;
            padding: 20px;
            z-index: 1000;
        }
        #overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }
    </style>
    <script>
        function showPopup(message) {
            document.getElementById('popup-message').innerText = message;
            document.getElementById('popup').style.display = 'block';
            document.getElementById('overlay').style.display = 'block';
        }

        function closePopup() {
            document.getElementById('popup').style.display = 'none';
            document.getElementById('overlay').style.display = 'none';
        }

        window.onload = function() {
            // Show popup if there's an error message
            var errorMessage = '${not empty error ? error : ""}';
            if (errorMessage) {
                showPopup(errorMessage);
            }
        }
    </script>
        <style type="text/css">
            .card-sh {
                box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
            }
            .error {
                color: red;
                font-size: 0.7em;
            }
        </style>

        <script>
            function validateName() {
                const nameInput = document.getElementsByName('name')[0];
                const nameValue = nameInput.value;
                const namePattern = /^[A-Za-z\s'-]+$/;
                const errorMessage = document.getElementById('nameError');

                if (!namePattern.test(nameValue)) {
                    errorMessage.textContent = 'Please enter a valid name (letters, spaces, hyphens, and apostrophes only).';
                    return false;
                } else {
                    errorMessage.textContent = '';
                    return true;
                }
            }

            function validateForm() {
                return validateName();
            }
        </script>


    </head>
    <body>
        <%@include file="component/navbar.jsp"%>


        <div class="carousel-item active">
            <img src="https://images.pexels.com/photos/531880/pexels-photo-531880.jpeg?cs=srgb&dl=pexels-pixabay-531880.jpg&fm=jpg" class="d-block w-100" alt="Internet Issue"
                 height="600px">
        </div>

        <div class="container p-5">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card card-sh">
                        <div class="card-header">
                            <p class="text-center fs-3">Register Page</p>
                            <c:if test="${not empty msg}">
                                <p class="text-center text-success fs-7">${msg}</p>
                                <c:remove var="msg" />
                            </c:if>
                        </div>

                        <div class="card-body">
                            <form action="register" method="post">
                                <div class="mb-3">
                                    <label><i class="fa-solid fa-user"></i> Enter Name</label> <!-- <input
                                            type="text" name="name" required="required"
                                            class="form-control" placeholder="Enter Full Name"> -->

                                    <input type="text" name="name" required="required"
                                           class="form-control" placeholder="Enter Full Name"
                                           oninput="validateName()"> <span id="nameError"
                                           class="error"></span>
                                </div>
                                <div class="mb-3">
                                    <label><i class="fa-solid fa-envelope"></i> Email</label> <input
                                        type="email" name="email" required="required"
                                        class="form-control" placeholder="Enter Email">
                                </div>
                                <div class="mb-3">
                                    <label><i class="fa-solid fa-key"></i> Password</label> <input
                                        type="password" name="pass" required="required"
                                        class="form-control" placeholder="Enter Password">
                                </div>
                                <div class="mb-3">
                                    <label><i class="fa-solid fa-mobile-screen-button"></i>
                                        Mobile Number</label> <input type="number" name="number"
                                                                 required="required" class="form-control"
                                                                 placeholder="Enter Mobile Number">
                                </div>
                                <button class="btn btn-success col-md-12 btn btn-info">Register</button>
                                <div class="text-center mt-2">
                                    Already have account? <a href="Login.jsp"class="text-decoration-none">Login Here</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

 
    <div id="overlay" onclick="closePopup()"></div>
    <div id="popup">
        <p id="popup-message"></p>
        <button onclick="closePopup()">Close</button>
    </div>

    </body>
</html>