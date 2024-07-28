package com.g7sims.ishini;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDBUtil {

    private static boolean isSuccess;
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

    public static List<User> validate(String id, String name) {

        ArrayList<User> cus = new ArrayList<>();

        try {

            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "select * from g7sims_db.payment_ishini where id='" + id + "' and name='" + name + "'";
            rs = stmt.executeQuery(sql);

            if (rs.next()) {
                int id1 = rs.getInt(1);
                String name1 = rs.getString(2);
                String course = rs.getString(3);
                String method = rs.getString(4);
                String status = rs.getString(5);
                String date = rs.getString(6);
                String fees = rs.getString(7);

                User c = new User(id1, name1, course, method, status, date, fees);
                cus.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();

        }

        return cus;
    }

    public static boolean insertcustomer(String name, String course, String method, String status, String date, String fees) {

        boolean isSuccess = false;

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "insert into g7sims_db.payment_ishini values (0,'" + name + "','" + course + "','" + method + "','" + status + "','" + date + "','" + fees + "')";
            int rs = stmt.executeUpdate(sql);

            if (rs > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    public static boolean updatecustomer(String id, String name, String course, String method, String status, String date, String fees) {

        try {

            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "update g7sims_db.payment_ishini set name='" + name + "',course='" + course + "',method='" + method + "',status='" + status + "' ,date='" + date + "',fees='" + fees + "'  "
                    + "where id='" + id + "'";
            int rs = stmt.executeUpdate(sql);

            if (rs > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    public static List<User> getCustomerDetails(String Id) {

        int convertedID = Integer.parseInt(Id);

        ArrayList<User> cus = new ArrayList<>();

        try {

            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "select * from g7sims_db.payment_ishini where id='" + convertedID + "'";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String course = rs.getString(3);
                String method = rs.getString(4);
                String status = rs.getString(5);
                String date = rs.getString(6);
                String fees = rs.getString(7);

                User c = new User(id, name, course, method, status, date, fees);
                cus.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return cus;
    }

    public static boolean deleteCustomer(String id) {

        int convId = Integer.parseInt(id);

        try {

            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "delete from g7sims_db.payment_ishini where id='" + convId + "'";
            int r = stmt.executeUpdate(sql);

            if (r > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    public static List<User> getAllAdmins() {
        ArrayList<User> admins = new ArrayList<>();

        try {
            // DB CONNECTION
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String sql = "select * from g7sims_db.payment_ishini";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String course = rs.getString(3);
                String method = rs.getString(4);
                String status = rs.getString(5);
                String date = rs.getString(6);
                String fees = rs.getString(7);

                User a = new User(id, name, course, method, status, date, fees);
                admins.add(a);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return admins;
    }

}
