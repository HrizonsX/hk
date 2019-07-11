package com.hk.pojo;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

public class Fights implements Serializable {

    private static final long serialVersionUID = 4778668231333925357L;
    //航线编号
    private String alCode;
    //起飞日期
    private Timestamp fightDate;
    //出发城市名
    private String dcityName;
    //到达城市名
    private String tcityName;
    //出发机场名
    private String dairportName;
    //到达机场名
    private String tairportName;
    //实际出发时间
    private Timestamp ATD;
    //实际到达时间
    private Timestamp ATA;
    //预计出发时间
    private Timestamp ETD;
    //预计到达时间
    private Timestamp ETA;
    //飞机型号
    private String aircraftType;
    //航班状态
    private int fightState;
    //航班名
    private String alName;
    //该躺航班的舱位 eager
    private List<FightShipping> fightShippings;

    public List<FightShipping> getFightShippings() {
        return fightShippings;
    }

    public void setFightShippings(List<FightShipping> fightShippings) {
        this.fightShippings = fightShippings;
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

    public String getDcityName() {
        return dcityName;
    }

    public void setDcityName(String dcityName) {
        this.dcityName = dcityName;
    }

    public String getTcityName() {
        return tcityName;
    }

    public void setTcityName(String tcityName) {
        this.tcityName = tcityName;
    }

    public String getDairportName() {
        return dairportName;
    }

    public void setDairportName(String dairportName) {
        this.dairportName = dairportName;
    }

    public String getTairportName() {
        return tairportName;
    }

    public void setTairportName(String tairportName) {
        this.tairportName = tairportName;
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

    public String getAircraftType() {
        return aircraftType;
    }

    public void setAircraftType(String aircraftType) {
        this.aircraftType = aircraftType;
    }

    public int getFightState() {
        return fightState;
    }

    public void setFightState(int fightState) {
        this.fightState = fightState;
    }

    public String getAlName() {
        return alName;
    }

    public void setAlName(String alName) {
        this.alName = alName;
    }

    public String hmDateFormat(Timestamp t){
        return new SimpleDateFormat("HH:mm").format(t);
    }

    public String ymdDateFormat(Timestamp t){
        return new SimpleDateFormat("yyyy-MM-dd").format(t);
    }
    public String ymdhmDateFormat(Timestamp t){
        return new SimpleDateFormat("yyyy-MM-dd HH:mm").format(t);
    }

    @Override
    public String toString() {
        return "Fights{" +
                "alCode='" + alCode + '\'' +
                ", fightDate=" + fightDate +
                ", dcityName='" + dcityName + '\'' +
                ", tcityName='" + tcityName + '\'' +
                ", dairportName='" + dairportName + '\'' +
                ", tairportName='" + tairportName + '\'' +
                ", ATD=" + ATD +
                ", ATA=" + ATA +
                ", ETD=" + ETD +
                ", ETA=" + ETA +
                ", aircraftType='" + aircraftType + '\'' +
                ", fightState=" + fightState +
                ", alName='" + alName + '\'' +
                ", fightShippings=" + fightShippings +
                '}';
    }
}
