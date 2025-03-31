<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="com.db.DBConnection, com.dao.UserDao, com.entity.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Information</title>
    <%@ include file="../component/all_css.jsp" %>

    <style>
        .card-sh {
            box-shadow: 0 0 6px rgba(0, 0, 0, 0.3);
        }
        .row {
            padding-top: 10px;
        }
    </style>
</head>
<body class="bg-light">

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><i class="fa-solid fa-money-check"></i> Expense Tracker</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <c:if test="${not empty user}">
                        <li class="nav-item"><a class="nav-link active" href="user/home.jsp"><i class="fa-solid fa-house"></i> Home</a></li>
                    </c:if>
                </ul>
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <c:if test="${not empty user}">
                        <li class="nav-item"><a class="nav-link active" href="Userinfo.jsp">${user.name}</a></li>
                        <li class="nav-item"><a class="nav-link active" href="logout"><i class="fa-solid fa-right-to-bracket"></i> Logout</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>

    <!-- User Information -->
    <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card card-sh">
                    <div class="card-header text-center">
                        <p class="fs-3">User Information</p>
                    </div>
                    <div class="card-body">
                        <form method="post">
                            <%
                                User user = (User) session.getAttribute("user");
                                if (user != null) {
                                    try (Connection conn = DBConnection.getConnection();
                                         PreparedStatement ps = conn.prepareStatement("SELECT * FROM user WHERE id = ?")) {
                                        ps.setInt(1, user.getId());
                                        try (ResultSet rs = ps.executeQuery()) {
                                            if (rs.next()) {
                            %>
                            <label><i class="fa-solid fa-circle-user"></i> <b>Name</b></label><br>
                            &nbsp;&nbsp; &nbsp; <%= rs.getString("name") %><br><br>

                            <label><i class="fa-solid fa-envelope"></i> <b>Email</b></label><br>
                            &nbsp;&nbsp; &nbsp; <%= rs.getString("email") %><br><br>

                            <label><i class="fa-solid fa-key"></i> <b>Password</b></label><br>
                            &nbsp;&nbsp; &nbsp; ********<br><br>

                            <label><i class="fa-solid fa-phone"></i> <b>Mobile Number</b></label><br>
                            &nbsp;&nbsp; &nbsp; <%= rs.getString("number") %><br><br>
                            <%
                                            }
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                }
                            %>

                            <!-- Back Button -->
                            <a href="user/home.jsp" class="btn btn-primary col-md-12">Back</a>

                            <!-- Delete Account -->
                            <br><br>
                            <h6 style="color: red">Warning: This account will be permanently deleted.</h6>
                            <input type="submit" name="deleteAccount" value="Delete Account" class="btn btn-danger col-md-12">
                        </form>

                        <%
                            // Delete Account Logic
                            if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("deleteAccount") != null) {
                                try (Connection conn = DBConnection.getConnection();
                                     PreparedStatement ps = conn.prepareStatement("DELETE FROM user WHERE id = ?")) {
                                    ps.setInt(1, user.getId());
                                    ps.executeUpdate();
                                    session.invalidate(); // Invalidate session after deletion
                                    out.flush(); // Ensure all output is sent before redirect
                                    response.sendRedirect("index.jsp"); // Redirect to homepage
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            }
                        %>

                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
