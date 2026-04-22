package main.java.com.hms.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConnection() {
        try {
            // Explicitly load the driver just in case the classpath requires it
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Changed localhost to 127.0.0.1 to avoid IPv6 resolution issues with Docker
            String url = "jdbc:mysql://127.0.0.1:3307/hospital_management";
            String user = "root";
            String password = "root";

            return DriverManager.getConnection(url, user, password);

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
            javax.swing.JOptionPane.showMessageDialog(null, "MySQL Driver missing: " + cnfe.getMessage());
            return null;
        } catch (java.sql.SQLException sqle) {
            sqle.printStackTrace();
            javax.swing.JOptionPane.showMessageDialog(null, "Database Connection refused: " + sqle.getMessage());
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            javax.swing.JOptionPane.showMessageDialog(null, "DB Error: " + e.getMessage());
            return null;
        }
    }
}
