package com.skymanage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.skymanage.config.DBConnection;

public class UserDAO {

    // EXISTING LOGIN METHOD
    public boolean validate(String username, String password) {
        boolean status = false;
        String sql = "SELECT * FROM users WHERE username=? AND password=?";

        // Using try-with-resources to auto-close connections
        try (Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                status = rs.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // 🆕 NEW METHOD: REGISTER USER
    public boolean registerUser(String username, String password) {
        boolean status = false;
        String sql = "INSERT INTO users (username, password) VALUES (?, ?)";

        // Using try-with-resources to auto-close connections
        try (Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);

            int rows = ps.executeUpdate();
            if (rows > 0)
                status = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}