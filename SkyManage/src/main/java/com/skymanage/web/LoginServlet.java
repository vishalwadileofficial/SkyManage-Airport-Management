package com.skymanage.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.skymanage.dao.UserDAO;

// This annotation tells the server: "Run this code when URL is /login"
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Get data from the HTML form
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        // 2. Check with Database
        if (userDAO.validate(user, pass)) {
            // 3. Success: Create a session (Badge) for the user
            HttpSession session = request.getSession();
            session.setAttribute("username", user);
            
            // Redirect to Dashboard
            response.sendRedirect("dashboard.jsp");
        } else {
            // 4. Failure: Send them back to Login page with error
            response.sendRedirect("index.jsp?error=InvalidCredentials");
        }
    }
}