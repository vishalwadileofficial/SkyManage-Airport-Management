<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% if(session.getAttribute("username")==null) { response.sendRedirect("index.jsp"); return; } %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - SkyManage</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', sans-serif; }
        body { background-color: #f4f4f4; color: #333; }
        :root { --primary-red: #D71920; --primary-gold: #cfaa60; --dark-bg: #333333; }
        .navbar { background-color: var(--primary-red); padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); }
        .navbar .logo { color: white; font-size: 24px; font-weight: bold; text-decoration: none; }
        .navbar .nav-links a { color: white; text-decoration: none; margin-left: 20px; font-size: 16px; transition: 0.3s; }
        .navbar .nav-links a:hover { color: var(--primary-gold); }
        .container { width: 90%; max-width: 1200px; margin: 30px auto; }
        .card { background: white; padding: 25px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); margin-bottom: 20px; }
        .dashboard-grid { display: flex; gap: 20px; }
        .stat-card { flex: 1; background: white; padding: 20px; border-left: 5px solid var(--primary-gold); box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); }
        .stat-card h3 { color: var(--primary-red); font-size: 32px; margin-bottom: 5px; }
        .btn { padding: 12px 24px; border: none; border-radius: 4px; cursor: pointer; text-decoration: none; font-weight: bold; display: inline-block; margin-right: 15px; }
        .btn-primary { background-color: var(--primary-red); color: white; }
        .btn-gold { background-color: var(--primary-gold); color: var(--dark-bg); }
    </style>
</head>
<body>
    <nav class="navbar">
        <a href="dashboard.jsp" class="logo"> SkyManage</a>
        <div class="nav-links">
            <a href="dashboard.jsp" style="color: var(--primary-gold);">Home</a>
            <a href="passengers">Passengers</a>
            <a href="flights?action=list">Flights</a>
            <a href="search.jsp"> Search</a>
            <a href="logout">Logout</a>
        </div>
    </nav>
    <div class="container">
        <h1>Welcome, <%= session.getAttribute("username") %></h1>
        <p style="color: #666; margin-top: 5px;">Admin Dashboard</p>
        <br>
        <div class="dashboard-grid">
            <div class="stat-card"><h3>4</h3><p>TOTAL FLIGHTS</p></div>
            <div class="stat-card"><h3>3</h3><p>ACTIVE PASSENGERS</p></div>
            <div class="stat-card"><h3>1</h3><p>RECENT BOOKINGS</p></div>
        </div>
        <br><br>
        <div class="card">
            <h2 style="margin-bottom: 20px; color: var(--dark-bg);">Quick Actions</h2>
            <a href="flights?action=new" class="btn btn-primary">+ Add New Flight</a>
            <a href="flights?action=list" class="btn btn-gold">View Flight Schedule</a>
        </div>
    </div>
</body>
</html>
