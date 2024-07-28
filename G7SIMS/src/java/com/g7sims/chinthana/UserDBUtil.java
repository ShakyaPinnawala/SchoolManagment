/*
IT22090294
Chinthana Weligamage
G7SIMS - School Information Management System
 */
package com.g7sims.chinthana;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDBUtil {

    private DatabaseConnection dbConnect;
    private ResultSet resSet;
    private String query;

    public ArrayList<String> CheckUser(String username, String password) throws Exception {
        dbConnect = new DatabaseConnection();
        query = "SELECT UserID, UserType, Username FROM g7sims_db.user WHERE Username ='" + username + "' AND Password = '" + password + "'";
        resSet = dbConnect.getResults(query);

        ArrayList<String> userData = new ArrayList<>();

        try {
            if (!(resSet.isAfterLast())) {
                resSet.next();
                userData.add(resSet.getString("UserID"));
                userData.add(resSet.getString("UserType"));
                userData.add(resSet.getString("Username"));
                return userData;
                //return resSet.getString("UserID");
            }
        } finally {
            close(resSet);
            dbConnect.Close();
        }

        return null;
    }

    public List<User> getUser() throws Exception {
        dbConnect = new DatabaseConnection();
        List<User> users = new ArrayList<>();

        try {

            query = "SELECT * FROM g7sims_db.user";
            resSet = dbConnect.getResults(query);

            // process results set
            while (resSet.next()) {

                // retrieve data from result set]
                int UserID = resSet.getInt("UserID");
                String Username = resSet.getString("Username");
                String Password = resSet.getString("Password");

                // create new student object
                User tempUser = new User(UserID, Username, Password);

                // add it to the list of students
                users.add(tempUser);

            }

            return users;
        } finally {
            // close JDBC objects
            close(resSet);
            dbConnect.Close();
        }
    }

    private void close(ResultSet resSet) {
        try {
            if (resSet != null) {
                resSet.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
