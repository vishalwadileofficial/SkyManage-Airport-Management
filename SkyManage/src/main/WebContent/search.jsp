<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <% if(session.getAttribute("username")==null) { response.sendRedirect("index.jsp"); return; } %>
    <!DOCTYPE html>
    <html>

    <head>
      <title>Search - SkyManage</title>
      <style>
        * {
          box-sizing: border-box;
          margin: 0;
          padding: 0;
          font-family: 'Segoe UI', sans-serif;
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
          max-width: 1000px;
          margin: 30px auto;
        }

        .search-container {
          background: white;
          padding: 30px;
          border-radius: 8px;
          box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .tabs {
          display: flex;
          border-bottom: 2px solid #eee;
          margin-bottom: 20px;
        }

        .tab {
          padding: 10px 20px;
          cursor: pointer;
          color: #666;
          font-weight: bold;
          border-bottom: 3px solid transparent;
        }

        .tab.active {
          color: var(--primary-red);
          border-bottom: 3px solid var(--primary-red);
        }

        .search-box {
          display: flex;
          gap: 10px;
          margin-bottom: 20px;
        }

        .search-input {
          flex: 1;
          padding: 12px;
          border: 1px solid #ddd;
          border-radius: 4px;
          font-size: 16px;
        }

        .btn-search {
          background: var(--primary-red);
          color: white;
          border: none;
          padding: 12px 24px;
          border-radius: 4px;
          cursor: pointer;
          font-weight: bold;
        }

        .btn-search:hover {
          opacity: 0.9;
        }

        .results-table {
          width: 100%;
          border-collapse: collapse;
          margin-top: 20px;
          display: none;
        }

        .results-table th {
          background: var(--dark-bg);
          color: white;
          padding: 12px;
          text-align: left;
        }

        .results-table td {
          padding: 12px;
          border-bottom: 1px solid #ddd;
        }

        .results-table tr:hover {
          background-color: #f9f9f9;
        }

        .no-results {
          text-align: center;
          color: #666;
          margin-top: 20px;
          display: none;
        }
      </style>
      <script>
        function switchTab(tabName) {
          document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
          document.getElementById('tab-' + tabName).classList.add('active');

          document.getElementById('flight-search').style.display = tabName === 'flight' ? 'block' : 'none';
          document.getElementById('passenger-search').style.display = tabName === 'passenger' ? 'block' : 'none';

          // Clear results
          document.querySelector('#flight-results tbody').innerHTML = '';
          document.querySelector('#passenger-results tbody').innerHTML = '';
          document.getElementById('flight-table').style.display = 'none';
          document.getElementById('passenger-table').style.display = 'none';
        }

        function searchFlights() {
          let query = document.getElementById('flight-query').value.toLowerCase();
          let results = [
            { id: 101, flightNo: 'AI-202', airline: 'Air India', route: 'DEL -> BOM', price: 4500 },
            { id: 102, flightNo: '6E-453', airline: 'IndiGo', route: 'BOM -> GOI', price: 3200 },
            { id: 103, flightNo: 'SG-101', airline: 'SpiceJet', route: 'AMD -> DEL', price: 2800 },
            { id: 104, flightNo: 'UK-890', airline: 'Vistara', route: 'BLR -> DEL', price: 5600 }
          ];

          let tbody = document.querySelector('#flight-results tbody');
          tbody.innerHTML = '';
          let found = false;

          results.forEach(f => {
            if (f.flightNo.toLowerCase().includes(query) || f.airline.toLowerCase().includes(query) || f.route.toLowerCase().includes(query)) {
              found = true;
              let row = `<tr>
                        <td>${f.id}</td>
                        <td><b>${f.flightNo}</b></td>
                        <td>${f.airline}</td>
                        <td>${f.route}</td>
                        <td>₹ ${f.price}</td>
                        <td><a href="payment.jsp?price=${f.price}" style="color: var(--primary-red); font-weight: bold; text-decoration: none;">Book</a></td>
                    </tr>`;
              tbody.innerHTML += row;
            }
          });

          document.getElementById('flight-table').style.display = found ? 'table' : 'none';
          document.getElementById('flight-no-results').style.display = found ? 'none' : 'block';
        }

        function searchPassengers() {
          let query = document.getElementById('passenger-query').value.toLowerCase();
          let results = [
            { id: 1, name: 'Rahul Sharma', email: 'rahul@example.com', phone: '9876543210', passport: 'A1234567' },
            { id: 2, name: 'Priya Verma', email: 'priya@example.com', phone: '8765432109', passport: 'B7654321' },
            { id: 3, name: 'Amit Singh', email: 'amit@example.com', phone: '7654321098', passport: 'C9876543' }
          ];

          let tbody = document.querySelector('#passenger-results tbody');
          tbody.innerHTML = '';
          let found = false;

          results.forEach(p => {
            if (p.name.toLowerCase().includes(query) || p.email.toLowerCase().includes(query) || p.passport.toLowerCase().includes(query)) {
              found = true;
              let row = `<tr>
                        <td>${p.id}</td>
                        <td><b>${p.name}</b></td>
                        <td>${p.email}</td>
                        <td>${p.phone}</td>
                        <td>${p.passport}</td>
                    </tr>`;
              tbody.innerHTML += row;
            }
          });

          document.getElementById('passenger-table').style.display = found ? 'table' : 'none';
          document.getElementById('passenger-no-results').style.display = found ? 'none' : 'block';
        }
      </script>
    </head>

    <body>

      <nav class="navbar">
        <a href="dashboard.jsp" class="logo">✈ SkyManage</a>
        <div class="nav-links">
          <a href="dashboard.jsp">Home</a>
          <a href="passengers">Passengers</a>
          <a href="flights?action=list">Flights</a>
          <a href="search.jsp" style="color: var(--primary-gold);">🔍 Search</a>
          <a href="logout">Logout</a>
        </div>
      </nav>

      <div class="container">
        <h2>Search Database</h2>
        <div class="search-container">

          <div class="tabs">
            <div id="tab-flight" class="tab active" onclick="switchTab('flight')">Flight Search</div>
            <div id="tab-passenger" class="tab" onclick="switchTab('passenger')">Passenger Search</div>
          </div>

          <!-- FLIGHT SEARCH -->
          <div id="flight-search">
            <div class="search-box">
              <input type="text" id="flight-query" class="search-input"
                placeholder="Search by Flight No, Airline, or Route..." onkeyup="searchFlights()">
              <button class="btn-search" onclick="searchFlights()">Search</button>
            </div>

            <table id="flight-table" class="results-table" id="flight-results">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Flight No</th>
                  <th>Airline</th>
                  <th>Route</th>
                  <th>Price</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody></tbody>
            </table>
            <p id="flight-no-results" class="no-results">No flights found matching your query.</p>
          </div>

          <!-- PASSENGER SEARCH -->
          <div id="passenger-search" style="display: none;">
            <div class="search-box">
              <input type="text" id="passenger-query" class="search-input"
                placeholder="Search by Name, Email, or Passport..." onkeyup="searchPassengers()">
              <button class="btn-search" onclick="searchPassengers()">Search</button>
            </div>

            <table id="passenger-table" class="results-table" id="passenger-results">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Full Name</th>
                  <th>Email</th>
                  <th>Phone</th>
                  <th>Passport No</th>
                </tr>
              </thead>
              <tbody></tbody>
            </table>
            <p id="passenger-no-results" class="no-results">No passengers found matching your query.</p>
          </div>

        </div>
      </div>

    </body>

    </html>