/*
IT22090294
Chinthana Weligamage
G7SIMS - School Information Management System
 */
package com.g7sims.chinthana;

import java.sql.*;

public class DatabaseConnection {

    private Connection connection;
    private Statement statement;

    public DatabaseConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/", "root", "admin");
            statement = connection.createStatement();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
    
    // Excecute any given query and returns the resultset
    // If Error occred returns null
    public ResultSet getResults(String query) {

        try {
            Statement stmt = connection.createStatement();
            return stmt.executeQuery(query);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public int executeUpdates(String query) {

        try {
            Statement stmt = connection.createStatement();
            return stmt.executeUpdate(query);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public void Close() {

        try {

            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean testConnection() {
        try {
            String testQuery = "SELECT 1";
            ResultSet resultSet = statement.executeQuery(testQuery);
            return resultSet.next(); // If this line executes, it means the connection is successful
        } catch (Exception e) {
            e.printStackTrace();
            return false; // An exception occurred, so the connection is not successful
        }
    }

}
