package org.example.DBCP;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.SQLException;

@WebListener
public class DataSource implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {

        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
        ds.setUrl("jdbc:mysql://localhost:3306/cms");
        ds.setUsername("root");
        ds.setPassword("yash25");
        ds.setInitialSize(5);
        ds.setMaxTotal(30);

        ServletContext servletContext = sce.getServletContext();
        servletContext.setAttribute("ds", ds);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

        try {
            ServletContext servletContext = sce.getServletContext();
            BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("ds");

            ds.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
