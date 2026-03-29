package com.skymanage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.skymanage.config.DBConnection;
import com.skymanage.model.Passenger;

public class PassengerDAO {

    public List<Passenger> selectAllPassengers() {
        List<Passenger> passengers = new ArrayList<>();
        String sql = "SELECT * FROM passengers";

        // Using try-with-resources to auto-close connections
        try (Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                passengers.add(new Passenger(
                        rs.getInt("id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("passport_number")));
            }
        } catch (SQLException e) {
            System.out.println("ERROR in PassengerDAO.selectAllPassengers(): " + e.getMessage());
            e.printStackTrace();
        }
        return passengers;
    }
}