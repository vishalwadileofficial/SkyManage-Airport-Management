<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up - SkyManage</title>
    <style>
        * { box-sizing: border-box; font-family: 'Segoe UI', sans-serif; }
        body { background: linear-gradient(135deg, #333 0%, #D71920 100%); height: 100vh; display: flex; justify-content: center; align-items: center; }
        .card { background: white; padding: 40px; border-radius: 8px; width: 400px; text-align: center; box-shadow: 0 4px 15px rgba(0,0,0,0.2); }
        .form-control { width: 100%; padding: 12px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 4px; }
        .btn-primary { background-color: #D71920; color: white; padding: 12px; width: 100%; border: none; border-radius: 4px; font-weight: bold; cursor: pointer; }
        a { color: #D71920; text-decoration: none; font-weight: bold; }
    </style>
</head>
<body>
    <div class="card">
        <h2 style="color: #D71920;">Join SkyManage</h2>
        <p style="color: #666; margin-bottom: 20px;">Create your account</p>
        
        <form action="register" method="post">
            <input type="text" name="username" class="form-control" placeholder="Choose Username" required>
            <input type="password" name="password" class="form-control" placeholder="Choose Password" required>
            <button type="submit" class="btn-primary">REGISTER</button>
        </form>
        <br>
        <p>Already have an account? <a href="index.jsp">Login here</a></p>
    </div>
</body>
</html>