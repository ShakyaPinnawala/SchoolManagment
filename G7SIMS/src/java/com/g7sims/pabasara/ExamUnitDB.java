package com.g7sims.pabasara;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;

public class ExamUnitDB {

    private static Connection conn = null;
    private static Statement stmt = null;

    static boolean insertGrades(String sid, String oop, String se, String dms, String cn, String ossa, String credits, String gpa) 
            throws  SQLException{

        boolean Success = false;

        try {

            conn = ConnectionDB.getConnection(); //get connection from ConnectionDB class
            stmt = conn.createStatement();

            //insert into query for add marks values into addmarks table
            String sql = "INSERT INTO g7sims_db.addmarks VALUES('" + sid + "', '" + oop + "', '" + se + "','" + dms + "', '" + cn + "', '" + ossa + "', '" + credits + "', '" + gpa + "')";
            int rs = stmt.executeUpdate(sql);

            if (rs > 0) {
                Success = true;
            } else {
                Success = false;
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Success;
    }

    static List<ExamUnit> getAllData() {
        ArrayList<ExamUnit> details = new ArrayList<>();

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.createStatement();

            String sql = "SELECT * FROM g7sims_db.addmarks";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                String sid = rs.getString(1);
                String oop = rs.getString(2);
                String se = rs.getString(3);
                String dms = rs.getString(4);
                String cn = rs.getString(5);
                String ossa = rs.getString(6);
                String credits = rs.getString(7);
                String gpa = rs.getString(8);

                ExamUnit ex = new ExamUnit(sid, oop, se, dms, cn, ossa, credits, gpa);
                details.add(ex);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return details;
    }

    static boolean updateExamDetails(String sid, String oop, String se, String dms, String cn, String ossa, String credits, String gpa) {
        boolean success = false;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.createStatement();

            String sql = "UPDATE g7sims_db.addmarks SET oop = '" + oop + "', se = '" + se + "', dms = '" + dms + "', cn = '" + cn + "', ossa = '" + ossa + "', credits = '" + credits + "', gpa = '" + gpa + "' WHERE sid = '" + sid + "'";

            int rs = stmt.executeUpdate(sql);

            if (rs > 0) {
                success = true;
            } else {
                success = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    public static boolean deleteExamDetails(String id) {

        boolean Success = false;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.createStatement();

            String sql = "delete from g7sims_db.addmarks where sid = '" + id + "'";
            int rs = stmt.executeUpdate(sql);

            if (rs > 0) {
                Success = true;
            } else {
                Success = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return Success;
    }
}
