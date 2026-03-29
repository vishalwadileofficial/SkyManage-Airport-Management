-- 1. Create the Database
CREATE DATABASE IF NOT EXISTS skymanage;
USE skymanage;

-- 2. Create Users Table (For Admin Login)
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL
);

-- 3. Create Flights Table
CREATE TABLE flights (
    id INT AUTO_INCREMENT PRIMARY KEY,
    flight_number VARCHAR(20) NOT NULL,
    airline_name VARCHAR(50) NOT NULL,
    source_city VARCHAR(50) NOT NULL,
    destination_city VARCHAR(50) NOT NULL,
    departure_time DATETIME NOT NULL,
    ticket_price DECIMAL(10, 2) NOT NULL,
    available_seats INT DEFAULT 60
);

-- 4. Create Passengers Table
CREATE TABLE passengers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    passport_number VARCHAR(20) NOT NULL UNIQUE
);

-- 5. Create Bookings Table
CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    flight_id INT,
    passenger_id INT,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (flight_id) REFERENCES flights(id) ON DELETE CASCADE,
    FOREIGN KEY (passenger_id) REFERENCES passengers(id) ON DELETE CASCADE
);

-- ==========================================
-- 6. INSERT DUMMY DATA (Indian Context)
-- ==========================================

-- Admin User
INSERT INTO users (username, password) VALUES ('admin', 'admin123');

-- Sample Flights (Domestic & International from India)
INSERT INTO flights (flight_number, airline_name, source_city, destination_city, departure_time, ticket_price) VALUES 
('6E-501', 'IndiGo', 'New Delhi', 'Mumbai', '2025-10-01 08:00:00', 4500.00),
('AI-202', 'Air India', 'Bangalore', 'Delhi', '2025-10-02 14:30:00', 5200.50),
('UK-890', 'Vistara', 'Mumbai', 'Goa', '2025-10-03 09:15:00', 3800.00),
('EK-500', 'Emirates', 'Mumbai', 'Dubai', '2025-11-15 04:00:00', 25000.00);

-- Sample Passengers
INSERT INTO passengers (first_name, last_name, email, phone, passport_number) VALUES
('Rahul', 'Sharma', 'rahul.s@example.com', '9876543210', 'Z1234567'),
('Priya', 'Verma', 'priya.v@example.com', '9988776655', 'X7654321'),
('Amit', 'Patel', 'amit.p@example.com', '9123456789', 'Y5544332');

-- Sample Booking (Rahul Sharma booked IndiGo 6E-501)
INSERT INTO bookings (flight_id, passenger_id) VALUES (1, 1);