<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List, com.skymanage.model.Flight" %>
        <% if(session.getAttribute("username")==null) { response.sendRedirect("index.jsp"); return; } %>
            <!DOCTYPE html>
            <html>

            <head>
                <title>Manage Flights - SkyManage</title>
                <link rel="stylesheet" href="style.css">
                <style>
                    /* Minimal CSS for table if style.css is missing */
                    body {
                        font-family: 'Segoe UI';
                        background: #f4f4f4;
                    }

                    .navbar {
                        background: #D71920;
                        padding: 15px;
                        display: flex;
                        justify-content: space-between;
                    }

                    .navbar a {
                        color: white;
                        text-decoration: none;
                        margin-left: 20px;
                    }

                    .container {
                        width: 90%;
                        margin: 30px auto;
                    }

                    .table {
                        width: 100%;
                        background: white;
                        border-collapse: collapse;
                        margin-top: 20px;
                    }

                    .table th {
                        background: #333;
                        color: white;
                        padding: 10px;
                        text-align: left;
                    }

                    .table td {
                        padding: 10px;
                        border-bottom: 1px solid #ddd;
                    }

                    .btn {
                        padding: 5px 10px;
                        color: white;
                        text-decoration: none;
                        border-radius: 4px;
                    }

                    .btn-primary {
                        background: #D71920;
                    }

                    .btn-danger {
                        background: #a00;
                    }

                    .btn-book {
                        background: #28a745;
                        margin-right: 5px;
                    }
                </style>
            </head>

            <body>

                <nav class="navbar">
                    <a href="dashboard.jsp" style="font-size: 24px; font-weight: bold;">✈ SkyManage</a>
                    <div>
                        <a href="dashboard.jsp">Home</a>
                        <a href="passengers">Passengers</a>
                        <a href="flights?action=list" style="color: #cfaa60;">Flights</a>
                        <a href="search.jsp">🔍 Search</a>
                        <a href="logout">Logout</a>
                    </div>
                </nav>

                <div class="container">
                    <div style="display: flex; justify-content: space-between; align-items: center;">
                        <h2 style="color: #D71920;">Flight Schedule</h2>
                        <a href="flights?action=new" class="btn btn-primary">+ Add New Flight</a>
                    </div>

                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Flight No</th>
                                <th>Airline</th>
                                <th>Route</th>
                                <th>Price</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% List<Flight> list = (List<Flight>) request.getAttribute("listFlight");
                                    if(list != null) {
                                    for(Flight f : list) {
                                    %>
                                    <tr>
                                        <td>
                                            <%= f.getId() %>
                                        </td>
                                        <td><b>
                                                <%= f.getFlightNumber() %>
                                            </b></td>
                                        <td>
                                            <%= f.getAirlineName() %>
                                        </td>
                                        <td>
                                            <%= f.getSource() %> ➝ <%= f.getDestination() %>
                                        </td>
                                        <td>₹ <%= f.getPrice() %>
                                        </td>
                                        <td>
                                            <a href="payment.jsp?price=<%= f.getPrice() %>"
                                                class="btn btn-book">Book</a>
                                            <a href="flights?action=delete&id=<%= f.getId() %>"
                                                class="btn btn-danger">Delete</a>
                                        </td>
                                    </tr>
                                    <% } } else { %>
                                        <tr>
                                            <td colspan="6" style="text-align:center;">No flights found.</td>
                                        </tr>
                                        <% } %>
                        </tbody>
                    </table>
                </div>
            </body>

            </html>