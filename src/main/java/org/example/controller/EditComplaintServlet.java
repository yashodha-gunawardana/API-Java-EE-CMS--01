package org.example.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.dao.ComplaintDAO;
import org.example.model.Complaint;
import org.example.model.User;

import java.io.IOException;

@WebServlet("/editComplaint")
public class EditComplaintServlet extends HttpServlet {

    @Override
    protected void doPost (HttpServletRequest req, HttpServletResponse resp) throws IOException {

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !"Employee".equalsIgnoreCase(user.getRole())) {
            resp.sendRedirect("error_message.jsp");
            return;
        }

        int complaintId = Integer.parseInt(req.getParameter("complaintId"));
        String description = req.getParameter("description");
        String date = req.getParameter("date");

        try {
            Complaint existing = ComplaintDAO.getComplaintById(getServletContext(), complaintId);

            if (existing == null || existing.getEmployeeId() != user.getId() || "Resolved".equalsIgnoreCase(existing.getStatus())) {
                resp.sendRedirect("error_message.jsp");
                return;
            }

            Complaint updated = new Complaint();
            updated.setComplaintId(complaintId);
            updated.setDescription(description);
            updated.setDate(date);
            updated.setEmployeeId(user.getId());
        }
    }
}
