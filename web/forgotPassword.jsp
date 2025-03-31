<%-- 
    Document   : forgotPassword
    Created on : Mar 29, 2025, 12:50:15 AM
    Author     : HOME
--%>
<%@page import="com.dao.UserDao"%>
<%--<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>--%>
<%@ page import="java.util.Properties"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="path/to/your/css">
</head>

    <div class="container">
        <h2>Forgot Password</h2>
        <form action="forgotPassword.jsp" method="post">
            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" class="form-control" placeholder="Enter your email" required>
            </div>
            <button type="submit" class="btn btn-primary">Send Reset Link</button>
        </form>
    </div>
</body>
    <%
    String email = request.getParameter("email");
    String resetLink = "http://localhost:8080/finalExpensetrackerProject/resetPassword.jsp?email=" + email;

    UserDao userDao = new UserDao();

    try {
        // Check if the email exists in the database
        boolean emailExists = userDao.emailExists(email);
        
        if (emailExists) {
            // Sending email logic
            String subject = "Password Reset Request";
            String body = "Click the link below to reset your password:\n" + resetLink;

            // Setup mail server
            Properties properties = new Properties();
            properties.put("mail.smtp.host", "your_smtp_host");
            properties.put("mail.smtp.port", "your_smtp_port"); // e.g., "587"
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");

            // Authenticate and send email
            Session mailSession = Session.getInstance(properties, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("your_email@example.com", "your_email_password");
                }
            });

            MimeMessage message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress("your_email@example.com"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            message.setSubject(subject);
            message.setText(body);

            Transport.send(message);
            out.println("<p>Reset link sent to your email!</p>");
        } else {
            out.println("<p>Email does not exist.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Something went wrong. Please try again later.</p>");
    }
%>

</html>

