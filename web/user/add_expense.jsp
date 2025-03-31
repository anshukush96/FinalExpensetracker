<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Add Expense</title>
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
                            <p class="fs-3">Add Expense</p>
                            <c:if test="${not empty msg}">
                                <p class="text-center text-success fs-7">${msg}</p>
                                <c:remove var="msg" />
                            </c:if>
                        </div>
                        <div class="card-body">
                            <form action="../saveExpense" method="post">
<!--                                <div class="mb-3">
                                    <label><i class="fa-solid fa-book-open-reader"></i>
                                        ID</label> <input type="number" name="id" class="form-control"
                                                      required="required" placeholder="Enter no.">
                                </div>-->
                                <div class="mb-3">
                                    <label><i class="fa-solid fa-book-open-reader"></i>
                                        Title</label> <input type="text" name="title" class="form-control"
                                                         required="required" placeholder="Enter Title">
                                </div>
                                <div class="mb-3">
                                    <label><i class="fa-solid fa-indian-rupee-sign"></i>
                                        Amount</label> <input type="number" name="amount" class="form-control"
                                                          required="required" placeholder="Enter Price">
                                </div>

                                <div class="mb-3">
                                    <label><i class="fa-regular fa-calendar-plus"></i> Date</label>
                                    <input type="date" name="date" class="form-control"
                                           required="required">
                                </div>

                                <div class="mb-3">
                                    <label><i class="fa-regular fa-clipboard"></i>
                                        Description</label> <input type="text" name="description"
                                                               class="form-control" required="required" placeholder="Enter Description">
                                </div>



                                <button class="btn btn-success col-md-12 btn btn-info">Add</button><br>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>