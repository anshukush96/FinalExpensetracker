package com.servlet;

import com.dao.ExpenseDao;
import com.entity.Expense;
import com.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/updateExpense")
public class UpdateExpenseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        // Check if user is logged in
        if (user == null) {
            session.setAttribute("msg", "User not logged in!");
            resp.sendRedirect("Login.jsp");
            return;
        }

        try {
            // Retrieve parameters from the request
            int id = Integer.parseInt(req.getParameter("id"));
            String title = req.getParameter("title");
            String dateStr = req.getParameter("date");
            String description = req.getParameter("description");
            double amount = Double.parseDouble(req.getParameter("amount"));

            // Create an Expense object
            Expense expense = new Expense(title, amount, Date.valueOf(dateStr), description);
            expense.setId(id); // Set the ID for the expense to update
            expense.setUserId(user.getId()); // Set user ID from the session

            // Use the DAO to update the expense
            ExpenseDao dao = new ExpenseDao();
            boolean success = dao.updateExpense(expense);

            // Set a success or error message in the session
            if (success) {
                session.setAttribute("msg", "Expense Updated Successfully");
            } else {
                session.setAttribute("msg", "Failed to update expense. Please try again.");
            }
        } catch (NumberFormatException e) {
            session.setAttribute("msg", "Invalid input format. Please check your data.");
        } catch (Exception e) {
            session.setAttribute("msg", "An error occurred: " + e.getMessage());
            e.printStackTrace(); // For debugging purposes
        }

        // Redirect to the view expenses page
        resp.sendRedirect("user/view_expense.jsp");
    }
}

