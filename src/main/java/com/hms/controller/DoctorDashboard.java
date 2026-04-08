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
import java.sql.Date;
import java.time.LocalDate;

public class DoctorDashboard extends BaseDashboard {
    
    // Tab 1: My Patients
    private JTable patientRecordsTable;

    // Tab 2: Add Medical Record
    private JTextField mrPatientIdField, mrAdmissionDateField;
    private JTextArea mrDiagnosisArea, mrTreatmentArea;

    // Tab 3: Prescribe Medicine
    private JTable medStockTable;
    private JTextField rxPatientIdField, rxMedicineIdField, rxQuantityField;

    public DoctorDashboard(int doctorId) {
        super(doctorId);

        setTitle("Doctor Ecosystem Ecosystem Dashboard");
        setSize(800, 600);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLayout(new BorderLayout());

        JLabel titleLabel = new JLabel("Doctor Dashboard", SwingConstants.CENTER);
        titleLabel.setFont(new Font("Arial", Font.BOLD, 24));
        add(titleLabel, BorderLayout.NORTH);

        JTabbedPane tabbedPane = new JTabbedPane();

        // --- 1. My Patients Tab ---
        JPanel recordsPanel = new JPanel(new BorderLayout());
        patientRecordsTable = new JTable();
        loadPatientRecords();
        JScrollPane recordsScrollPane = new JScrollPane(patientRecordsTable);
        recordsPanel.add(recordsScrollPane, BorderLayout.CENTER);
        tabbedPane.addTab("My Patients", recordsPanel);

        // --- 2. Add Medical Record Tab ---
        JPanel addRecordPanelOuter = new JPanel(new BorderLayout());
        JPanel addRecordPanel = new JPanel(new GridLayout(5, 2, 10, 10));
        addRecordPanel.setBorder(BorderFactory.createEmptyBorder(20, 50, 20, 50));

        addRecordPanel.add(new JLabel("Patient ID:"));
        mrPatientIdField = new JTextField();
        addRecordPanel.add(mrPatientIdField);

        addRecordPanel.add(new JLabel("Admission Date (YYYY-MM-DD):"));
        mrAdmissionDateField = new JTextField();
        addRecordPanel.add(mrAdmissionDateField);

        addRecordPanel.add(new JLabel("Diagnosis:"));
        mrDiagnosisArea = new JTextArea();
        mrDiagnosisArea.setLineWrap(true);
        mrDiagnosisArea.setBorder(BorderFactory.createLineBorder(Color.GRAY));
        addRecordPanel.add(new JScrollPane(mrDiagnosisArea));

        addRecordPanel.add(new JLabel("Treatment Profile:"));
        mrTreatmentArea = new JTextArea();
        mrTreatmentArea.setLineWrap(true);
        mrTreatmentArea.setBorder(BorderFactory.createLineBorder(Color.GRAY));
        addRecordPanel.add(new JScrollPane(mrTreatmentArea));

        JButton submitRecordBtn = new JButton("Submit Medical Record");
        submitRecordBtn.addActionListener(this::submitMedicalRecord);
        addRecordPanel.add(new JLabel("")); // Spacer
        addRecordPanel.add(submitRecordBtn);

        addRecordPanelOuter.add(addRecordPanel, BorderLayout.CENTER);
        tabbedPane.addTab("Add Medical Record", addRecordPanelOuter);

        // --- 3. Prescribe Medicine Tab ---
        tabbedPane.addTab("Prescribe Medicine", createPrescriptionPanel());

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

    private JPanel createPrescriptionPanel() {
        JPanel rxPanel = new JPanel(new BorderLayout());
        
        medStockTable = new JTable();
        loadMedicineStock();
        rxPanel.add(new JScrollPane(medStockTable), BorderLayout.CENTER);

        JPanel actionPanel = new JPanel(new FlowLayout());
        actionPanel.add(new JLabel("Patient ID:"));
        rxPatientIdField = new JTextField(5);
        actionPanel.add(rxPatientIdField);

        actionPanel.add(new JLabel("Medicine ID:"));
        rxMedicineIdField = new JTextField(5);
        actionPanel.add(rxMedicineIdField);

        actionPanel.add(new JLabel("Quantity:"));
        rxQuantityField = new JTextField(5);
        actionPanel.add(rxQuantityField);

        JButton prescribeBtn = new JButton("Prescribe & Bill Patient");
        prescribeBtn.addActionListener(this::submitPrescription);
        actionPanel.add(prescribeBtn);

        rxPanel.add(actionPanel, BorderLayout.SOUTH);
        return rxPanel;
    }

    private void loadPatientRecords() {
        DefaultTableModel model = new DefaultTableModel();
        model.addColumn("Patient ID");
        model.addColumn("Patient Name");
        model.addColumn("Treatment Date");
        model.addColumn("Diagnosis");

        try (Connection con = DBConnection.getConnection()) {
            String query = "SELECT P.Patient_ID, P.Patient_Name, T.Treatment_Date, M.Diagnosis " +
                           "FROM Treatment T " +
                           "JOIN Patient P ON T.Patient_ID = P.Patient_ID " +
                           "JOIN Medical_Record M ON T.Record_ID = M.Record_ID " +
                           "WHERE T.Doctor_ID = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, this.userId);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                model.addRow(new Object[]{
                        rs.getInt("Patient_ID"),
                        rs.getString("Patient_Name"),
                        rs.getDate("Treatment_Date"),
                        rs.getString("Diagnosis")
                });
            }
            patientRecordsTable.setModel(model);
        } catch (Exception ex) {}
    }

    private void loadMedicineStock() {
        DefaultTableModel model = new DefaultTableModel();
        model.addColumn("Medicine ID");
        model.addColumn("Name");
        model.addColumn("Unit Price");
        model.addColumn("Stock Available");

        try (Connection con = DBConnection.getConnection()) {
            ResultSet rs = con.prepareStatement("SELECT m.Medicine_ID, m.Medicine_Name, m.Unit_Price, s.Quantity FROM Medicine m JOIN Medicine_Stock s ON m.Medicine_ID = s.Medicine_ID").executeQuery();
            while (rs.next()) {
                model.addRow(new Object[]{rs.getInt("Medicine_ID"), rs.getString("Medicine_Name"), rs.getBigDecimal("Unit_Price"), rs.getInt("Quantity")});
            }
            medStockTable.setModel(model);
        } catch (Exception ex) {}
    }

    private void submitMedicalRecord(ActionEvent e) {
        String patientIdText = mrPatientIdField.getText();
        String diagnosis = mrDiagnosisArea.getText();
        String treatment = mrTreatmentArea.getText();
        String dateStr = mrAdmissionDateField.getText();

        if (patientIdText.isEmpty() || diagnosis.isEmpty()) return;

        try (Connection con = DBConnection.getConnection()) {
            con.setAutoCommit(false); 
            int patientId = Integer.parseInt(patientIdText);
            Date admissionDate = dateStr.isEmpty() ? Date.valueOf(LocalDate.now()) : Date.valueOf(dateStr);

            String query1 = "INSERT INTO Medical_Record (Patient_ID, Hospital_ID, Diagnosis, Treatment, Admission_Date) VALUES (?, 1, ?, ?, ?)";
            PreparedStatement pst1 = con.prepareStatement(query1, Statement.RETURN_GENERATED_KEYS);
            pst1.setInt(1, patientId);
            pst1.setString(2, diagnosis);
            pst1.setString(3, treatment);
            pst1.setDate(4, admissionDate);
            pst1.executeUpdate();
            
            ResultSet rsKeys = pst1.getGeneratedKeys();
            int recordId = rsKeys.next() ? rsKeys.getInt(1) : -1;

            String query2 = "INSERT INTO Treatment (Doctor_ID, Patient_ID, Record_ID, Treatment_Date) VALUES (?, ?, ?, ?)";
            PreparedStatement pst2 = con.prepareStatement(query2);
            pst2.setInt(1, this.userId);
            pst2.setInt(2, patientId);
            pst2.setInt(3, recordId);
            pst2.setDate(4, Date.valueOf(LocalDate.now())); 
            
            pst2.executeUpdate();
            con.commit();
            
            JOptionPane.showMessageDialog(this, "Medical Record successfully submitted!");
            loadPatientRecords();
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, "Error: " + ex.getMessage());
        }
    }

    private void submitPrescription(ActionEvent e) {
        try (Connection con = DBConnection.getConnection()) {
            con.setAutoCommit(false);
            
            int pId = Integer.parseInt(rxPatientIdField.getText());
            int mId = Integer.parseInt(rxMedicineIdField.getText());
            int qty = Integer.parseInt(rxQuantityField.getText());

            // 1. Get corresponding Treatment_ID 
            PreparedStatement getTid = con.prepareStatement("SELECT Treatment_ID FROM Treatment WHERE Patient_ID = ? AND Doctor_ID = ? ORDER BY Treatment_Date DESC LIMIT 1");
            getTid.setInt(1, pId);
            getTid.setInt(2, this.userId);
            ResultSet rsTid = getTid.executeQuery();
            
            if(!rsTid.next()) {
                throw new Exception("You have no registered treatments with this patient. Add a Medical Record first!");
            }
            int tId = rsTid.getInt("Treatment_ID");

            // 2. Fetch Medicine Price
            PreparedStatement getPrice = con.prepareStatement("SELECT Unit_Price FROM Medicine WHERE Medicine_ID = ?");
            getPrice.setInt(1, mId);
            ResultSet rsPrice = getPrice.executeQuery();
            if(!rsPrice.next()) throw new Exception("Medicine ID not found!");
            
            double totalCost = rsPrice.getDouble("Unit_Price") * qty;

            // 3. Decrement Inventory
            PreparedStatement decr = con.prepareStatement("UPDATE Medicine_Stock SET Quantity = Quantity - ? WHERE Medicine_ID = ? AND Quantity >= ?");
            decr.setInt(1, qty);
            decr.setInt(2, mId);
            decr.setInt(3, qty);
            if(decr.executeUpdate() == 0) throw new Exception("Insufficient stock!");

            // 4. Insert Prescription
            PreparedStatement insRx = con.prepareStatement("INSERT INTO Prescription (Treatment_ID, Medicine_ID, Quantity) VALUES (?, ?, ?)");
            insRx.setInt(1, tId);
            insRx.setInt(2, mId);
            insRx.setInt(3, qty);
            insRx.executeUpdate();

            // 5. Bill Patient
            PreparedStatement bill = con.prepareStatement("INSERT INTO Billing (Patient_ID, Hospital_ID, Amount, Status) VALUES (?, 1, ?, 'Pending')");
            bill.setInt(1, pId);
            bill.setDouble(2, totalCost);
            bill.executeUpdate();

            con.commit();
            JOptionPane.showMessageDialog(this, "Prescription Processed & Automatically Billed strictly for $" + totalCost);
            loadMedicineStock();

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, "Prescription Error: " + ex.getMessage());
        }
    }
}
