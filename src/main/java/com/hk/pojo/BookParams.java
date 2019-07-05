package com.hk.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public class BookParams {
    //航线编号
    private String alCode;
    //航班日期 json格式问题
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",  timezone="GMT+8")
    private Timestamp fightDate;
    //舱位等级编号
    private String ssCode;
//    //优惠券号
//    private String couponCode;
    //用户编号
    private String bpCode;
    //订票数量
    private int bookNumber;
    //订票总价
    private Double bookTotal;
    //json实现需要 第二种
    private List<PassengerParams> passengerParams;

    public List<PassengerParams> getPassengerParams() {
        return passengerParams;
    }

    public void setPassengerParams(List<PassengerParams> passengerParams) {
        this.passengerParams = passengerParams;
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

    public String getSsCode() {
        return ssCode;
    }

    public void setSsCode(String ssCode) {
        this.ssCode = ssCode;
    }

//    public String getCouponCode() {
//        return couponCode;
//    }
//
//    public void setCouponCode(String couponCode) {
//        this.couponCode = couponCode;
//    }

    public String getBpCode() {
        return bpCode;
    }

    public void setBpCode(String bpCode) {
        this.bpCode = bpCode;
    }

    public int getBookNumber() {
        return bookNumber;
    }

    public void setBookNumber(int bookNumber) {
        this.bookNumber = bookNumber;
    }

    public Double getBookTotal() {
        return bookTotal;
    }

    public void setBookTotal(Double bookTotal) {
        this.bookTotal = bookTotal;
    }

    @Override
    public String toString() {
        return "BookParams{" +
                "alCode='" + alCode + '\'' +
                ", fightDate=" + fightDate +
                ", ssCode='" + ssCode + '\'' +
                ", bpCode='" + bpCode + '\'' +
                ", bookNumber=" + bookNumber +
                ", bookTotal=" + bookTotal +
                ", passengerParams=" + passengerParams +
                '}';
    }
}
