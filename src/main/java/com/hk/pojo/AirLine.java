package com.hk.pojo;

import java.sql.Time;

public class AirLine {

    //航线编号
    private String alCode;
    //航线名
    private String alName;
    //出发机场编号
    private String daNumber;
    //终点机场编号
    private String taNumber;
    //航线状态
    private int alState;

    public String getAlCode() {
        return alCode;
    }

    public void setAlCode(String alCode) {
        this.alCode = alCode;
    }

    public String getAlName() {
        return alName;
    }

    public void setAlName(String alName) {
        this.alName = alName;
    }

    public String getDaNumber() {
        return daNumber;
    }

    public void setDaNumber(String daNumber) {
        this.daNumber = daNumber;
    }

    public String getTaNumber() {
        return taNumber;
    }

    public void setTaNumber(String taNumber) {
        this.taNumber = taNumber;
    }

    public int getAlState() {
        return alState;
    }

    public void setAlState(int alState) {
        this.alState = alState;
    }
}
