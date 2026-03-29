<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <% if(session.getAttribute("username")==null) { response.sendRedirect("index.jsp"); return; } %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Add Flight - SkyManage</title>
            <style>
                /* --- PASTE CSS HERE (Shared Style) --- */
                * {
                    box-sizing: border-box;
                    margin: 0;
                    padding: 0;
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                }

                body {
                    background-color: #f4f4f4;
                    color: #333;
                }

                /* COLORS */
                :root {
                    --primary-red: #D71920;
                    --primary-gold: #cfaa60;
                    --dark-bg: #333333;
                }

                /* NAVBAR */
                .navbar {
                    background-color: var(--primary-red);
                    padding: 15px 30px;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
                }

                .navbar .logo {
                    color: white;
                    font-size: 24px;
                    font-weight: bold;
                    text-decoration: none;
                }

                /* FORM CONTAINER */
                .container {
                    width: 100%;
                    height: 90vh;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }

                .card {
                    background: white;
                    padding: 30px;
                    border-radius: 8px;
                    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
                    width: 500px;
                }

                h2 {
                    color: var(--primary-red);
                    text-align: center;
                    margin-bottom: 20px;
                }

                /* FORM ELEMENTS */
                .form-group {
                    margin-bottom: 15px;
                }

                .form-group label {
                    display: block;
                    margin-bottom: 5px;
                    color: #666;
                    font-weight: 500;
                }

                .form-control {
                    width: 100%;
                    padding: 10px;
                    border: 1px solid #ccc;
                    border-radius: 4px;
                    font-size: 16px;
                }

                /* BUTTONS */
                .btn {
                    padding: 12px;
                    border: none;
                    border-radius: 4px;
                    cursor: pointer;
                    text-decoration: none;
                    font-weight: bold;
                    display: inline-block;
                    width: 100%;
                    text-align: center;
                    margin-top: 10px;
                }

                .btn-primary {
                    background-color: var(--primary-red);
                    color: white;
                }

                .btn-gold {
                    background-color: var(--primary-gold);
                    color: var(--dark-bg);
                    margin-top: 10px;
                }

                .btn:hover {
                    opacity: 0.9;
                }
            </style>
        </head>

        <body>

            <nav class="navbar">
                <a href="dashboard.jsp" class="logo">✈ SkyManage</a>
                <a href="passengers">Passengers</a>
            </nav>

            <div class="container">
                <div class="card">
                    <h2>Add New Flight</h2>
                    <form action="flights" method="post">
                        <div class="form-group">
                            <label>Flight Number</label>
                            <input type="text" name="flightNumber" class="form-control" placeholder="e.g. 6E-555"
                                required>
                        </div>
                        <div class="form-group">
                            <label>Airline Name</label>
                            <input type="text" name="airlineName" class="form-control" placeholder="e.g. IndiGo"
                                required>
                        </div>
                        <div class="form-group">
                            <label>Source City</label>
                            <input type="text" name="source" class="form-control" placeholder="e.g. Pune" required>
                        </div>
                        <div class="form-group">
                            <label>Destination City</label>
                            <input type="text" name="destination" class="form-control" placeholder="e.g. Delhi"
                                required>
                        </div>
                        <div class="form-group">
                            <label>Ticket Price (₹)</label>
                            <input type="number" step="0.01" name="price" class="form-control"
                                placeholder="e.g. 4500.00" required>
                        </div>

                        <button type="submit" class="btn btn-primary">Save Flight</button>
                        <a href="flights?action=list" class="btn btn-gold">Cancel</a>
                    </form>
                </div>
            </div>

        </body>

        </html>