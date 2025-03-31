<%@page import="java.sql.*"%>
<%@page import="com.dao.ExpenseDao"%>
<%@page import="com.entity.Expense"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Edit Expense</title>
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

        <%
            int id = Integer.parseInt(request.getParameter("id"));
            ExpenseDao expenseDao = new ExpenseDao();
            Expense expense = expenseDao.getExpenseById(id);
        %>

        <%@include file="../component/navbar.jsp"%>

        <div class="carousel-item active">
            <img src="../img/img-8.png" class="d-block w-100" alt="Internet Issue" height="600px">
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card card-sh">
                        <div class="card-header text-center">
                            <p class="fs-3">Edit Expense</p>
                        </div>
                        <div class="card-body">
                            <form action="../updateExpense" method="post">
                                <div class="mb-3">
                                    <label><i class="fa-solid fa-book-open-reader"></i> Title</label>
                                    <input type="text" name="title" class="form-control" required="required" value="<%= expense != null ? expense.getTitle() : ""%>">
                                </div>

                                <div class="mb-3">
                                    <label><i class="fa-regular fa-calendar-plus"></i> Date</label>
                                    <input type="date" name="date" class="form-control" required="required" value="<%= expense != null ? expense.getDate() : ""%>">
                                </div>

                                <div class="mb-3">
                                    <label><i class="fa-regular fa-clipboard"></i> Description</label>
                                    <input type="text" name="description" class="form-control" required="required" value="<%= expense != null ? expense.getDescription() : ""%>">
                                </div>

                                <div class="mb-3">
                                    <label><i class="fa-solid fa-indian-rupee-sign"></i> Price</label>
                                    <input type="number" name="amount" class="form-control" required="required" value="<%= expense != null ? expense.getAmount() : ""%>">
                                </div>
                                <input type="hidden" name="id" value="<%= expense != null ? expense.getId() : 0%>">
                                <button class="btn btn-success col-md-12">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
