package com.g7sims.pabasara;

public class ExamUnit {

    //properties
    private String sid;
    private final String oop;
    private final String se;
    private final String dms;
    private final String cn;
    private final String ossa;
    private final String credits;
    private final String gpa;

    //method overloading
    public ExamUnit(String sid, String oop, String se, String dms, String cn, String ossa, String credits, String gpa) {

        this.sid = sid;
        this.oop = oop;
        this.se = se;
        this.dms = dms;
        this.cn = cn;
        this.ossa = ossa;
        this.credits = credits;
        this.gpa = gpa;
    }

    //method overloading
    public ExamUnit(String oop, String se, String dms, String cn, String ossa, String credits, String gpa) {
        this.oop = oop;
        this.se = se;
        this.dms = dms;
        this.cn = cn;
        this.ossa = ossa;
        this.credits = credits;
        this.gpa = gpa;
    }

    //get methods to return properties
    public String getSid() {
        return sid;
    }

    public String getOop() {
        return oop;
    }

    public String getSe() {
        return se;
    }

    public String getDms() {
        return dms;
    }

    public String getCn() {
        return cn;
    }

    public String getOssa() {
        return ossa;
    }

    public String getCredits() {
        return credits;
    }

    public String getGpa() {
        return gpa;
    }

}
