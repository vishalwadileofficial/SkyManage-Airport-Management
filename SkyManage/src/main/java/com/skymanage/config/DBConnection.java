package com.skymanage.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    // Database URL (localhost means your own PC)
    private static final String URL = "jdbc:mysql://localhost:3306/skymanage";
    private static final String USER = "root"; // Default MySQL username
    private static final String PASS = "."; // Your MySQL password

    public static Connection getConnection() throws SQLException {
        Connection con = null;
        try {
            // Load the MySQL Driver (This bridge connects Java to MySQL)
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish the connection
            con = DriverManager.getConnection(URL, USER, PASS);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("ERROR: MySQL Driver not found! Check your libraries.");
            throw new SQLException("MySQL Driver not found", e);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("ERROR: Connection failed! Check database name/password.");
            throw e;
        }
        return con;
    }
}