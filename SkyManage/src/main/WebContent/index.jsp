<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - SkyManage</title>
    <style>
        /* --- EMBEDDED CSS --- */
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        body { background: linear-gradient(135deg, #333 0%, #D71920 100%); height: 100vh; display: flex; justify-content: center; align-items: center; }
        
        /* CARD STYLE */
        .card {
            background: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            width: 400px;
            text-align: center;
        }

        /* BUTTONS */
        .btn-primary { 
            background-color: #D71920; 
            color: white; 
            padding: 12px; 
            width: 100%; 
            border: none; 
            border-radius: 4px; 
            font-weight: bold; 
            cursor: pointer; 
            margin-top: 10px;
        }
        .btn-primary:hover { opacity: 0.9; }
        
        /* INPUTS */
        .form-control {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        
        /* NEW LINK STYLE (RED) */
        .create-link {
            color: #D71920; /* ✅ CHANGED TO RED */
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
            font-size: 14px;
            font-weight: bold;
        }
        .create-link:hover { text-decoration: underline; }
    </style>
</head>
<body>

    <div class="card">
        <h2 style="color: #D71920; margin-bottom: 10px;">SkyManage</h2>
        <p style="color: #666; margin-bottom: 20px;">Airport Management System</p>
        
        <% if(request.getParameter("error") != null) { %>
            <p style="color: red; font-size: 14px; margin-bottom: 10px;">Invalid Username or Password!</p>
        <% } %>
        
        <% if(request.getParameter("msg") != null) { %>
            <p style="color: green; font-size: 14px; margin-bottom: 10px;">Registration Successful! Please Login.</p>
        <% } %>

        <form action="login" method="post">
            <input type="text" name="username" class="form-control" placeholder="Username (admin)" required>
            <input type="password" name="password" class="form-control" placeholder="Password (admin123)" required>
            <button type="submit" class="btn-primary">LOGIN</button>
        </form>

        <a href="register.jsp" class="create-link">Create New Account</a>
    </div>

</body>
</html>