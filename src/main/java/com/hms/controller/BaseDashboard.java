package main.java.com.hms.controller;

import javax.swing.JFrame;

/**
 * A base class for all dashboard views to demonstrate object-oriented programming (OOP).
 * It holds common variables that subclasses can access using the 'protected' modifier.
 */
public class BaseDashboard extends JFrame {
    // This is the protected variable that subclasses (Doctor, Patient, Staff dashboards) can use
    protected int userId;

    public BaseDashboard(int userId) {
        this.userId = userId;
    }
}
