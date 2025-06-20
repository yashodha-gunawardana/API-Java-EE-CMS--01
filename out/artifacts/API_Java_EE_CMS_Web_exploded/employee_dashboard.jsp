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

    <style>
        :root {
            --primary: #008080;
            --primary-light: #a7c7c7;
            --accent: #36454f;
            --light: #f0f8ff;
            --success: #2e8b57;
            --warning: #ffa500;
            --danger: #cd5c5c;
            --white: #ffffff;
            --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --text-dark: #333333;
            --text-light: #666666;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--light);
            color: var(--text-dark);
            line-height: 1.6;
        }

        header {
            background-color: var(--primary);
            padding: 1rem 2rem;
            color: var(--white);
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: var(--shadow);
        }

        .logo {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--white);
        }

        nav {
            display: flex;
            gap: 1.5rem;
        }

        nav a {
            color: var(--white);
            text-decoration: none;
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            transition: all 0.3s ease;
        }

        nav a:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }

        .container {
            max-width: 1500px;
            margin: 2rem auto;
            padding: 0 2rem;
        }

        .welcome-section {
            background-color: var(--white);
            padding: 2rem;
            border-radius: 8px;
            box-shadow: var(--shadow);
            margin-bottom: 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-left: 5px solid var(--accent);
        }

        .welcome-text h1 {
            color: var(--primary);
            margin-bottom: 0.5rem;
        }

        .welcome-text p {
            color: var(--text-light);
        }

        .stats-card {
            background-color: var(--accent);
            color: var(--white);
            padding: 1rem 1.5rem;
            border-radius: 8px;
            font-weight: 500;
            box-shadow: var(--shadow);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1.5rem;
            background-color: var(--white);
            box-shadow: var(--shadow);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid var(--primary-light);
        }

        th {
            background-color: var(--accent);
            color: var(--white);
            font-weight: 500;
        }

        tr:hover {
            background-color: var(--primary-light);
        }

        .btn {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        a.btn {
            text-decoration: none;
        }
        .btn-sm {
            padding: 0.3rem 0.6rem;
            font-size: 0.85rem;
        }

        .btn-primary {
            background-color: var(--success);
            color: var(--white);
        }

        .btn-primary:hover {
            background-color: #006666;
            transform: translateY(-1px);
        }

        .btn-danger {
            background-color: var(--danger);
            color: var(--white);
        }

        .btn-danger:hover {
            background-color: #b35252;
            transform: translateY(-1px);
        }

        .empty-dashboard {
            text-align: center;
            padding: 3rem;
            background-color: var(--white);
            border-radius: 8px;
            box-shadow: var(--shadow);
            margin-top: 2rem;
            border: 1px dashed var(--primary-light);
        }

        .empty-icon {
            font-size: 4rem;
            color: var(--primary);
            margin-bottom: 1rem;
            opacity: 0.7;
        }

        .empty-message {
            font-size: 1.2rem;
            color: var(--accent);
            margin-bottom: 1.5rem;
        }

        .empty-subMessage {
            color: var(--text-light);
            margin-bottom: 2rem;
        }

        .empty-action {
            display: inline-block;
            background-color: var(--primary);
            color: white;
            padding: 0.8rem 1.5rem;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: var(--shadow);
        }

        .empty-action:hover {
            background-color: #006666;
            transform: translateY(-2px);
        }
    </style>

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
