package com.skymanage.model;

public class Passenger {
    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String passport;

    public Passenger(int id, String firstName, String lastName, String email, String phone, String passport) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.passport = passport;
    }

    // Getters
    public int getId() { return id; }
    public String getFirstName() { return firstName; }
    public String getLastName() { return lastName; }
    public String getEmail() { return email; }
    public String getPhone() { return phone; }
    public String getPassport() { return passport; }
}