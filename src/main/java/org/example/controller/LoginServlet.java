package org.example.controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.dao.UserDAO;
import org.example.model.User;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost (HttpServletRequest req, HttpServletResponse resp) {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        ServletContext servletContext = getServletContext();

        try {
            User user = UserDAO.findUser(servletContext, email, password);

            if (user != null) {
                HttpSession session = req.getSession();
                session.setAttribute("user", user);
                session.setAttribute("role", user.getRole());
                session.setAttribute("userId", user.getId());

                if ("Admin".equals(user.getRole())) {
                    resp.sendRedirect(req.getContextPath() + "/admin_dashboard.jsp");
                } else if ("Employee".equals(user.getRole())) {
                    resp.sendRedirect(req.getContextPath() + "/employee_dashboard.jsp");
                } else {

                }
            }
        }
    }
}
