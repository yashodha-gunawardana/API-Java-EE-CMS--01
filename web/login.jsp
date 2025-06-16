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
    <title>Login Page</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap">

</head>
<body>

<div class="login-container">
    <div class="login-content">
        <div class="logo">
            <h1>Sign In</h1>
            <p>Welcome back! Please enter your credentials to continue.</p>
        </div>

        <!-- Error Message -->
        <div class="error-message" style="display: <%= request.getAttribute("errorMessage") != null ? "block" : "none" %>;">
            <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>
        </div>


        <form method="post" action="${pageContext.request.contextPath}/login">

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="example@123gmail.com" required>
                <div class="icon"><i class="far fa-envelope"></i></div>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" name="password" id="password" placeholder="••••••••" required>
                <div class="icon"><i class="fas fa-lock"></i></div>
            </div>

            <button type="submit" class="btn">SignIn to Dashboard</button>
        </form>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
</body>
</html>
