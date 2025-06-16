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



        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return complaints;
    }
}
