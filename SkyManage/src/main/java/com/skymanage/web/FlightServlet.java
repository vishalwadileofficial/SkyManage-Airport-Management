package com.skymanage.web;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.skymanage.dao.FlightDAO;
import com.skymanage.model.Flight;

// ⚠️ FIXED: Mapped only to "/flights", not root "/"
@WebServlet("/flights")
public class FlightServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private FlightDAO flightDAO;

    public void init() {
        flightDAO = new FlightDAO();
    }

    // Handles POST requests (Adding a flight)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String flightNo = request.getParameter("flightNumber");
        String airline = request.getParameter("airlineName");
        String src = request.getParameter("source");
        String dest = request.getParameter("destination");

        // Handle potential number format errors safely
        double price = 0.0;
        try {
            price = Double.parseDouble(request.getParameter("price"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        Flight newFlight = new Flight(0, flightNo, airline, src, dest, price);
        flightDAO.insertFlight(newFlight);

        // Redirect back to the list using the new action parameter
        response.sendRedirect("flights?action=list");
    }

    // Handles GET requests (Navigation)
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ⚠️ FIXED: We now use "?action=..." parameter instead of path
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "delete":
                    deleteFlight(request, response);
                    break;
                case "list":
                default:
                    listFlights(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void listFlights(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Flight> listFlight = flightDAO.selectAllFlights();
        request.setAttribute("listFlight", listFlight);
        RequestDispatcher dispatcher = request.getRequestDispatcher("flight-list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("flight-form.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteFlight(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("flights?action=list");
            return;
        }
        try {
            int id = Integer.parseInt(idParam);
            flightDAO.deleteFlight(id);
        } catch (NumberFormatException e) {
            // Invalid ID format, just redirect back
        }
        response.sendRedirect("flights?action=list");
    }
}