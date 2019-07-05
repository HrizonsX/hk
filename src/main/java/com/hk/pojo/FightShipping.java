package com.hk.pojo;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

public class FightShipping implements Serializable {

    private static final long serialVersionUID = 465692565484660909L;
    //航线编号
    private String alCode;
    //航班日期
    private Timestamp fightDate;
    //舱位等级编号
    private String ssCode;
    //舱位等级名
    private String ssName;
    //商务舱剩余数量
    private int bcsqNumber;
    //经济舱剩余数量
    private int ecsqNumber;
    //头等舱剩余数量
    private int fcsqNumber;
    //餐食内容
    private String ssMeal;
    //是否能退票
    private Boolean ssReturnTicket;
    //是否能改签
    private Boolean ssChangeTicket;
    //舱位价格
    private Double ssPrice;

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

    public String getSsCode() {
        return ssCode;
    }

    public void setSsCode(String ssCode) {
        this.ssCode = ssCode;
    }

    public String getSsName() {
        return ssName;
    }

    public void setSsName(String ssName) {
        this.ssName = ssName;
    }

    public int getBcsqNumber() {
        return bcsqNumber;
    }

    public void setBcsqNumber(int bcsqNumber) {
        this.bcsqNumber = bcsqNumber;
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

    public String getSsMeal() {
        return ssMeal;
    }

    public void setSsMeal(String ssMeal) {
        this.ssMeal = ssMeal;
    }

    public Boolean getSsReturnTicket() {
        return ssReturnTicket;
    }

    public void setSsReturnTicket(Boolean ssReturnTicket) {
        this.ssReturnTicket = ssReturnTicket;
    }

    public Boolean getSsChangeTicket() {
        return ssChangeTicket;
    }

    public void setSsChangeTicket(Boolean ssChangeTicket) {
        this.ssChangeTicket = ssChangeTicket;
    }

    public Double getSsPrice() {
        return ssPrice;
    }

    public void setSsPrice(Double ssPrice) {
        this.ssPrice = ssPrice;
    }

    @Override
    public String toString() {
        return "FightShipping{" +
                "alCode='" + alCode + '\'' +
                ", fightDate=" + fightDate +
                ", ssCode='" + ssCode + '\'' +
                ", ssName='" + ssName + '\'' +
                ", bcsqNumber=" + bcsqNumber +
                ", ecsqNumber=" + ecsqNumber +
                ", fcsqNumber=" + fcsqNumber +
                ", ssMeal='" + ssMeal + '\'' +
                ", ssReturnTicket=" + ssReturnTicket +
                ", ssChangeTicket=" + ssChangeTicket +
                ", ssPrice=" + ssPrice +
                '}';
    }
}
