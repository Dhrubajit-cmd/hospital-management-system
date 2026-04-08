package main.java.com.hms.controller;

import main.java.com.hms.util.DBConnection;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PatientDashboard extends BaseDashboard {
    private JTable recordsTable;
    private JTable billingTable;

    // Emergency Fields
    private JTextField erTypeField;
    private JComboBox<String> erPriorityBox;

    public PatientDashboard(int patientId) {
        super(patientId);

        setTitle("Patient Dashboard");
        setSize(800, 600);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLayout(new BorderLayout());

        JLabel titleLabel = new JLabel("Patient Dashboard", SwingConstants.CENTER);
        titleLabel.setFont(new Font("Arial", Font.BOLD, 24));
        add(titleLabel, BorderLayout.NORTH);

        JTabbedPane tabbedPane = new JTabbedPane();

        // 1. Medical Records Tab
        JPanel recordsPanel = new JPanel(new BorderLayout());
        recordsTable = new JTable();
        loadMedicalRecords();
        JScrollPane recordsScrollPane = new JScrollPane(recordsTable);
        recordsPanel.add(recordsScrollPane, BorderLayout.CENTER);
        tabbedPane.addTab("Medical Records", recordsPanel);

        // 2. Billing Tab
        JPanel billingPanel = new JPanel(new BorderLayout());
        billingTable = new JTable();
        loadBillingRecords();
        JScrollPane billingScrollPane = new JScrollPane(billingTable);
        billingPanel.add(billingScrollPane, BorderLayout.CENTER);
        
        JPanel billingBottomPanel = new JPanel();
        JButton payBillBtn = new JButton("Make Full Payment (Demo)");
        payBillBtn.addActionListener(this::processPayment);
        billingBottomPanel.add(payBillBtn);
        billingPanel.add(billingBottomPanel, BorderLayout.SOUTH);

        tabbedPane.addTab("Billing", billingPanel);

        // 3. Emergency Request Tab
        JPanel erPanelOuter = new JPanel(new BorderLayout());
        JPanel erPanel = new JPanel(new GridLayout(4, 2, 10, 10));
        erPanel.setBorder(BorderFactory.createEmptyBorder(50, 150, 250, 150));

        erPanel.add(new JLabel("Request Type (e.g., Accident, Heart Attack):"));
        erTypeField = new JTextField();
        erPanel.add(erTypeField);

        erPanel.add(new JLabel("Priority Level (1-5):"));
        erPriorityBox = new JComboBox<>(new String[]{"1", "2", "3", "4", "5"});
        erPanel.add(erPriorityBox);

        JButton submitErBtn = new JButton("Submit Emergency Request");
        submitErBtn.addActionListener(this::submitEmergencyRequest);
        erPanel.add(submitErBtn);

        JButton cancelErBtn = new JButton("Cancel Pending Requests");
        cancelErBtn.addActionListener(this::cancelEmergencyRequest);
        erPanel.add(cancelErBtn);

        erPanelOuter.add(erPanel, BorderLayout.CENTER);
        tabbedPane.addTab("Emergency Request", erPanelOuter);

        add(tabbedPane, BorderLayout.CENTER);

        JPanel bottomPanel = new JPanel();
        JButton logoutBtn = new JButton("Logout");
        logoutBtn.addActionListener(e -> {
            this.dispose();
            new LoginPage();
        });
        bottomPanel.add(logoutBtn);
        add(bottomPanel, BorderLayout.SOUTH);

        setVisible(true);
    }

    // --- POLYMORPHISM DEMONSTRATION: Method Overloading ---
    private void showNotification(String message) {
        JOptionPane.showMessageDialog(this, message);
    }

    private void showNotification(String message, String title, int messageType) {
        JOptionPane.showMessageDialog(this, message, title, messageType);
    }
    // --------------------------------------------------------

    private void loadMedicalRecords() {
        DefaultTableModel model = new DefaultTableModel();
        model.addColumn("Record ID");
        model.addColumn("Diagnosis");
        model.addColumn("Treatment");
        model.addColumn("Admission Date");
        model.addColumn("Discharge Date");

        try (Connection con = DBConnection.getConnection()) {
            String query = "SELECT Record_ID, Diagnosis, Treatment, Admission_Date, Discharge_Date FROM Medical_Record WHERE Patient_ID = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, this.userId);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                model.addRow(new Object[]{
                        rs.getInt("Record_ID"),
                        rs.getString("Diagnosis"),
                        rs.getString("Treatment"),
                        rs.getDate("Admission_Date"),
                        rs.getDate("Discharge_Date")
                });
            }
            recordsTable.setModel(model);
        } catch (Exception ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(this, "Error loading medical records: " + ex.getMessage());
        }
    }

    private void loadBillingRecords() {
        DefaultTableModel model = new DefaultTableModel();
        model.addColumn("Bill ID");
        model.addColumn("Amount");
        model.addColumn("Status");
        model.addColumn("Date Issued");

        try (Connection con = DBConnection.getConnection()) {
            String query = "SELECT Bill_ID, Amount, Status, Date_Issued FROM Billing WHERE Patient_ID = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, this.userId);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                model.addRow(new Object[]{
                        rs.getInt("Bill_ID"),
                        rs.getBigDecimal("Amount"),
                        rs.getString("Status"),
                        rs.getTimestamp("Date_Issued")
                });
            }
            billingTable.setModel(model);
        } catch (Exception ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(this, "Error loading billing records: " + ex.getMessage());
        }
    }

    private void processPayment(ActionEvent e) {
        int selectedRow = billingTable.getSelectedRow();
        if (selectedRow == -1) {
            JOptionPane.showMessageDialog(this, "Please select a pending bill from the table to pay.");
            return;
        }

        String status = billingTable.getValueAt(selectedRow, 2).toString();
        if ("Paid".equalsIgnoreCase(status)) {
            JOptionPane.showMessageDialog(this, "This bill is already paid!");
            return;
        }

        int billId = (int) billingTable.getValueAt(selectedRow, 0);
        Object amount = billingTable.getValueAt(selectedRow, 1);

        int confirm = JOptionPane.showConfirmDialog(this, "Simulate full payment of $" + amount + " for Bill ID " + billId + "?", "Payment Demo", JOptionPane.YES_NO_OPTION);
        
        if (confirm == JOptionPane.YES_OPTION) {
            try (Connection con = DBConnection.getConnection()) {
                String query = "UPDATE Billing SET Status = 'Paid' WHERE Bill_ID = ?";
                PreparedStatement pst = con.prepareStatement(query);
                pst.setInt(1, billId);
                int updated = pst.executeUpdate();
                
                if (updated > 0) {
                    JOptionPane.showMessageDialog(this, "Payment successful (Demo)!");
                    loadBillingRecords(); // refresh the table UI
                }
            } catch (Exception ex) {
                ex.printStackTrace();
                JOptionPane.showMessageDialog(this, "Error processing payment: " + ex.getMessage());
            }
        }
    }

    private void submitEmergencyRequest(ActionEvent e) {
        String query = "INSERT INTO Emergency_Request (Patient_ID, Hospital_ID, Request_Type, Priority_Level, Req_Status) VALUES (?, 1, ?, ?, 'Pending')";
        try (Connection con = DBConnection.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
            pst.setInt(1, this.userId); // Automatically bound to logged-in user
            pst.setString(2, erTypeField.getText());
            pst.setInt(3, Integer.parseInt(erPriorityBox.getSelectedItem().toString()));

            int rows = pst.executeUpdate();
            if (rows > 0) {
                showNotification("Emergency Request Submitted Successfully!");
                erTypeField.setText("");
            }
        } catch (NumberFormatException nfe) {
            showNotification("Error: Priority Level must be a valid number.", "Input Error", JOptionPane.ERROR_MESSAGE);
        } catch (SQLException sqle) {
            showNotification("Database Error: " + sqle.getMessage(), "SQL Error", JOptionPane.ERROR_MESSAGE);
            sqle.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
            showNotification("An unexpected error occurred: " + ex.getMessage());
        }
    }

    private void cancelEmergencyRequest(ActionEvent e) {
        String query = "DELETE FROM Emergency_Request WHERE Patient_ID = ? AND Req_Status = 'Pending'";
        try (Connection con = DBConnection.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
            pst.setInt(1, this.userId);
            int rowsDeleted = pst.executeUpdate();
            if (rowsDeleted > 0) {
                JOptionPane.showMessageDialog(this, "Successfully canceled " + rowsDeleted + " pending emergency request(s).");
            } else {
                JOptionPane.showMessageDialog(this, "You have no pending emergency requests to cancel.");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(this, "Error canceling requests: " + ex.getMessage());
        }
    }
}
