package com.hk.pojo;

import java.sql.Date;

public class Aircraft {
    private String aircraftCode;
    private String aircraftType;
    private Date buyTime;
    private Date serviceTime;
    private int aircraftState;

    public String getAircraftCode() {
        return aircraftCode;
    }

    public void setAircraftCode(String aircraftCode) {
        this.aircraftCode = aircraftCode;
    }

    public String getAircraftType() {
        return aircraftType;
    }

    public void setAircraftType(String aircraftType) {
        this.aircraftType = aircraftType;
    }

    public Date getBuyTime() {
        return buyTime;
    }

    public void setBuyTime(Date buyTime) {
        this.buyTime = buyTime;
    }

    public Date getServiceTime() {
        return serviceTime;
    }

    public void setServiceTime(Date serviceTime) {
        this.serviceTime = serviceTime;
    }

    public int getAircraftState() {
        return aircraftState;
    }

    public void setAircraftState(int aircraftState) {
        this.aircraftState = aircraftState;
    }

    @Override
    public String toString() {
        return "Aircraft{" +
                "aircraftCode='" + aircraftCode + '\'' +
                ", aircraftType='" + aircraftType + '\'' +
                ", buyTime=" + buyTime +
                ", serviceTime=" + serviceTime +
                ", aircraftState=" + aircraftState +
                '}';
    }
}
