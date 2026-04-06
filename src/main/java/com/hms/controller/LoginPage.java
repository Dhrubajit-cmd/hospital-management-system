package main.java.com.hms.controller;

import main.java.com.hms.util.DBConnection;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginPage extends JFrame implements ActionListener {
    JRadioButton patientBtn, doctorBtn, staffBtn;
    JTextField userField;
    JPasswordField passField;
    JButton loginBtn, resetBtn, registerBtn;
    ButtonGroup roleGroup;

    public LoginPage() {
        setTitle("Hospital Management System");
        setSize(400, 400);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLayout(null);

        // Title :
        JLabel title = new JLabel("Hospital Management System");
        title.setBounds(50, 20, 300, 30);
        title.setFont(new Font("Arial", Font.BOLD, 16));
        add(title);

        // Role Selection :
        patientBtn = new JRadioButton("Patient");
        doctorBtn = new JRadioButton("Doctor");
        staffBtn = new JRadioButton("Staff");

        patientBtn.setBounds(50, 70, 80, 30);
        doctorBtn.setBounds(140, 70, 80, 30);
        staffBtn.setBounds(230, 70, 80, 30);

        roleGroup = new ButtonGroup();
        roleGroup.add(patientBtn);
        roleGroup.add(doctorBtn);
        roleGroup.add(staffBtn);

        patientBtn.setSelected(true);

        add(patientBtn);
        add(doctorBtn);
        add(staffBtn);

        // Email :
        JLabel userLabel = new JLabel("Email:");
        userLabel.setBounds(50, 120, 100, 25);
        add(userLabel);

        userField = new JTextField();
        userField.setBounds(50, 145, 180, 25);
        add(userField);

        // Password :
        JLabel passLabel = new JLabel("Password:");
        passLabel.setBounds(50, 180, 100, 25);
        add(passLabel);

        passField = new JPasswordField();
        passField.setBounds(50, 205, 180, 25);
        add(passField);

        // Buttons :
        loginBtn = new JButton("Login");
        resetBtn = new JButton("Reset");

        loginBtn.setBounds(50, 250, 120, 30);
        resetBtn.setBounds(210, 250, 120, 30);

        add(loginBtn);
        add(resetBtn);

        // Register :
        registerBtn = new JButton(" New User Registration");
        registerBtn.setBounds(50, 290, 280, 30);
        add(registerBtn);

        // Action Listeners :
        loginBtn.addActionListener(this);
        resetBtn.addActionListener(this);
        registerBtn.addActionListener(this);

        setVisible(true);
    }

    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == loginBtn) {
            // We shall change this with the real DB Logic :
            String email = userField.getText();
            String pass = new String(passField.getPassword());
            
            if (email.isEmpty() || pass.isEmpty()) {
                JOptionPane.showMessageDialog(this, "Please enter both Email and Password.");
                return;
            }

            String query = "";
            if (patientBtn.isSelected())
                query = "SELECT * FROM Patient WHERE Email = ? AND Password = ?";
            else if (doctorBtn.isSelected())
                query = "SELECT * FROM Doctor WHERE Email = ? AND Password = ?";
            else
                query = "SELECT * FROM Staff WHERE Email = ? AND Password = ?";

            try {
                Connection con = DBConnection.getConnection();
                if (con == null) {
                    JOptionPane.showMessageDialog(this, "Database Connection Failed!");
                    return;
                }

                PreparedStatement pst = con.prepareStatement(query);
                pst.setString(1, email);
                pst.setString(2, pass);

                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    int userId = -1;
                    if (patientBtn.isSelected()) {
                        userId = rs.getInt("Patient_ID");
                    } else if (doctorBtn.isSelected()) {
                        userId = rs.getInt("Doctor_ID");
                    } else if (staffBtn.isSelected()) {
                        userId = rs.getInt("Staff_ID");
                    }

                    JOptionPane.showMessageDialog(this, "Login Successful! Welcome, " + (patientBtn.isSelected() ? "Patient" : doctorBtn.isSelected() ? "Doctor" : "Staff"));
                    
                    this.dispose();
                    if (patientBtn.isSelected()) {
                        new PatientDashboard(userId);
                    } else if (doctorBtn.isSelected()) {
                        new DoctorDashboard(userId);
                    } else {
                        new StaffDashboard(userId);
                    }
                } else {
                    JOptionPane.showMessageDialog(this, "Invalid Email or Password");
                }

                rs.close();
                pst.close();
                con.close();

            } catch (Exception ex) {
                ex.printStackTrace();
                JOptionPane.showMessageDialog(this, "Error: " + ex.getMessage());
            }
        }

        if (e.getSource() == resetBtn) {
            userField.setText("");
            passField.setText("");
            patientBtn.setSelected(true);
        }

        if (e.getSource() == registerBtn) {
            this.dispose();
            new RegistrationPage();
        }
    }

    public static void main(String args[]) {
        new LoginPage();
    }
}
