<%@ page import="org.example.model.Complaint" %><%--
  Created by IntelliJ IDEA.
  User: Yashoda
  Date: 6/16/2025
  Time: 9:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>

    <title>Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

</head>
<body>

<header>
    <div class="logo">Complaint Management System</div>
    <nav>
        <a href="${pageContext.request.contextPath}/admin_dashboard.jsp">Dashboard</a>
        <a href="${pageContext.request.contextPath}/admin_dashboard.jsp?action=showComplaints">All Complaints</a>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </nav>
</header>

<div class="container">
    <!-- Welcome Section -->
    <section class="welcome-section">
        <div class="welcome-text">
            <h1>Welcome, <%= user.getName() %></h1>
            <p>Admin Dashboard - Manage complaints and system settings</p>
        </div>
        <div class="stats-card">
            Total Complaints: <%= complaints != null ? complaints.size() : 0 %>
        </div>
    </section>

    <% if (showTable) { %>
    <h2>All Complaints</h2>

    <% if (complaints != null && !complaints.isEmpty()) { %>
    <table>
        <thead>
        <tr>
            <th>Complaint ID</th>
            <th>Employee ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Status</th>
            <th>Date</th>
            <th>Remark</th>
            <th>Actions</th>
        </tr>
        </thead>

        <tbody>
            <% for (Complaint c : complaints) {
            String status = (c.getStatus() != null) ? c.getStatus().toLowerCase() : "unknown";
            String statusClass = switch (status) {
                case "pending" -> "status-pending";
                case "in progress" -> "status-in-progress";
                case "resolved" -> "status-resolved";
                default -> "status-unknown";
            };
            %>

            <tr>
                <td><%= c.getComplaintId() %></td>
                <td><%= c.getEmployeeId() %></td>
                <td><%= c.getTitle() %></td>
                <td><%= c.getDescription() %></td>
                <td class="<%= statusClass %>"><%= c.getStatus() != null ? c.getStatus() : "Unknown" %></td>
                <td><%= c.getDate() %></td>
                <%--            <td><%= c.getRemarks() != null ? c.getRemarks() : "" %></td>--%>
                <td>
        </tbody>
    </table>
</div>

</body>
</html>
