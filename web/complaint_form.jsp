<%--
  Created by IntelliJ IDEA.
  User: Yashoda
  Date: 6/16/2025
  Time: 9:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>New Complaint</title>
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
            <div class="d-flex justify-content-between align-items-center">
                <h4 class="mb-0">📝 File a New Complaint</h4>
                <span class="badge bg-light text-dark">Employee ID: ${employeeId}</span>
            </div>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/addComplaint" method="post">
                <%
                    org.example.model.User user = (org.example.model.User) session.getAttribute("user");
                %>
                <input type="hidden" name="employeeId" value="<%= user.getId() %>">


                <!-- Complaint Title -->
                <div class="mb-4">
                    <label for="title" class="form-label fw-bold">Complaint Title</label>
                    <input type="text" class="form-control" id="title" name="title"
                           placeholder="Brief summary of your complaint" required>
                </div>

                <!-- Status Selection -->
                <div class="mb-4">
                    <label for="status" class="form-label fw-bold">Status</label>
                    <select class="form-select" id="status" name="status" required>
                        <option value="Pending" selected class="status-pending">Pending</option>
                        <option value="Resolved" class="status-resolved">Resolved</option>
                    </select>
                </div>

                <!-- Date Selection -->
                <div class="mb-4">
                    <label for="date" class="form-label fw-bold">Date</label>
                    <input type="date" class="form-control" id="date" name="date" required>
                </div>

                <!-- Detailed Description -->
                <div class="mb-4">
                    <label for="description" class="form-label fw-bold">Detailed Description</label>
                    <textarea class="form-control" id="description" name="description" rows="5"
                              placeholder="Please provide detailed information about your complaint..." required></textarea>
                </div>

                <!-- Form Actions -->
                <div class="d-flex justify-content-between mt-4">
                    <button type="reset" class="btn btn-outline-secondary">Clear Form</button>
                    <button type="submit" class="btn btn-primary px-4">Submit Complaint</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>
