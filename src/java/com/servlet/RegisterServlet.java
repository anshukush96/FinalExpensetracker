/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.dao.UserDao;
import com.entity.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("pass");
        String phone = req.getParameter("number");

        User user = new User(name, email, password, phone);
        UserDao dao = new UserDao();
 if (dao.emailExists(email)) {
        req.setAttribute("error", "This email already exists.");
        req.getRequestDispatcher("Register.jsp").forward(req, resp);  // Forward to the registration page with an error message
        return;
    }

 String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
    user.setPassword(hashedPassword);
    
        if (dao.saveUser(user)) {
            resp.sendRedirect("Login.jsp");  // ✅ Redirecting to login page
        } else {
            req.setAttribute("error", "Registration Failed");
            req.getRequestDispatcher("Register.jsp").forward(req, resp);  // ✅ Correct way to forward request
        }
    }
}
