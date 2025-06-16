<%@ page import="org.example.model.User" %>
<%@ page import="org.example.model.Complaint" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.dao.ComplaintDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: Yashoda
  Date: 6/16/2025
  Time: 9:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    String action = request.getParameter("action");
    boolean showTable = "showComplaints".equals(action);
    List<Complaint> complaints = ComplaintDAO.getComplaintsByEmployeeId(application, user.getId());
%>
<html>
<head>

    <title>Employee Dashboard</title>
    <link rel="stylesheet">

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

<div class="container">
    <!-- Welcome Section -->
    <section class="welcome-section">
        <div class="welcome-text">
            <h1>Welcome, <%= user.getName() %></h1>
            <p>Employee Dashboard - Track and manage your submitted complaints</p>
        </div>
        <div class="stats-card">
            Total Complaints: <%= complaints != null ? complaints.size() : 0 %>
        </div>
    </section>

    <% if (showTable) { %>
    <h2>My Complaints</h2>

    <% if (complaints != null && !complaints.isEmpty()) { %>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Status</th>
            <th>Date</th>
            <th>Actions</th>
        </tr>
        </thead>

        <tbody>
            <%
                for (Complaint c : complaints) {
                    String statusClass = "";
                    switch(c.getStatus().toLowerCase()) {
                        case "pending":
                            statusClass = "status-pending";
                            break;
                        case "in progress":
                            statusClass = "status-in-progress";
                            break;
                        case "resolved":
                            statusClass = "status-resolved";
                            break;
                    }
            %>

            <tr>
                <td><%= c.getComplaintId() %></td>
                <td><%= c.getTitle() %></td>
                <td><%= c.getDescription() %></td>
                <td class="<%= statusClass %>"><%= c.getStatus() %></td>
                <td><%= c.getDate() %></td>
                <td>
                    <div class="action-group">
                        <% if (!"Resolved".equalsIgnoreCase(c.getStatus())) { %>
                        <a class="btn btn-primary btn-sm" href="edit_complaint.jsp?complaintId=<%= c.getComplaintId() %>">Edit</a>
                        <form action="${pageContext.request.contextPath}/deleteComplaint" method="post" style="display:inline;">
                            <input type="hidden" name="complaintId" value="<%= c.getComplaintId() %>" />
                            <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this complaint?');">Delete</button>
                        </form>
                        <% } else { %>
                        <span class="locked-text">Resolved - Locked</span>
                        <% } %>
                    </div>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <% } else { %>
    <div class="empty-dashboard">
        <div class="empty-icon">📭</div>
        <h2 class="empty-message">No Complaints Found</h2>
        <p class="empty-subMessage">You haven't submitted any complaints yet.</p>
        <a href="${pageContext.request.contextPath}/complaint_form.jsp" class="empty-action">
            Submit Your First Complaint
        </a>
    </div>
    <% } %>
    <% } %>

</div>

</body>
</html>
