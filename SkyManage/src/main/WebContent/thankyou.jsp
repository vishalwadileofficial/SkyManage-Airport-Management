<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <% if(session.getAttribute("username")==null) { response.sendRedirect("index.jsp"); return; } String
    paidAmount=request.getParameter("price"); if(paidAmount==null) paidAmount="4500.00" ; %>
    <!DOCTYPE html>
    <html>

    <head>
      <title>Payment Successful - SkyManage</title>
      <style>
        * {
          box-sizing: border-box;
          margin: 0;
          padding: 0;
          font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
          background: linear-gradient(135deg, #f4f4f4 0%, #e8e8e8 100%);
          min-height: 100vh;
          display: flex;
          flex-direction: column;
        }

        :root {
          --primary-red: #D71920;
          --primary-gold: #cfaa60;
          --dark-bg: #333333;
          --success-green: #28a745;
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

        .main-content {
          flex: 1;
          display: flex;
          justify-content: center;
          align-items: center;
          padding: 40px 20px;
        }

        .success-card {
          background: white;
          padding: 50px;
          border-radius: 12px;
          box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
          text-align: center;
          max-width: 500px;
          width: 100%;
          animation: slideUp 0.6s ease-out;
        }

        @keyframes slideUp {
          from {
            opacity: 0;
            transform: translateY(30px);
          }

          to {
            opacity: 1;
            transform: translateY(0);
          }
        }

        .checkmark-circle {
          width: 100px;
          height: 100px;
          background: linear-gradient(135deg, var(--success-green), #20c997);
          border-radius: 50%;
          display: flex;
          justify-content: center;
          align-items: center;
          margin: 0 auto 25px;
          animation: scaleIn 0.5s ease-out 0.3s both;
        }

        @keyframes scaleIn {
          from {
            transform: scale(0);
          }

          to {
            transform: scale(1);
          }
        }

        .checkmark {
          font-size: 50px;
          color: white;
          animation: fadeIn 0.4s ease-out 0.6s both;
        }

        @keyframes fadeIn {
          from {
            opacity: 0;
          }

          to {
            opacity: 1;
          }
        }

        .success-title {
          color: var(--success-green);
          font-size: 28px;
          font-weight: bold;
          margin-bottom: 10px;
        }

        .success-message {
          color: #666;
          font-size: 16px;
          margin-bottom: 30px;
        }

        .booking-details {
          background: #f9f9f9;
          padding: 20px;
          border-radius: 8px;
          margin-bottom: 30px;
          border-left: 4px solid var(--primary-gold);
        }

        .booking-details h4 {
          color: var(--dark-bg);
          margin-bottom: 15px;
          font-size: 18px;
        }

        .detail-row {
          display: flex;
          justify-content: space-between;
          padding: 8px 0;
          border-bottom: 1px dashed #ddd;
        }

        .detail-row:last-child {
          border-bottom: none;
          padding-top: 15px;
          font-weight: bold;
          font-size: 18px;
        }

        .detail-label {
          color: #666;
        }

        .detail-value {
          color: var(--dark-bg);
          font-weight: 500;
        }

        .amount-paid {
          color: var(--success-green) !important;
        }

        .btn-group {
          display: flex;
          gap: 15px;
          justify-content: center;
          flex-wrap: wrap;
        }

        .btn {
          padding: 14px 28px;
          border: none;
          border-radius: 6px;
          font-size: 16px;
          font-weight: bold;
          cursor: pointer;
          text-decoration: none;
          transition: all 0.3s ease;
        }

        .btn-primary {
          background: var(--primary-red);
          color: white;
        }

        .btn-primary:hover {
          background: #b5161c;
          transform: translateY(-2px);
        }

        .btn-secondary {
          background: var(--primary-gold);
          color: var(--dark-bg);
        }

        .btn-secondary:hover {
          background: #bf9a50;
          transform: translateY(-2px);
        }

        .confirmation-number {
          background: var(--dark-bg);
          color: white;
          padding: 10px 20px;
          border-radius: 5px;
          display: inline-block;
          margin-top: 20px;
          font-family: monospace;
          font-size: 14px;
        }
      </style>
    </head>

    <body>

      <nav class="navbar">
        <a href="dashboard.jsp" class="logo">✈ SkyManage</a>
        <div class="nav-links">
          <a href="dashboard.jsp">Home</a>
          <a href="passengers">Passengers</a>
          <a href="flights?action=list">Flights</a>
          <a href="logout">Logout</a>
        </div>
      </nav>

      <div class="main-content">
        <div class="success-card">
          <div class="checkmark-circle">
            <span class="checkmark">✓</span>
          </div>

          <h1 class="success-title">Payment Successful!</h1>
          <p class="success-message">Thank you for booking with SkyManage. Your flight has been confirmed.</p>

          <div class="booking-details">
            <h4>📋 Booking Summary</h4>
            <div class="detail-row">
              <span class="detail-label">Booking Status</span>
              <span class="detail-value" style="color: var(--success-green);">✓ Confirmed</span>
            </div>
            <div class="detail-row">
              <span class="detail-label">Passengers</span>
              <span class="detail-value">1 Adult</span>
            </div>
            <div class="detail-row">
              <span class="detail-label">Payment Method</span>
              <span class="detail-value">Online Payment</span>
            </div>
            <div class="detail-row">
              <span class="detail-label">Amount Paid</span>
              <span class="detail-value amount-paid">₹ <%= paidAmount %></span>
            </div>
          </div>

          <div class="confirmation-number">
            Confirmation #: SKY<%= System.currentTimeMillis() % 100000 %>
          </div>

          <br><br>

          <div class="btn-group">
            <a href="dashboard.jsp" class="btn btn-primary">Go to Dashboard</a>
            <a href="flights?action=list" class="btn btn-secondary">View More Flights</a>
          </div>
        </div>
      </div>

    </body>

    </html>