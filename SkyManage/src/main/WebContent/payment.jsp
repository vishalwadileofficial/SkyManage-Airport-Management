<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <% if(session.getAttribute("username")==null) { response.sendRedirect("index.jsp"); return; } String
        flightPrice=request.getParameter("price"); if(flightPrice==null) flightPrice="4500.00" ; %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Secure Payment - SkyManage</title>
            <style>
                * {
                    box-sizing: border-box;
                    font-family: 'Segoe UI', sans-serif;
                }

                body {
                    background-color: #f4f4f4;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    min-height: 100vh;
                }

                .payment-container {
                    background: white;
                    width: 800px;
                    display: flex;
                    border-radius: 10px;
                    overflow: hidden;
                    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                }

                /* LEFT SIDE: SUMMARY */
                .summary {
                    background: #333;
                    color: white;
                    padding: 30px;
                    width: 35%;
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                }

                .summary h2 {
                    color: #cfaa60;
                    margin-bottom: 10px;
                }

                .total-price {
                    font-size: 32px;
                    font-weight: bold;
                    margin-top: 20px;
                }

                /* RIGHT SIDE: PAYMENT METHODS */
                .methods {
                    padding: 30px;
                    width: 65%;
                }

                .tabs {
                    display: flex;
                    margin-bottom: 20px;
                    border-bottom: 2px solid #eee;
                }

                .tab {
                    padding: 10px 20px;
                    cursor: pointer;
                    color: #666;
                    font-weight: bold;
                    border-bottom: 3px solid transparent;
                }

                .tab.active {
                    color: #D71920;
                    border-bottom: 3px solid #D71920;
                }

                .method-content {
                    display: none;
                }

                .method-content.active {
                    display: block;
                    animation: fadeIn 0.5s;
                }

                /* FORM ELEMENTS */
                input {
                    width: 100%;
                    padding: 12px;
                    margin-bottom: 15px;
                    border: 1px solid #ddd;
                    border-radius: 4px;
                }

                .btn-pay {
                    background: #D71920;
                    color: white;
                    width: 100%;
                    padding: 15px;
                    border: none;
                    font-size: 18px;
                    font-weight: bold;
                    cursor: pointer;
                    border-radius: 4px;
                }

                .btn-pay:hover {
                    opacity: 0.9;
                }

                /* QR CODE STYLE */
                .qr-box {
                    text-align: center;
                    padding: 20px;
                    background: #f9f9f9;
                    border: 2px dashed #ddd;
                }

                .qr-box img {
                    width: 150px;
                    height: 150px;
                }

                @keyframes fadeIn {
                    from {
                        opacity: 0;
                    }

                    to {
                        opacity: 1;
                    }
                }
            </style>

            <script>
                function switchTab(tabName) {
                    // Remove active class from all tabs
                    var tabs = document.querySelectorAll('.tab');
                    tabs.forEach(function (tab) {
                        tab.classList.remove('active');
                    });

                    // Add active class to clicked tab
                    if (tabName === 'card') {
                        tabs[0].classList.add('active');
                    } else {
                        tabs[1].classList.add('active');
                    }

                    // Hide all contents
                    document.getElementById('card-section').style.display = 'none';
                    document.getElementById('upi-section').style.display = 'none';

                    // Show selected
                    if (tabName === 'card') {
                        document.getElementById('card-section').style.display = 'block';
                    } else {
                        document.getElementById('upi-section').style.display = 'block';
                    }
                }
            </script>
        </head>

        <body>

            <div class="payment-container">
                <div class="summary">
                    <h2>Order Summary</h2>
                    <p>Flight Booking</p>
                    <p>Passenger: 1 Adult</p>
                    <p>Tax: Included</p>
                    <hr style="border-color: #555; margin: 20px 0;">
                    <p>Total to Pay:</p>
                    <div class="total-price">₹ <%= flightPrice %>
                    </div>
                </div>

                <div class="methods">
                    <h2 style="color: #333; margin-bottom: 20px;">Payment Method</h2>

                    <div class="tabs">
                        <div class="tab active" onclick="switchTab('card')">Credit / Debit Card</div>
                        <div class="tab" onclick="switchTab('upi')">UPI / QR Code</div>
                    </div>

                    <div id="card-section" class="method-content active">
                        <form action="thankyou.jsp" method="get">
                            <input type="hidden" name="price" value="<%= flightPrice %>">
                            <label>Card Number</label>
                            <input type="text" placeholder="0000 0000 0000 0000" maxlength="16" required>
                            <div style="display: flex; gap: 10px;">
                                <input type="text" placeholder="MM/YY" style="width: 50%;" required>
                                <input type="password" placeholder="CVV" style="width: 50%;" maxlength="3" required>
                            </div>
                            <label>Name on Card</label>
                            <input type="text" placeholder="e.g. Rahul Sharma" required>

                            <button type="submit" class="btn-pay">Pay Securely</button>
                        </form>
                    </div>

                    <div id="upi-section" class="method-content" style="display: none;">
                        <div class="qr-box">
                            <p style="margin-bottom: 10px; font-weight: bold;">Scan to Pay</p>
                            <img src="qr.jpg" alt="Fake UPI QR Code">
                            <p style="margin-top: 10px; color: #666;">Supported Apps: GPay, PhonePe, Paytm</p>
                        </div>
                        <br>
                        <form action="thankyou.jsp" method="get">
                            <input type="hidden" name="price" value="<%= flightPrice %>">
                            <label>Or enter UPI ID</label>
                            <input type="text" placeholder="username@oksbi">
                            <button type="submit" class="btn-pay">Verify & Pay</button>
                        </form>
                    </div>
                </div>
            </div>

        </body>

        </html>