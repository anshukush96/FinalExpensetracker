package com.servlet;

import java.io.IOException;
import java.sql.Date;  // Import for SQL Date
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dao.ExpenseDao;
import com.entity.Expense;
import com.entity.User;
import static java.lang.Double.parseDouble;
import static java.lang.Integer.parseInt;

@WebServlet("/saveExpense")
public class SaveExpenseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            
            String title = req.getParameter("title");
            String dateStr = req.getParameter("date");  // String input from form
            String description = req.getParameter("description");
            double amount = parseDouble(req.getParameter("amount"));
            HttpSession session = req.getSession();
            User user = (User) session.getAttribute("user");

            if (user == null) {
                session.setAttribute("msg", "User not logged in!");
                resp.sendRedirect("user/add_expense.jsp");
                return;
            }

            // Convert String date to java.util.Date
            Date date = convertToDate(dateStr);

            // Create Expense object and set its properties
            Expense expense = new Expense();
            expense.setTitle(title);
            expense.setAmount(amount);
            expense.setDate(date);
            expense.setDescription(description);
            expense.setUserId(user.getId());  // Set user ID from session

            ExpenseDao expenseDao = new ExpenseDao();
            boolean success = expenseDao.saveExpense(expense);

            if (success) {
                session.setAttribute("msg", "Expense Added Successfully");
            } else {
                session.setAttribute("msg", "Something went wrong on Server!");
            }
            resp.sendRedirect("user/add_expense.jsp");
        } catch (NumberFormatException | ParseException e) {
            e.printStackTrace();
            resp.sendRedirect("user/add_expense.jsp?error=Invalid input format");
        }
    }

    // ✅ Convert String to java.util.Date
    private Date convertToDate(String dateStr) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilDate = sdf.parse(dateStr);
        return new Date(utilDate.getTime());  // Convert to java.sql.Date
    }
}
