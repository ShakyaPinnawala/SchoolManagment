/*
IT22090294
Chinthana Weligamage
G7SIMS - School Information Management System
 */
package com.g7sims.chinthana;

public class User {

    private int UserID;
    private String Username;
    private String Password;

    public User(String Username, String Password) {
        this.Username = Username;
        this.Password = Password;
    }

    public User(int UserID, String Username, String Password) {
        this.UserID = UserID;
        this.Username = Username;
        this.Password = Password;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    @Override
    public String toString() {
        return "User{" + "UserID=" + UserID + ", Username=" + Username + ", Password=" + Password + "}";
    }

}
