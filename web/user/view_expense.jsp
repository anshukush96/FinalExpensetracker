
<%@page import="com.entity.Income"%>
<%@page import="com.dao.IncomeDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Expense"%>
<%@page import="com.dao.ExpenseDao"%>
<%@page import="com.db.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>View Expense</title>
        <%@include file="../component/all_css.jsp"%>

        <style type="text/css">
            .card-sh {
                box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
            }
            .row {
                padding-top: 20px;
            }
        </style>
        <script>

        </script>
    </head>
    <body>

        <c:if test="${empty user}">
            <c:redirect url="../Login.jsp"></c:redirect>
        </c:if>

        <jsp:include page="../component/navbar.jsp" />

        <div class="carousel-item active">
            <img src="../img/h5.jpg" class="d-block w-100" alt="Internet Issue" height="600px">
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header text-center">
                            <p class="fs-3">All Expenses</p>

                            <c:if test="${not empty msg}">
                                <p class="text-center text-success fs-7">${msg}</p>
                                <c:remove var="msg" />
                            </c:if>
                        </div>

                        <div class="card-body">
                            <form action="view_expense.jsp" method="get" class="mb-3">
                                <div class="row" style="position: absolute; margin-left: 110%; margin-top: -10%">
                                    <div class="col">
                                        <label for="startDate" style="color: white">Start Date:</label>
                                        <input type="date" id="startDate" name="startDate" class="form-control" style="background-color: green">
                                    </div>
                                    <div class="col">
                                        <label for="endDate" style="color: white">End Date:</label>
                                        <input type="date" id="endDate" name="endDate" class="form-control" style="background-color: Red">
                                    </div>
                                    <div class="col align-self-end">
                                        <button type="submit" class="btn btn-primary mt-2" style="margin-left: 28%; padding: 3px 20px 3px 20px">Filter</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                        <!-- Filter Form -->


                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>Description</th>
                                    <th>Date</th>
                                    <th>Amount</th>
                                    <th>Action</th>
                                </tr>
                            </thead>




                            <%
                                ExpenseDao dao = new ExpenseDao();
                                User user = (User) session.getAttribute("user");
                                int userId = user.getId();

                                List<Expense> al = dao.getAllExpensesByUser(userId);
                                for (Expense ex : al) {
                            %>

                            <tr>
                                <td><%=ex.getTitle()%></td>
                                <td><%=ex.getDescription()%></td>
                                <td><%=ex.getDate()%></td>
                                <td><%=ex.getAmount()%></td>
                                <td>
                                    <a href="edit_expense.jsp?id=<%=ex.getId()%>" class="btn btn-sm btn-primary me-1">Edit</a>
                                    <a href="../deleteExpense?id=<%=ex.getId()%>" class="btn btn-sm btn-danger me-1">Delete</a>
                                </td>

                            </tr>

                            <%
                                }
                                double totalAmount = 0.0;
                                double sum = 0.0;

                                for (Expense ex : al) {
                                    try {
                                        // Convert the price from String to double
                                        double price = ex.getAmount();
                                        // Add the price to the sum
                                        sum += price;
                                    } catch (NumberFormatException e) {
                                        // Handle the case where the price is not a valid number
                                        e.printStackTrace();
                                    }
                                }
                                //                                totalAmount = Double.toString(sum);
                                totalAmount = sum;

                                System.out.println("Total Amount: " + totalAmount);
                            %>

                            <div style="margin-left: 650px;font-size: 40px;margin-top: -20px">
                                <h6>
                                    Total Amount:
                                    <%=totalAmount%></h6>
                            </div>
                        </table>
                    </div>
                </div>
            </div>
        </div>




    </body>
</html>