package main.java.com.hms.controller;

import main.java.com.hms.util.DBConnection;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class StaffDashboard extends BaseDashboard {

    // Reg Fields
    private JTextField nameField, dobField, phoneField, emailField, addressField, emgContactField;
    private JComboBox<String> genderBox, bgBox;

    // ER Fields
    private JTextField erPatientIdField, erTypeField;
    private JComboBox<String> erPriorityBox;

    // Dispatch Fields
    private JTable erTable, ambTable;
    private JTextField dispatchReqIdField, dispatchAmbIdField;

    // Blood Bank Fields
    private JTable bloodTable;
    private JComboBox<String> bloodTypeBox;
    private JTextField bloodUnitsField;

    public StaffDashboard(int staffId) {
        super(staffId);

        setTitle("Staff Dashboard");
        setSize(1000, 700);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLayout(new BorderLayout());

        JLabel titleLabel = new JLabel("Staff Ecosystem Dashboard", SwingConstants.CENTER);
        titleLabel.setFont(new Font("Arial", Font.BOLD, 24));
        add(titleLabel, BorderLayout.NORTH);

        JTabbedPane tabbedPane = new JTabbedPane();

        // 1. Patient Registration
        tabbedPane.addTab("Register Patient", createRegPanel());

        // 2. Emergency Request
        tabbedPane.addTab("Emergency Request", createErPanel());

        // 3. Dispatch Management
        tabbedPane.addTab("Manage Dispatch", createDispatchPanel());

        // 4. Blood Bank Management
        tabbedPane.addTab("Blood Bank", createBloodBankPanel());

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

    private JPanel createRegPanel() {
        JPanel regPanel = new JPanel(new GridLayout(9, 2, 10, 10));
        regPanel.setBorder(BorderFactory.createEmptyBorder(20, 50, 20, 50));

        regPanel.add(new JLabel("Full Name:"));
        nameField = new JTextField();
        regPanel.add(nameField);

        regPanel.add(new JLabel("Gender (M/F/O):"));
        genderBox = new JComboBox<>(new String[]{"M", "F", "O"});
        regPanel.add(genderBox);

        regPanel.add(new JLabel("DOB (YYYY-MM-DD):"));
        dobField = new JTextField();
        regPanel.add(dobField);

        regPanel.add(new JLabel("Blood Group:"));
        bgBox = new JComboBox<>(new String[]{"A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"});
        regPanel.add(bgBox);

        regPanel.add(new JLabel("Phone:"));
        phoneField = new JTextField();
        regPanel.add(phoneField);

        regPanel.add(new JLabel("Email:"));
        emailField = new JTextField();
        regPanel.add(emailField);

        regPanel.add(new JLabel("Address:"));
        addressField = new JTextField();
        regPanel.add(addressField);

        regPanel.add(new JLabel("Emergency Contact:"));
        emgContactField = new JTextField();
        regPanel.add(emgContactField);

        JButton registerBtn = new JButton("Register Patient");
        registerBtn.addActionListener(this::registerPatient);
        regPanel.add(new JLabel("")); 
        regPanel.add(registerBtn);
        
        return regPanel;
    }

    private JPanel createErPanel() {
        JPanel erPanelOuter = new JPanel(new BorderLayout());
        JPanel erPanel = new JPanel(new GridLayout(4, 2, 10, 10));
        erPanel.setBorder(BorderFactory.createEmptyBorder(50, 150, 200, 150));

        erPanel.add(new JLabel("Patient ID:"));
        erPatientIdField = new JTextField();
        erPanel.add(erPatientIdField);

        erPanel.add(new JLabel("Request Type (e.g., Accident):"));
        erTypeField = new JTextField();
        erPanel.add(erTypeField);

        erPanel.add(new JLabel("Priority Level (1-5):"));
        erPriorityBox = new JComboBox<>(new String[]{"1", "2", "3", "4", "5"});
        erPanel.add(erPriorityBox);

        JButton submitErBtn = new JButton("Submit Emergency Request");
        submitErBtn.addActionListener(this::submitEmergencyRequest);
        erPanel.add(new JLabel(""));
        erPanel.add(submitErBtn);

        erPanelOuter.add(erPanel, BorderLayout.CENTER);
        return erPanelOuter;
    }

    private JPanel createDispatchPanel() {
        JPanel mainPanel = new JPanel(new BorderLayout());
        
        // Tables Panel
        JPanel tablesPanel = new JPanel(new GridLayout(2, 1));
        
        erTable = new JTable();
        loadPendingRequests();
        JPanel erTablePanel = new JPanel(new BorderLayout());
        erTablePanel.add(new JLabel("Pending Emergency Requests"), BorderLayout.NORTH);
        erTablePanel.add(new JScrollPane(erTable), BorderLayout.CENTER);

        ambTable = new JTable();
        loadAvailableAmbulances();
        JPanel ambTablePanel = new JPanel(new BorderLayout());
        ambTablePanel.add(new JLabel("Available Ambulances"), BorderLayout.NORTH);
        ambTablePanel.add(new JScrollPane(ambTable), BorderLayout.CENTER);
        
        tablesPanel.add(erTablePanel);
        tablesPanel.add(ambTablePanel);
        
        // Actions Panel
        JPanel actionPanel = new JPanel(new FlowLayout());
        actionPanel.add(new JLabel("Request ID:"));
        dispatchReqIdField = new JTextField(5);
        actionPanel.add(dispatchReqIdField);
        
        actionPanel.add(new JLabel("Ambulance ID:"));
        dispatchAmbIdField = new JTextField(5);
        actionPanel.add(dispatchAmbIdField);
        
        JButton dispatchBtn = new JButton("Dispatch Selected");
        dispatchBtn.addActionListener(this::processDispatch);
        actionPanel.add(dispatchBtn);
        
        JButton refreshBtn = new JButton("Refresh Data");
        refreshBtn.addActionListener(e -> {
            loadPendingRequests();
            loadAvailableAmbulances();
        });
        actionPanel.add(refreshBtn);

        mainPanel.add(tablesPanel, BorderLayout.CENTER);
        mainPanel.add(actionPanel, BorderLayout.SOUTH);
        
        return mainPanel;
    }

    private JPanel createBloodBankPanel() {
        JPanel mainPanel = new JPanel(new BorderLayout());
        
        bloodTable = new JTable();
        loadBloodInventory();
        mainPanel.add(new JScrollPane(bloodTable), BorderLayout.CENTER);
        
        JPanel actionPanel = new JPanel(new FlowLayout());
        actionPanel.add(new JLabel("Blood Type:"));
        bloodTypeBox = new JComboBox<>(new String[]{"A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"});
        actionPanel.add(bloodTypeBox);
        
        actionPanel.add(new JLabel("Units to Add/Remove:"));
        bloodUnitsField = new JTextField(5);
        actionPanel.add(bloodUnitsField);
        
        JButton updateBtn = new JButton("Update Stock");
        updateBtn.addActionListener(this::updateBloodStock);
        actionPanel.add(updateBtn);
        
        mainPanel.add(actionPanel, BorderLayout.SOUTH);
        return mainPanel;
    }

    // --- Action Methods ---

    private void registerPatient(ActionEvent e) {
        String query = "INSERT INTO Patient (Patient_Name, Gender, DOB, Blood_Group, Phone, Email, Password, Address) VALUES (?, ?, ?, ?, ?, ?, 'password123', ?)";
        try (Connection con = DBConnection.getConnection(); PreparedStatement pst = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            pst.setString(1, nameField.getText());
            pst.setString(2, genderBox.getSelectedItem().toString());
            pst.setString(3, dobField.getText());
            pst.setString(4, bgBox.getSelectedItem().toString());
            pst.setString(5, phoneField.getText());
            pst.setString(6, emailField.getText());
            pst.setString(7, addressField.getText());

            int rows = pst.executeUpdate();
            if (rows > 0) {
                ResultSet rs = pst.getGeneratedKeys();
                if (rs.next()) {
                    int newPid = rs.getInt(1);
                    String contactStr = emgContactField.getText();
                    if (contactStr != null && !contactStr.isEmpty()) {
                        String contactQuery = "INSERT INTO Patient_Contact (Patient_ID, Contact_No) VALUES (?, ?)";
                        try (PreparedStatement pcPst = con.prepareStatement(contactQuery)) {
                            pcPst.setInt(1, newPid);
                            pcPst.setString(2, contactStr);
                            pcPst.executeUpdate();
                        }
                    }
                }
                JOptionPane.showMessageDialog(this, "Patient Registered Successfully!\nDefault Password is: password123");
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, "Error registering patient: " + ex.getMessage());
        }
    }

    private void submitEmergencyRequest(ActionEvent e) {
        String query = "INSERT INTO Emergency_Request (Patient_ID, Hospital_ID, Request_Type, Priority_Level, Req_Status) VALUES (?, 1, ?, ?, 'Pending')";
        try (Connection con = DBConnection.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
            pst.setInt(1, Integer.parseInt(erPatientIdField.getText()));
            pst.setString(2, erTypeField.getText());
            pst.setInt(3, Integer.parseInt(erPriorityBox.getSelectedItem().toString()));

            int rows = pst.executeUpdate();
            if (rows > 0) {
                JOptionPane.showMessageDialog(this, "Emergency Request Submitted Successfully!");
                loadPendingRequests();
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, "Error submitting request: " + ex.getMessage());
        }
    }

    private void loadPendingRequests() {
        DefaultTableModel model = new DefaultTableModel();
        model.addColumn("Request ID");
        model.addColumn("Patient ID");
        model.addColumn("Type");
        model.addColumn("Priority");
        
        try (Connection con = DBConnection.getConnection()) {
            ResultSet rs = con.prepareStatement("SELECT Request_ID, Patient_ID, Request_Type, Priority_Level FROM Emergency_Request WHERE Req_Status = 'Pending'").executeQuery();
            while (rs.next()) {
                model.addRow(new Object[]{rs.getInt("Request_ID"), rs.getInt("Patient_ID"), rs.getString("Request_Type"), rs.getInt("Priority_Level")});
            }
            erTable.setModel(model);
        } catch (Exception e) {}
    }

    private void loadAvailableAmbulances() {
        DefaultTableModel model = new DefaultTableModel();
        model.addColumn("Ambulance ID");
        model.addColumn("Vehicle Number");
        model.addColumn("Driver");
        
        try (Connection con = DBConnection.getConnection()) {
            ResultSet rs = con.prepareStatement("SELECT Ambulance_ID, Vehicle_Number, Driver_Name FROM Ambulance WHERE Status = 'Available'").executeQuery();
            while (rs.next()) {
                model.addRow(new Object[]{rs.getInt("Ambulance_ID"), rs.getString("Vehicle_Number"), rs.getString("Driver_Name")});
            }
            ambTable.setModel(model);
        } catch (Exception e) {}
    }

    private void processDispatch(ActionEvent e) {
        try (Connection con = DBConnection.getConnection()) {
            con.setAutoCommit(false);
            int reqId = Integer.parseInt(dispatchReqIdField.getText());
            int ambId = Integer.parseInt(dispatchAmbIdField.getText());
            
            // Insert Dispatch
            PreparedStatement pst1 = con.prepareStatement("INSERT INTO Dispatch (Request_ID, Dispatch_Status) VALUES (?, 'Dispatched')", Statement.RETURN_GENERATED_KEYS);
            pst1.setInt(1, reqId);
            pst1.executeUpdate();
            
            ResultSet rs = pst1.getGeneratedKeys();
            if (rs.next()) {
                int dispatchId = rs.getInt(1);
                PreparedStatement pstAmb = con.prepareStatement("INSERT INTO Dispatch_Ambulance (Dispatch_ID, Ambulance_ID) VALUES (?, ?)");
                pstAmb.setInt(1, dispatchId);
                pstAmb.setInt(2, ambId);
                pstAmb.executeUpdate();
            }
            
            // Update Req
            PreparedStatement pst2 = con.prepareStatement("UPDATE Emergency_Request SET Req_Status = 'Dispatched' WHERE Request_ID = ?");
            pst2.setInt(1, reqId);
            pst2.executeUpdate();
            
            // Update Amb
            PreparedStatement pst3 = con.prepareStatement("UPDATE Ambulance SET Status = 'In Use' WHERE Ambulance_ID = ?");
            pst3.setInt(1, ambId);
            pst3.executeUpdate();
            
            con.commit();
            JOptionPane.showMessageDialog(this, "Ambulance " + ambId + " successfully dispatched for Request " + reqId);
            loadPendingRequests();
            loadAvailableAmbulances();
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, "Dispatch Error: " + ex.getMessage());
        }
    }

    private void loadBloodInventory() {
        DefaultTableModel model = new DefaultTableModel();
        model.addColumn("Blood Type");
        model.addColumn("Units Available");
        model.addColumn("Expiry Date");
        
        try (Connection con = DBConnection.getConnection()) {
            ResultSet rs = con.prepareStatement("SELECT Blood_Type, Units_Available, Expiry_Date FROM BloodInventory").executeQuery();
            while (rs.next()) {
                model.addRow(new Object[]{rs.getString("Blood_Type"), rs.getInt("Units_Available"), rs.getDate("Expiry_Date")});
            }
            bloodTable.setModel(model);
        } catch (Exception e) {}
    }

    private void updateBloodStock(ActionEvent e) {
        try (Connection con = DBConnection.getConnection()) {
            String type = bloodTypeBox.getSelectedItem().toString();
            int units = Integer.parseInt(bloodUnitsField.getText());
            
            PreparedStatement pst = con.prepareStatement("UPDATE BloodInventory SET Units_Available = Units_Available + ? WHERE Blood_Type = ?");
            pst.setInt(1, units);
            pst.setString(2, type);
            
            int rows = pst.executeUpdate();
            if (rows > 0) {
                JOptionPane.showMessageDialog(this, "Inventory Successfully Updated");
                loadBloodInventory();
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, "Error: " + ex.getMessage());
        }
    }
}
