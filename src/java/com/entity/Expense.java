/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entity;
import java.util.Date;

public class Expense {
    private int id;
    private String title;
    private double amount;
    private Date date;
    private String description;
    private int userId; // Instead of User object, we store user ID directly

    public Expense() {}

    public Expense(int id,String title, double amount, Date date, String description, int userId) {
        this.id = id;
        this.title = title;
        this.amount = amount;
        this.date = date;
        this.description = description;
        this.userId = userId;
    }
     public Expense(String title, double amount, Date date, String description, int userId) {
       
        this.title = title;
        this.amount = amount;
        this.date = date;
        this.description = description;
        this.userId = userId;
    }

//    public Expense(int id, String title, String description, String date, double amount, int id0) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }

//    public Expense(String title, double amount, java.sql.Date valueOf, String description) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }

    public Expense(String title, double amount, java.sql.Date valueOf, String description) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Expense(String title, double amount, Date date, String description) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
   
   


    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}