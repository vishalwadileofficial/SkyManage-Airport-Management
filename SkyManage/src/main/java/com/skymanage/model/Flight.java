package com.skymanage.model;

public class Flight {
    private int id;
    private String flightNumber;
    private String airlineName;
    private String source;
    private String destination;
    private double price;

    // Constructor (Empty)
    public Flight() {}

    // Constructor (With Fields)
    public Flight(int id, String flightNumber, String airlineName, String source, String destination, double price) {
        this.id = id;
        this.flightNumber = flightNumber;
        this.airlineName = airlineName;
        this.source = source;
        this.destination = destination;
        this.price = price;
    }

    // Getters and Setters (Right-click in IDE -> Source -> Generate Getters/Setters)
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getFlightNumber() { return flightNumber; }
    public void setFlightNumber(String flightNumber) { this.flightNumber = flightNumber; }

    public String getAirlineName() { return airlineName; }
    public void setAirlineName(String airlineName) { this.airlineName = airlineName; }

    public String getSource() { return source; }
    public void setSource(String source) { this.source = source; }

    public String getDestination() { return destination; }
    public void setDestination(String destination) { this.destination = destination; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
}