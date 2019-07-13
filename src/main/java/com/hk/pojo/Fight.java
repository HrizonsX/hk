package com.hk.pojo;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Fight implements Serializable {

    private static final long serialVersionUID = 8997149245828532043L;
    //航线编号
    private String alCode;
    //航班日期
    private Timestamp fightDate;
    //飞行编号
    private String aircraftCode;
    //商务舱剩余数量
    private int bcspNumber;
    //经济舱剩余数量
    private int ecsqNumber;
    //头等舱剩余数量
    private int fcsqNumber;
    //航班状态
    private int fightState;
    //实际出发时间
    private Timestamp ATD;
    //实际到达时间
    private Timestamp ATA;
    //预计出发时间
    private Timestamp ETD;
    //预计到达时间
    private Timestamp ETA;

    private int bcVersion;
    private int fcVersion;
    private int ecVersion;

    public Timestamp getETD() {
        return ETD;
    }

    public void setETD(Timestamp ETD) {
        this.ETD = ETD;
    }

    public Timestamp getETA() {
        return ETA;
    }

    public void setETA(Timestamp ETA) {
        this.ETA = ETA;
    }

    public int getBcVersion() {
        return bcVersion;
    }

    public void setBcVersion(int bcVersion) {
        this.bcVersion = bcVersion;
    }

    public int getFcVersion() {
        return fcVersion;
    }

    public void setFcVersion(int fcVersion) {
        this.fcVersion = fcVersion;
    }

    public int getEcVersion() {
        return ecVersion;
    }

    public void setEcVersion(int ecVersion) {
        this.ecVersion = ecVersion;
    }

    public String getAlCode() {
        return alCode;
    }

    public void setAlCode(String alCode) {
        this.alCode = alCode;
    }

    public Timestamp getFightDate() {
        return fightDate;
    }

    public void setFightDate(Timestamp fightDate) {
        this.fightDate = fightDate;
    }

    public String getAircraftCode() {
        return aircraftCode;
    }

    public void setAircraftCode(String aircraftCode) {
        this.aircraftCode = aircraftCode;
    }

    public int getBcspNumber() {
        return bcspNumber;
    }

    public void setBcspNumber(int bcspNumber) {
        this.bcspNumber = bcspNumber;
    }

    public int getEcsqNumber() {
        return ecsqNumber;
    }

    public void setEcsqNumber(int ecsqNumber) {
        this.ecsqNumber = ecsqNumber;
    }

    public int getFcsqNumber() {
        return fcsqNumber;
    }

    public void setFcsqNumber(int fcsqNumber) {
        this.fcsqNumber = fcsqNumber;
    }

    public int getFightState() {
        return fightState;
    }

    public void setFightState(int fightState) {
        this.fightState = fightState;
    }

    public Timestamp getATD() {
        return ATD;
    }

    public void setATD(Timestamp ATD) {
        this.ATD = ATD;
    }

    public Timestamp getATA() {
        return ATA;
    }

    public void setATA(Timestamp ATA) {
        this.ATA = ATA;
    }

    public String ymdhmsDateFormat(Timestamp t){
        if(t == null){
            return null;
        }
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(t);
    }

    @Override
    public String toString() {
        return "Fight{" +
                "alCode='" + alCode + '\'' +
                ", fightDate=" + fightDate +
                ", aircraftCode='" + aircraftCode + '\'' +
                ", bcspNumber=" + bcspNumber +
                ", ecsqNumber=" + ecsqNumber +
                ", fcsqNumber=" + fcsqNumber +
                ", fightState=" + fightState +
                ", ATD=" + ATD +
                ", ATA=" + ATA +
                ", ETD=" + ETD +
                ", ETA=" + ETA +
                ", bcVersion=" + bcVersion +
                ", fcVersion=" + fcVersion +
                ", ecVersion=" + ecVersion +
                '}';
    }
}
