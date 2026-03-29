package com.skymanage.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get session only if it exists (false = don't create new one)
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // Destroy the "Badge" only if it exists
        }
        response.sendRedirect("index.jsp");
    }
}