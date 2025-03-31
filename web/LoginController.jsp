<%-- 
    Document   : LoginController
    Created on : Jun 9, 2024, 9:44:08 AM
    Author     : HOME
--%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="com.entity.User"%>
<%@page import="com.dao.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    UserDao userDao = new UserDao();
    String feedbackMsg = ""; // To store feedback messages

    if (email != null && password != null) {
        User user = userDao.loginUser(email, password);

        if (user != null) {
            // Login successful
//            HttpSession hs = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("user/home.jsp"); // Redirect to the home page
        } else {
            // Invalid login
            feedbackMsg = "Invalid email or password. Please try again.";
        }
    } else {
        // Missing credentials
        feedbackMsg = "Email and password cannot be empty.";
    }

    // If there's a feedback message, set it as a request attribute and forward to the login page
    if (!feedbackMsg.isEmpty()) {
        request.setAttribute("feedbackMsg", feedbackMsg);
        request.getRequestDispatcher("Login.jsp").forward(request, response);
    }
%>

    </body>
</html>