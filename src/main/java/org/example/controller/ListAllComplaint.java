package org.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.model.Complaint;

import java.util.List;

@WebServlet("/admin/complaints")
public class ListAllComplaint extends HttpServlet {

    @Override
    protected void doGet (HttpServletRequest req, HttpServletResponse resp) throws ServletException {
        try {
            List<Complaint> complaints = ComplaintDAO.getAllComplaints(getServletContext());
            req.setAttribute("complaints", complaints);
            req.getRequestDispatcher("/admin_dashboard.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

}
