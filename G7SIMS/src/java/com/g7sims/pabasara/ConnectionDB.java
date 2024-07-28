package com.g7sims.pabasara;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionDB {

    private static String url = "jdbc:mysql://localhost:3306/"; //url to connect localhost
    private static String user = "root"; //mysql database username
    private static String password = "admin"; //mysql database password
    private static Connection con;

    static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            System.out.println("Database connection is not success!");
        }

        return con;
    }
}
