<%@ page import="org.example.model.Complaint" %>
<%@ page import="org.example.dao.ComplaintDAO" %>
<%@ page import="org.example.model.User" %><%--
  Created by IntelliJ IDEA.
  User: Yashoda
  Date: 6/16/2025
  Time: 9:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String idParam = request.getParameter("complaintId");
    Complaint complaint = null;

    if (idParam != null) {
        int complaintId = Integer.parseInt(idParam);
        complaint = ComplaintDAO.getComplaintById(application, complaintId);
    }

    if (complaint == null) {
%>
<h3>Complaint not found.</h3>
<%
        return;
    }

    User user = (User) session.getAttribute("user");
%>
<html>
<head>

    <title>Edit Complaint</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

<header>
    <div class="logo">Complaint Management System</div>
        <nav>
            <a href="${pageContext.request.contextPath}/employee_dashboard.jsp">Dashboard</a>
            <a href="${pageContext.request.contextPath}/employee_dashboard.jsp?action=showComplaints">My Complaints</a>
            <a href="${pageContext.request.contextPath}/complaint_form.jsp">Add Complaint</a>
            <a href="${pageContext.request.contextPath}/logout">Logout</a>
        </nav>
</header>

<div class="container py-5">
    <div class="complaint-form card shadow">
        <div class="card-header form-header">
            <h4 class="mb-0">✏️ Edit Complaint</h4>
        </div>

        <div class="card-body">
            <form action="editComplaint" method="post">
                <input type="hidden" name="complaintId" value="<%= complaint.getComplaintId() %>">
                <input type="hidden" name="employeeId" value="<%= user.getId() %>">

                <!-- Description -->
                <div class="mb-4">
                    <label for="description" class="form-label fw-bold">Description</label>
                    <textarea class="form-control" id="description" name="description" rows="4" required><%= complaint.getDescription() %></textarea>
                </div>

                <!-- Date -->
                <div class="mb-4">
                    <label for="date" class="form-label fw-bold">Date</label>
                    <input type="date" class="form-control" id="date" name="date" value="<%= complaint.getDate() %>" required>
                </div>

                <!-- Submit Button -->
                <div class="d-flex justify-content-between mt-4">
                    <a href="employee_dashboard.jsp?action=showComplaints" class="btn btn-outline-secondary">Cancel</a>
                    <button type="submit" class="btn btn-primary px-4">Update Complaint</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  
</body>
</html>
