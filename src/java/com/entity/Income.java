/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entity;

import java.sql.Date;

/**
 *
 * @author HOME
 */
public class Income {
    private int id;
    private String title;
    private double amount;
     private java.util.Date date;
    private int user_id;
    // Constructor
    public Income() {
    }

    public Income(int id, String title, double amount, java.util.Date date, int user_id) {
        this.id = id;
        this.title = title;
        this.amount = amount;
        this.date = date;
        this.user_id = user_id;
    }

    public Income(String string, double aDouble, Date date, int aInt) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }


  

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

    public java.util.Date getDate() {
        return date;
    }

    public void setDate(java.util.Date date) {
        this.date = date;
    }

    

    

    

    
}

