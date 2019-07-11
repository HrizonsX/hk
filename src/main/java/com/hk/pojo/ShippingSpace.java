package com.hk.pojo;

import java.sql.Date;
import java.sql.Timestamp;

public class ShippingSpace {
    //航线编号
    private String alCode;
    //航班日期
    private Timestamp fightDate;
    //舱位等级编号
    private String ssCode;
    //舱位等级名
    private String ssName;
    //餐食
    private String ssMeal;
    //是否可退票
    private int ssReturnTicket;
    //是否可改签
    private int ssChangeTicket;
    //舱位价格
    private Double ssPrice;
    //舱位备注
    private String ssRemark;

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

    public String getSsMeal() {
        return ssMeal;
    }

    public void setSsMeal(String ssMeal) {
        this.ssMeal = ssMeal;
    }

    public int getSsReturnTicket() {
        return ssReturnTicket;
    }

    public void setSsReturnTicket(int ssReturnTicket) {
        this.ssReturnTicket = ssReturnTicket;
    }

    public int getSsChangeTicket() {
        return ssChangeTicket;
    }

    public void setSsChangeTicket(int ssChangeTicket) {
        this.ssChangeTicket = ssChangeTicket;
    }

    public Double getSsPrice() {
        return ssPrice;
    }

    public void setSsPrice(Double ssPrice) {
        this.ssPrice = ssPrice;
    }

    public String getSsRemark() {
        return ssRemark;
    }

    public void setSsRemark(String ssRemark) {
        this.ssRemark = ssRemark;
    }

    @Override
    public String toString() {
        return "ShippingSpace{" +
                "alCode='" + alCode + '\'' +
                ", fightDate=" + fightDate +
                ", ssCode='" + ssCode + '\'' +
                ", ssName='" + ssName + '\'' +
                ", ssMeal='" + ssMeal + '\'' +
                ", ssReturnTicket=" + ssReturnTicket +
                ", ssChangeTicket=" + ssChangeTicket +
                ", ssPrice=" + ssPrice +
                ", ssRemark='" + ssRemark + '\'' +
                '}';
    }
}
