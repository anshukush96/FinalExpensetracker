/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

/**
 *
 * @author HOME
 */


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.db.DBConnection;
import com.entity.Income;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class IncomeDao {
    public boolean addIncome(Income income) {
        String query = "INSERT INTO income (title, amount, date,user_id) VALUES (?, ?, ?,?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
             
            stmt.setString(1, income.getTitle());
            stmt.setDouble(2, income.getAmount());
             stmt.setDate(3, new java.sql.Date(income.getDate().getTime()));
            stmt.setInt(4, income.getUser_id());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Income> getAllIncomeByUser(int userId) {
        List<Income> list = new ArrayList<>();
        String query = "SELECT * FROM income WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
             
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                   Income income= new Income(
                            rs.getString("title"),
                            rs.getDouble("amount"),
                            rs.getDate("date"),
                            rs.getInt("user_id")
                    );
                   income.setId(rs.getInt("id"));
                    list.add(income);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
// Method to get current income (optional)
}
