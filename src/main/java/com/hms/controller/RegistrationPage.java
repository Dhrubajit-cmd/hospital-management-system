package main.java.com.hms.controller;

import main.java.com.hms.util.DBConnection;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class RegistrationPage extends JFrame implements ActionListener {
    JRadioButton patientBtn, doctorBtn, staffBtn;
    ButtonGroup roleGroup;
    JTextField nameField, emailField, phoneField;
    JPasswordField passField;
    JButton registerBtn, backBtn;

    public RegistrationPage() {
        setTitle("Hospital Management System - Registration");
        setSize(400, 500);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLayout(null);

        // Title :
        JLabel title = new JLabel("User Registration");
        title.setBounds(120, 20, 200, 30);
        title.setFont(new Font("Arial", Font.BOLD, 18));
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
        patientBtn.setSelected(true); // Default

        add(patientBtn);
        add(doctorBtn);
        add(staffBtn);

        // Name :
        JLabel nameLabel = new JLabel("Full Name:");
        nameLabel.setBounds(50, 120, 100, 25);
        add(nameLabel);

        nameField = new JTextField();
        nameField.setBounds(50, 145, 280, 25);
        add(nameField);

        // Email :
        JLabel emailLabel = new JLabel("Email:");
        emailLabel.setBounds(50, 180, 100, 25);
        add(emailLabel);

        emailField = new JTextField();
        emailField.setBounds(50, 205, 280, 25);
        add(emailField);

        // Phone :
        JLabel phoneLabel = new JLabel("Phone:");
        phoneLabel.setBounds(50, 240, 100, 25);
        add(phoneLabel);

        phoneField = new JTextField();
        phoneField.setBounds(50, 265, 280, 25);
        add(phoneField);

        // Password :
        JLabel passLabel = new JLabel("Password:");
        passLabel.setBounds(50, 300, 100, 25);
        add(passLabel);

        passField = new JPasswordField();
        passField.setBounds(50, 325, 280, 25);
        add(passField);

        // Buttons :
        registerBtn = new JButton("Register");
        backBtn = new JButton("Back to Login");

        registerBtn.setBounds(50, 380, 130, 30);
        backBtn.setBounds(200, 380, 130, 30);

        add(registerBtn);
        add(backBtn);

        // Action Listeners
        registerBtn.addActionListener(this);
        backBtn.addActionListener(this);

        setVisible(true);
    }

    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == backBtn) {
            this.dispose();
            new LoginPage();
        }

        if (e.getSource() == registerBtn) {
            String name = nameField.getText();
            String email = emailField.getText();
            String phone = phoneField.getText();
            String pass = new String(passField.getPassword());

            if (name.isEmpty() || email.isEmpty() || phone.isEmpty() || pass.isEmpty()) {
                JOptionPane.showMessageDialog(this, "All fields are required!");
                return;
            }

            try {
                Connection con = DBConnection.getConnection();
                if (con == null) {
                    JOptionPane.showMessageDialog(this, "Database Connection Failed!");
                    return;
                }

                String query = "";
                if (patientBtn.isSelected()) {
                    query = "INSERT INTO Patient (Patient_Name, Email, Phone, Password) VALUES (?, ?, ?, ?)";
                } else if (doctorBtn.isSelected()) {
                    query = "INSERT INTO Doctor (Doctor_Name, Email, Phone, Password) VALUES (?, ?, ?, ?)";
                } else if (staffBtn.isSelected()) {
                    query = "INSERT INTO Staff (Staff_Name, Email, Phone, Password, Role) VALUES (?, ?, ?, ?, 'Staff')";
                }

                PreparedStatement pst = con.prepareStatement(query);
                pst.setString(1, name);
                pst.setString(2, email);
                pst.setString(3, phone);
                pst.setString(4, pass);

                int affectedRows = pst.executeUpdate();
                if (affectedRows > 0) {
                    JOptionPane.showMessageDialog(this, "Registration Successful!");
                    this.dispose();
                    new LoginPage();
                } else {
                    JOptionPane.showMessageDialog(this, "Registration Failed. Please try again.");
                }
                
                pst.close();
                con.close();

            } catch (Exception ex) {
                ex.printStackTrace();
                JOptionPane.showMessageDialog(this, "Error: " + ex.getMessage());
            }
        }
    }
}
