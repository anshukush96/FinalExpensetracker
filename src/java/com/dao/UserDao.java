/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.db.DBConnection;
import com.entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;
import org.mindrot.jbcrypt.BCrypt;

public class UserDao {
    private Connection conn;

    // Constructor to get Database Connection
    public UserDao() {
        conn = DBConnection.getConnection();
    }

    // ✅ **Save User (Register User)**
    public boolean saveUser(User user) {
        boolean success = false;
        try {
            String query = "INSERT INTO user (name, email, password, number) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
 
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    // ✅ **Login User**
    public User loginUser(String email, String password) {
        User user = null;
        try {
            String query = "SELECT * FROM user WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String hashedPassword = rs.getString("password"); // Get hashed password from DB
                // Check if the entered password matches the hashed password
                if (BCrypt.checkpw(password, hashedPassword)) {
                    user = new User(rs.getString("name"), email, hashedPassword, rs.getString("number"));
                    user.setId(rs.getInt("id"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public boolean emailExists(String email) {
    boolean exists = false;
    try {
        String query = "SELECT * FROM user WHERE email = ?";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();

        exists = rs.next();  // If rs.next() returns true, the email exists
    } catch (Exception e) {
        e.printStackTrace();
    }
    return exists;
}
    
//    public boolean emailExists(String email) {
//        boolean exists = false;
//        String sql = "SELECT COUNT(*) FROM users WHERE email = ?";
//
//        try (Connection conn = DatabaseConnection.getConnection();
//             PreparedStatement pstmt = conn.prepareStatement(sql)) {
//             
//            pstmt.setString(1, email);
//            ResultSet rs = pstmt.executeQuery();
//
//            if (rs.next()) {
//                exists = rs.getInt(1) > 0; // If count > 0, email exists
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return exists;
//    }
    // ✅ **Fetch User By ID**
    public User getUserById(int userId) {
        User user = null;
        try {
            String query = "SELECT * FROM user WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User(rs.getString("name"), rs.getString("email"), rs.getString("password"), rs.getString("number"));
                user.setId(rs.getInt("id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    // ✅ **Update User**
    public boolean updateUser(User user) {
        boolean success = false;
        try {
            String query = "UPDATE user SET name=?, email=?, password=?, phone=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setInt(5, user.getId());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    // ✅ **Delete User**
    public boolean deleteUser(int userId) {
        boolean success = false;
        try {
            String query = "DELETE FROM user WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
    public static void main(String[] args) {
        UserDao dao = new UserDao();

        // Creating a sample user
//        User newUser = new User("John Doe", "john@example.com", "password123", "9876543210");

        Scanner sc = new Scanner(System.in);

//         📌 1️⃣ Creating a sample user
        
//        if (dao.saveUser(newUser)) {
//            System.out.println("✅ User registered successfully!");
//        } else {
//            System.out.println("❌ User registration failed.");
//        }

        // 📌 2️⃣ Login User
//        System.out.println("\nLogging in with email: john@example.com and password: password123");
        User loggedInUser = dao.loginUser("anshu@gmail.com", "anshu9685");
        if (loggedInUser!= null) {
            
            System.out.println("✅ Login successful! Welcome, " + loggedInUser.getName() +loggedInUser);
        } else {
            System.out.println("❌ Login failed. Invalid credentials.");
        }

        // 📌 3️⃣ Fetch User By ID (assuming ID = 1)
//        System.out.println("\nFetching user details by ID...");
//        int userId = 3;  // Change if needed
//        User fetchedUser = dao.getUserById(userId);
//        if (fetchedUser != null) {
//            System.out.println("✅ User Found: " + fetchedUser.getName() + " (" + fetchedUser.getEmail() + ")");
//        } else {
//            System.out.println("❌ User not found.");
//        }
//
        // 📌 4️⃣ Update User Details
//        System.out.println("\nUpdating user details...");
//        if (fetchedUser != null) {
//            fetchedUser.setName("John Updated");
//            fetchedUser.setPhone("1234567890");
//            if (dao.updateUser(fetchedUser)) {
//                System.out.println("✅ User updated successfully!");
//            } else {
//                System.out.println("❌ User update failed.");
//            }
//        }

        // 📌 5️⃣ Delete User
//        System.out.println("\nDeleting user...");
//        if (dao.deleteUser(userId)) {
//            System.out.println("✅ User deleted successfully!");
//        } else {
//            System.out.println("❌ User deletion failed.");
//        }
//
//        sc.close();
    }
}
