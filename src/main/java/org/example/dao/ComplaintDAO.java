package org.example.dao;

import jakarta.servlet.ServletContext;
import org.apache.commons.dbcp2.BasicDataSource;
import org.example.model.Complaint;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ComplaintDAO {

    public static List<Complaint> getAllComplaints(ServletContext servletContext) {
        BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("ds");
        List<Complaint> complaints = new ArrayList<>();

        try {
            Connection connection = ds.getConnection();
            PreparedStatement pstm = connection.prepareStatement("SELECT * FROM complaint");
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                Complaint complaint = new Complaint();
                complaint.setComplaintId(rs.getInt("complaint_id"));
                complaint.setEmployeeId(rs.getInt("employee_id"));
                complaint.setTitle(rs.getString("title"));
                complaint.setDescription(rs.getString("description"));
                complaint.setStatus(rs.getString("status"));
                complaint.setRemarks(rs.getString("remarks"));
                complaint.setDate(rs.getString("date"));

                complaints.add(complaint);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return complaints;
    }


    public static List<Complaint> getComplaintsByEmployeeId(ServletContext servletContext, int employeeId) {
        BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("ds");
        List<Complaint> complaints = new ArrayList<>();

        try {
            Connection connection = ds.getConnection();
            PreparedStatement pstm = connection.prepareStatement(
                    "SELECT * FROM complaint WHERE employee_id = ?"
            );
            pstm.setInt(1, employeeId);
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                Complaint complaint = new Complaint();
                complaint.setComplaintId(rs.getInt("complaint_id"));
                complaint.setEmployeeId(rs.getInt("employee_id"));
                complaint.setTitle(rs.getString("title"));
                complaint.setDescription(rs.getString("description"));
                complaint.setStatus(rs.getString("status"));
                complaint.setRemarks(rs.getString("remarks"));
                complaint.setDate(rs.getString("date"));

                complaints.add(complaint);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return complaints;
    }


    public static void saveComplaint(ServletContext servletContext, Complaint complaint) {
        BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("ds");

        try {
            Connection connection = ds.getConnection();
            PreparedStatement pstm = connection.prepareStatement("INSERT INTO complaint (employee_id, title, description, status, date) VALUES (?, ?, ?, ?, ?)");
            pstm.setInt(1, complaint.getEmployeeId());
            pstm.setString(2, complaint.getTitle());
            pstm.setString(3, complaint.getDescription());
            pstm.setString(4, complaint.getStatus());
            pstm.setString(5, complaint.getDate());
            pstm.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


}


