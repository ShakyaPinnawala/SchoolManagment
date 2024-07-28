package com.g7sims.ishini;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

    private static String url = "jdbc:mysql://localhost:3306/";
    private static String user = "root";
    private static String password = "admin";
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
