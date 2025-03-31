/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.db.DBConnection;
import com.entity.Expense;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ExpenseDao {
    private Connection conn;

    public ExpenseDao() {
        this.conn = DBConnection.getConnection();
    }

    public boolean saveExpense(Expense expense) {
        boolean success = false;
        String query = "INSERT INTO expense (title, amount, date, description,user_id) VALUES (?,?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
//            ps.setInt(1, expense.getId());
            ps.setString(1, expense.getTitle());
            ps.setDouble(2, expense.getAmount());
            ps.setDate(3, new java.sql.Date(expense.getDate().getTime()));
            ps.setString(4, expense.getDescription());
            ps.setInt(5, expense.getUserId());
            success = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    public List<Expense> getAllExpensesByUser(int userId) {
        List<Expense> list = new ArrayList<>();
        String query = "SELECT * FROM expense WHERE user_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Expense expense = new Expense(
                            rs.getString("title"),
                            rs.getDouble("amount"),
                            rs.getDate("date"),
                            rs.getString("description"),
                            rs.getInt("user_id")
                    );
                    expense.setId(rs.getInt("id"));
                    list.add(expense);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Expense getExpenseById(int id) {
        Expense expense = null;
        String query = "SELECT * FROM expense WHERE id = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    expense = new Expense(
                            rs.getString("title"),
                            rs.getDouble("amount"),
                            rs.getDate("date"),
                            rs.getString("description"),
                            rs.getInt("user_id")
                    );
                    expense.setId(rs.getInt("id"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return expense;
    }

    public boolean updateExpense(Expense expense) {
        boolean success = false;
        String query = "UPDATE expense SET title=?, amount=?, date=?, description=?, user_id=? WHERE id=?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, expense.getTitle());
            ps.setDouble(2, expense.getAmount());
            ps.setDate(3, new java.sql.Date(expense.getDate().getTime()));
            ps.setString(4, expense.getDescription());
//            ps.setInt(5, expense.getUserId());
            ps.setInt(5, expense.getId());
            success = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    public boolean deleteExpense(int id) {
        boolean success = false;
        String query = "DELETE FROM expense WHERE id = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            success = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    public double getTotalExpenseByUser(int userId) {
        double total = 0.0;
        String query = "SELECT SUM(amount) FROM expense WHERE user_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    total = rs.getDouble(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    public List<Expense> getExpensesByUserAndDateRange(int userId, String startDate, String endDate) {
        List<Expense> list = new ArrayList<>();
        String query = "SELECT * FROM expense WHERE user_id = ? AND date BETWEEN ? AND ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId);
            ps.setString(2, startDate);
            ps.setString(3, endDate);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Expense expense = new Expense(
                            rs.getString("title"),
                            rs.getDouble("amount"),
                            rs.getDate("date"),
                            rs.getString("description"),
                            rs.getInt("user_id")
                    );
                    expense.setId(rs.getInt("id"));
                    list.add(expense);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
     public static void main(String[] args) {
        ExpenseDao dao = new ExpenseDao();
        
        // Create a new expense
//        Expense newExpense = new Expense("Lunch", 15.50, new Date(System.currentTimeMillis()), "Lunch with friends", 1); // Assuming user_id is 1
//        if (dao.saveExpense(newExpense)) {
//            System.out.println("Expense saved successfully!");
//        }

        // Retrieve all expenses for user with ID 1
//        List<Expense> expenses = dao.getAllExpensesByUser(1);
//        System.out.println("Expenses for user 1:");
//        for (Expense expense : expenses) {
//            System.out.println(expense.getId() + ": " + expense.getTitle() + " - " + expense.getAmount());
//        }
//
//        // Update an expense (assume ID is 1)
//         int expenseId = 1;  // Change this to the ID you want to update
//        String title = "Updated Expense Title"; // New title
//        double amount = 200.0; // New amount
//        String description = "Updated Description"; // New description
//        Date date = Date.valueOf("2023-03-29"); // New date
//
//        // Create an Expense object with updated details
//        Expense updatedExpense = new Expense(title, amount, date, description);
//        updatedExpense.setId(expenseId); // Set the ID of the expense to update
//        updatedExpense.setUserId(1); // Set the user ID, assuming it's 1 for this example
//
//        // Call the updateExpense method
//        boolean isUpdated = dao.updateExpense(updatedExpense);
//
//        // Print the result
//        if (isUpdated) {
//            System.out.println("Expense updated successfully!");
//        } else {
//            System.out.println("Failed to update expense.");
//        }
//    
//
//        // Delete an expense (assume ID is 1)
//        if (dao.deleteExpense(1)) {
//            System.out.println("Expense deleted successfully!");
//        }
    }
}