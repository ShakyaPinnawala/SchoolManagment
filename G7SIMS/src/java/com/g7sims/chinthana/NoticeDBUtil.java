/*
IT22090294
Chinthana Weligamage
G7SIMS - School Information Management System
 */
package com.g7sims.chinthana;

import static com.g7sims.chinthana.DateUtils.formatDatetoToString;

import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class NoticeDBUtil {

    private DatabaseConnection dbConnect;
    private ResultSet resSet;
    private String query;

    public ArrayList<Notice> getAllNotices() throws Exception {
        dbConnect = new DatabaseConnection();
        ArrayList<Notice> notices = new ArrayList<>();

        try {
            query = "SELECT * FROM g7sims_db.notice ORDER BY noticeDate DESC";
            resSet = dbConnect.getResults(query);

            // process results set
            while (resSet.next()) {
                int noticeID = resSet.getInt("NoticeID");
                String noticeTitle = resSet.getString("noticeTitle");
                Date noticeDate = resSet.getDate("noticeDate");
                String noticeContent = resSet.getString("noticeContent");
                String noticeImage = "../noticeimages/" + resSet.getString("noticeImage");
                String noticeGroup = resSet.getString("noticeGroup");

                Notice tempNotice = new Notice(noticeID, noticeTitle, formatDatetoToString(noticeDate, "yyyy-MM-dd"), noticeContent, noticeImage, noticeGroup);
                notices.add(tempNotice);
            }

            return notices;
        } finally {
            // close JDBC objects
            close(resSet);
            dbConnect.Close();
        }
    }

    public ArrayList<Notice> get3Notices() throws Exception {
        dbConnect = new DatabaseConnection();
        ArrayList<Notice> notices = new ArrayList<>();

        try {
            query = "SELECT * FROM g7sims_db.notice ORDER BY noticeDate DESC LIMIT 3";
            resSet = dbConnect.getResults(query);

            // process results set
            while (resSet.next()) {
                int noticeID = resSet.getInt("NoticeID");
                String noticeTitle = resSet.getString("noticeTitle");
                Date noticeDate = resSet.getDate("noticeDate");
                String noticeContent = resSet.getString("noticeContent");
                String noticeImage = "../noticeimages/" + resSet.getString("noticeImage");
                String noticeGroup = resSet.getString("noticeGroup");

                Notice tempNotice = new Notice(noticeID, noticeTitle, formatDatetoToString(noticeDate, "yyyy-MM-dd"), noticeContent, noticeImage, noticeGroup);
                notices.add(tempNotice);
            }

            return notices;
        } finally {
            // close JDBC objects
            close(resSet);
            dbConnect.Close();
        }
    }
    
    public List<Notice> searchNotices(String searchTerm) throws Exception {
        dbConnect = new DatabaseConnection();
        List<Notice> notices = new ArrayList<>();

        try {
            query = "SELECT * FROM g7sims_db.notice WHERE noticeTitle LIKE '%" + searchTerm + "%' OR noticeContent LIKE '%" + searchTerm + "%' LIMIT 10";
            resSet = dbConnect.getResults(query);

            // process results set
            while (resSet.next()) {
                int noticeID = resSet.getInt("NoticeID");
                String noticeTitle = resSet.getString("noticeTitle");
                Date noticeDate = resSet.getDate("noticeDate");
                String noticeContent = resSet.getString("noticeContent");
                String noticeImage = "../noticeimages/" + resSet.getString("noticeImage");
                String noticeGroup = resSet.getString("noticeGroup");

                Notice tempNotice = new Notice(noticeID, noticeTitle, formatDatetoToString(noticeDate, "yyyy-MM-dd"), noticeContent, noticeImage, noticeGroup);
                notices.add(tempNotice);
            }

            return notices;
        } finally {
            // close JDBC objects
            close(resSet);
            dbConnect.Close();
        }
    }
    
    public int addNewNotice(Notice tempNotice) throws Exception {
        dbConnect = new DatabaseConnection();

        try {
            query = "INSERT INTO g7sims_db.notice (NoticeTitle, NoticeDate, NoticeContent, NoticeImage, NoticeGroup)"
                    + " VALUES ('" + tempNotice.getNoticeTitle() + "', '" + tempNotice.getNoticeDate() + "', '" + tempNotice.getNoticeContent()
                    + "', '" + tempNotice.getNoticeImage() + "', '" + tempNotice.getNoticeGroup() + "')";

            return dbConnect.executeUpdates(query);

        } finally {

            // close JDBC objects
            close(resSet);
            dbConnect.Close();
        }
    }

    public int updateNotice(Notice tempNotice) throws Exception {
        dbConnect = new DatabaseConnection();
        int res = -1;
        try {
            query = "UPDATE g7sims_db.notice SET NoticeTitle = '" + tempNotice.getNoticeTitle() + "', NoticeDate = '" + tempNotice.getNoticeDate()
                    + "', NoticeContent = '" + tempNotice.getNoticeContent() + "', NoticeImage = '" + tempNotice.getNoticeImage()
                    + "', NoticeGroup = '" + tempNotice.getNoticeGroup() + "' WHERE NoticeID = '" + tempNotice.getNoticeID() + "'";

            res = dbConnect.executeUpdates(query);
            //FileUploadUtils.cleaner(getNoticeImages());

        } finally {
            // close JDBC objects
            close(resSet);
            dbConnect.Close();
            return res;
        }
    }

    public int deleteNotice(Notice tempNotice) throws Exception {
        dbConnect = new DatabaseConnection();
        int res = -1;
        try {
            query = "DELETE FROM g7sims_db.notice WHERE NoticeID = '" + tempNotice.getNoticeID() + "'";

            res = dbConnect.executeUpdates(query);
            //FileUploadUtils.cleaner(getNoticeImages());

        } finally {
            // close JDBC objects
            close(resSet);
            dbConnect.Close();
            return res;
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
