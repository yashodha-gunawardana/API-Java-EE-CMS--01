package org.example.DBCP;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import org.apache.commons.dbcp2.BasicDataSource;

@WebListener
public class DataSource implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {

        BasicDataSource ds = new BasicDataSource();
    }
}
