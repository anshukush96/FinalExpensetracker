<%-- 
    Document   : add_income
    Created on : Mar 29, 2025, 7:09:46 PM
    Author     : HOME
--%>
<%@page import="com.entity.User"%>
<%@page import="java.io.IOException"%>
<%@page import="com.dao.IncomeDao"%>
<%@page import="com.entity.Income"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Add Income</title>
        <%@include file="../component/all_css.jsp"%>

        <style type="text/css">
            .card-sh {
                box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
            }

            .row {
                padding-top: 10px;
            }
        </style>

    </head>
    <body class="bg-light">

        <c:if test="${empty user }">
            <c:redirect url="../Login.jsp"></c:redirect>
        </c:if>

        <%@include file="../component/navbar.jsp"%>

        <div class="carousel-item active">
            <img src="https://png.pngtree.com/thumb_back/fh260/background/20201026/pngtree-d-illustration-mock-up-scene-geometry-shape-platform-forms-for-product-image_437729.jpg" class="d-block w-100" alt="Internet Issue"
                 height="600px">
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card card-sh">
                        <div class="card-header text-center">
                            <p class="fs-3">Add Income</p>
                            <c:if test="${not empty msg}">
                                <p class="text-center text-success fs-7">${msg}</p>
                                <c:remove var="msg" />
                            </c:if>
                        </div>
                         <div class="card-body">
                        <form action="../saveIncome" method="post" class="mb-3">
                            <div class="row">
                                <div class="mb-3">
                                    <label for="title" style="color: black">Expense Title:</label>
                                    <input type="text" id="title" name="title" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label for="amount" style="color: black">Amount:</label>
                                    <input type="number" id="amount" name="amount" class="form-control" required>
                                </div>
                               <div class="mb-3">
                                    <label for="date" style="color: black">Date:</label>
                                    <input type="date" id="date" name="date" class="form-control" required>
                                </div>
                                <div class="col align-self-end">
                                    <button type="submit" class="btn btn-primary mt-2">Add Expense</button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>




</body>
</html>