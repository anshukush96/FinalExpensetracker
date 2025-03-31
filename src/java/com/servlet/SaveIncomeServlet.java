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
import com.dao.IncomeDao;
import com.entity.Income;
import com.entity.User;
import static java.lang.Double.parseDouble;


@WebServlet("/saveIncome")
public class SaveIncomeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            
            String title = req.getParameter("title");
            String dateStr = req.getParameter("date");  // String input from for
            double amount = parseDouble(req.getParameter("amount"));
            HttpSession session = req.getSession();
            User user = (User) session.getAttribute("user");

            if (user == null) {
                session.setAttribute("msg", "User not logged in!");
                resp.sendRedirect("user/add_income.jsp");
                return;
            }

            // Convert String date to java.util.Date
            Date date = convertToDate(dateStr);

            // Create Expense object and set its properties
            Income income= new Income();
            income.setTitle(title);
            income.setAmount(amount);
            income.setDate(date);
           
            income.setUser_id(user.getId());  // Set user ID from session

           IncomeDao incomeDao = new IncomeDao();
            boolean success = incomeDao.addIncome(income);

            if (success) {
                session.setAttribute("msg", "Income Added Successfully");
            } else {
                session.setAttribute("msg", "Something went wrong on Server!");
            }
            resp.sendRedirect("user/add_income.jsp");
        } catch (NumberFormatException | ParseException e) {
            e.printStackTrace();
            resp.sendRedirect("user/add_income.jsp?error=Invalid input format");
        }
    }

    // ✅ Convert String to java.util.Date
    private Date convertToDate(String dateStr) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilDate = sdf.parse(dateStr);
        return new Date(utilDate.getTime());  // Convert to java.sql.Date
    }
}
