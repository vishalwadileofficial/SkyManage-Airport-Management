# ✈️ SkyManage - Flight Management System

A robust Java web application for managing airport operations, including flights, passengers, and bookings. Built with **Servlets, JSP, MySQL, and Bootstrap**.

---

## 🚀 Key Features

### ✅ Core Functionality
- **Admin Dashboard**: Real-time overview of active flights, passengers, and bookings.
- **Flight Management**: Add, update, delete, and list flights.
- **Passenger Management**: Register and manage passenger details.
- **Smart Search**: Instantly filter flights and passengers without reloading the page.

### 💳 Booking & Payment System
- **Booking Flow**: Seamless transition from Flight List to Booking.
- **Secure Payment**: 
  - Credit/Debit Card integration simulation.
  - **UPI / QR Code Payment**: Scan user-friendly QR codes for instant payment.
- **Digital Receipt**: Generates a confirmed "Thank You" page with Booking ID upon success.

---

## 🛠️ Tech Stack

| Component | Technology |
|-----------|------------|
| **Backend** | Java Servlets (J2EE), JDBC |
| **Frontend** | JSP, HTML5, CSS3, JavaScript |
| **Database** | MySQL 8.0+ |
| **Server** | Apache Tomcat 9.0 |
| **IDE** | Eclipse Enterprise Edition |

---

## ⚙️ Installation & Setup

### prerequisites
1.  **JDK 1.8** or higher installed.
2.  **Apache Tomcat 9.0** server configured.
3.  **MySQL Server** running.
4.  **Eclipse IDE for Enterprise Java Developers**.

### Step 1: Database Setup
1.  Open your MySQL Client (Workbench or Command Line).
2.  Create the database and tables using the provided script:
    ```sql
    SOURCE d:/JAVA Projects/SkyManage/database/schema.sql;
    ```
    *(Or copy-paste the contents of `database/schema.sql`)*.

### Step 2: Configure Application
1.  Open `src/main/java/com/skymanage/config/DBConnection.java`.
2.  Update your MySQL credentials:
    ```java
    private static final String URL = "jdbc:mysql://localhost:3306/skymanage";
    private static final String USER = "root"; 
    private static final String PASS = "YOUR_PASSWORD"; // <--- Update this
    ```

### Step 3: Run in Eclipse
1.  **Import Project**: `File > Import > General > Projects from Folder or Archive` -> Select `SkyManage` folder.
2.  **Add to Server**: Right-click project -> `Run As` -> `Run on Server`.
3.  Select **Apache Tomcat v9.0** and click Finish.
4.  Access at: `http://localhost:8080/SkyManage/`

---

## 🔐 Default Admin Credentials

| Role | Username | Password |
|------|----------|----------|
| **Admin** | `admin` | `admin123` |

---

## 🐛 Troubleshooting Guide

### 1. "Generic 500 Error" on Dashboard
If you see a blank page or 500 error after login:
- **Solution**: 
    1. Stop the Server.
    2. Right-click Project -> **Refresh**.
    3. Project -> **Clean...**.
    4. Right-click Server -> **Clean...**.
    5. Restart Server.
    *(See `DEBUGGING.md` for detailed steps)*.

### 2. "JavaSE-21 cannot be resolved" / Build Path Errors
The project is configured for **Java 1.8** compatibility.
- **Fix**: Right-click Project -> Properties -> Java Build Path -> Libraries. Remove broken JREs and Add Library -> JRE System Library -> Workspace Default.

### 3. QR Code Not Showing
- Ensure `qr.jpg` exists in `WebContent` directory.
- Refresh the browser cache (`Ctrl + F5`).

---

## 📁 Project Structure

```
SkyManage/
├── src/main/java/
│   └── com.skymanage.web/       # Servlet Controllers
│   └── com.skymanage.dao/       # Database Logic
│   └── com.skymanage.model/     # Java Beans
├── src/main/WebContent/
│   ├── assets/                  # Images & Static resources
│   ├── WEB-INF/                 # Configuration
│   ├── dashboard.jsp            # Admin Home
│   ├── payment.jsp              # Payment Gateway
│   ├── thankyou.jsp             # Success Page
│   └── style.css                # Global Styles
└── database/
    └── schema.sql               # Database Script
```

---

**Developed with ❤️ by SkyManage Team**
