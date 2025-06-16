package org.example.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost (HttpServletRequest req, HttpServletResponse resp) {

        String email = req.getParameter("email");
        String password = req.getParameter("password");
    }
}
