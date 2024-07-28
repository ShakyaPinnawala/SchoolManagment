/*
IT22090294
Chinthana Weligamage
G7SIMS - School Information Management System
 */
package com.g7sims.chinthana;

public class Notice {

    private int noticeID;
    private String noticeTitle;
    private String noticeDate;
    private String noticeContent;
    private String noticeImage;
    private String noticeGroup;

    public Notice(int noticeID) {
        this.noticeID = noticeID;
    }

    public Notice(String noticeTitle, String noticeDate, String noticeContent, String noticeImage, String noticeGroup) {
        this.noticeTitle = noticeTitle;
        this.noticeDate = noticeDate;
        this.noticeContent = noticeContent;
        this.noticeImage = noticeImage;
        this.noticeGroup = noticeGroup;
    }

    public Notice(int noticeID, String noticeTitle, String noticeDate, String noticeContent, String noticeImage, String noticeGroup) {
        this.noticeID = noticeID;
        this.noticeTitle = noticeTitle;
        this.noticeDate = noticeDate;
        this.noticeContent = noticeContent;
        this.noticeImage = noticeImage;
        this.noticeGroup = noticeGroup;
    }

    public int getNoticeID() {
        return noticeID;
    }

    public String getNoticeTitle() {
        return noticeTitle;
    }

    public String getNoticeDate() {
        return noticeDate;
    }

    public String getNoticeContent() {
        return noticeContent;
    }

    public String getNoticeImage() {
        return noticeImage;
    }

    public String getNoticeGroup() {
        return noticeGroup;
    }

    @Override
    public String toString() {
        return "Notice{" + "noticeID=" + noticeID + ", noticeTitle=" + noticeTitle + ", noticeDate=" + noticeDate + ", noticeContent=" + noticeContent + ", noticeImage=" + noticeImage + ", noticeGroup=" + noticeGroup + '}';
    }
}
