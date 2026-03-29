package com.skymanage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.skymanage.config.DBConnection;
import com.skymanage.model.Flight;

public class FlightDAO {

    // 1. ADD FLIGHT
    public void insertFlight(Flight flight) {
        String sql = "INSERT INTO flights (flight_number, airline_name, source_city, destination_city, departure_time, ticket_price) VALUES (?, ?, ?, ?, NOW(), ?)";

        // Using try-with-resources to auto-close connections
        try (Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, flight.getFlightNumber());
            ps.setString(2, flight.getAirlineName());
            ps.setString(3, flight.getSource());
            ps.setString(4, flight.getDestination());
            ps.setDouble(5, flight.getPrice());

            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("ERROR in FlightDAO.insertFlight(): " + e.getMessage());
            e.printStackTrace();
        }
    }

    // 2. VIEW ALL FLIGHTS
    public List<Flight> selectAllFlights() {
        List<Flight> flights = new ArrayList<>();
        String sql = "SELECT * FROM flights";

        // Using try-with-resources to auto-close connections
        try (Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String num = rs.getString("flight_number");
                String airline = rs.getString("airline_name");
                String src = rs.getString("source_city");
                String dest = rs.getString("destination_city");
                double price = rs.getDouble("ticket_price");

                flights.add(new Flight(id, num, airline, src, dest, price));
            }
        } catch (SQLException e) {
            System.out.println("ERROR in FlightDAO.selectAllFlights(): " + e.getMessage());
            e.printStackTrace();
        }
        return flights;
    }

    // 3. DELETE FLIGHT
    public boolean deleteFlight(int id) {
        boolean rowDeleted = false;
        String sql = "DELETE FROM flights WHERE id = ?";

        // Using try-with-resources to auto-close connections
        try (Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            rowDeleted = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }
}