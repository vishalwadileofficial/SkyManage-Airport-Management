package com.skymanage.web;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.skymanage.dao.PassengerDAO;
import com.skymanage.model.Passenger;

@WebServlet("/passengers")
public class PassengerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PassengerDAO passengerDAO;

    public void init() {
        passengerDAO = new PassengerDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Get List from DAO
        List<Passenger> listPassenger = passengerDAO.selectAllPassengers();
        
        // 2. Attach data to request
        request.setAttribute("listPassenger", listPassenger);
        
        // 3. Send to JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("passenger-list.jsp");
        dispatcher.forward(request, response);
    }
}