<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List, com.skymanage.model.Passenger" %>
        <% if(session.getAttribute("username")==null) { response.sendRedirect("index.jsp"); return; } %>
            <!DOCTYPE html>
            <html>

            <head>
                <title>Passenger List - SkyManage</title>
                <style>
                    /* --- SAME CSS AS FLIGHT LIST --- */
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

                    :root {
                        --primary-red: #D71920;
                        --primary-gold: #cfaa60;
                        --dark-bg: #333333;
                    }

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

                    .navbar .nav-links a {
                        color: white;
                        text-decoration: none;
                        margin-left: 20px;
                        font-size: 16px;
                        transition: 0.3s;
                    }

                    .navbar .nav-links a:hover {
                        color: var(--primary-gold);
                    }

                    .container {
                        width: 90%;
                        max-width: 1200px;
                        margin: 30px auto;
                    }

                    .table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-top: 20px;
                        background: white;
                        border-radius: 8px;
                        overflow: hidden;
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    }

                    .table th {
                        background-color: var(--dark-bg);
                        color: white;
                        padding: 15px;
                        text-align: left;
                    }

                    .table td {
                        padding: 15px;
                        border-bottom: 1px solid #ddd;
                        color: #555;
                    }

                    .table tr:hover {
                        background-color: #f9f9f9;
                    }

                    h2 {
                        color: var(--primary-red);
                        margin-bottom: 20px;
                    }
                </style>
            </head>

            <body>

                <nav class="navbar">
                    <a href="dashboard.jsp" class="logo">✈ SkyManage</a>
                    <div class="nav-links">
                        <a href="dashboard.jsp">Home</a>
                        <a href="flights?action=list">Flights</a>
                        <a href="passengers" style="color: var(--primary-gold);">Passengers</a>
                        <a href="search.jsp">🔍 Search</a>
                        <a href="logout">Logout</a>
                    </div>
                </nav>

                <div class="container">
                    <h2>Passenger List</h2>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Full Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Passport No</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% List<Passenger> list = (List<Passenger>) request.getAttribute("listPassenger");
                                    if(list != null) {
                                    for(Passenger p : list) {
                                    %>
                                    <tr>
                                        <td>
                                            <%= p.getId() %>
                                        </td>
                                        <td><b>
                                                <%= p.getFirstName() %>
                                                    <%= p.getLastName() %>
                                            </b></td>
                                        <td>
                                            <%= p.getEmail() %>
                                        </td>
                                        <td>
                                            <%= p.getPhone() %>
                                        </td>
                                        <td><span style="background: #eee; padding: 2px 5px; border-radius: 3px;">
                                                <%= p.getPassport() %>
                                            </span></td>
                                    </tr>
                                    <% } } else { %>
                                        <tr>
                                            <td colspan="5">No passengers found.</td>
                                        </tr>
                                        <% } %>
                        </tbody>
                    </table>
                </div>

            </body>

            </html>