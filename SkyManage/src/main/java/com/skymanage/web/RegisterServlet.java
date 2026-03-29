package com.skymanage.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.skymanage.dao.UserDAO;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        
        UserDAO dao = new UserDAO();
        if(dao.registerUser(user, pass)) {
            // Success: Go to Login Page
            response.sendRedirect("index.jsp?msg=Registered");
        } else {
            // Failure: Stay on Register Page
            response.sendRedirect("register.jsp?error=Fail");
        }
    }
}