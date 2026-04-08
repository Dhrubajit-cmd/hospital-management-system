package main.java.com.hms.controller;

import javax.swing.JFrame;

public class BaseDashboard extends JFrame {
    // This is the protected variable that subclasses (Doctor, Patient, Staff
    // dashboards) can use
    protected int userId;

    public BaseDashboard(int userId) {
        this.userId = userId;
    }
}
