package com.hk.pojo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public class Book {
    //订票编号
    private Long bookCode;
    //航线编号
    private String alCode;
    //航班日期
    private Timestamp fightDate;
    //舱位等_航线编号
    private String shiAlCode;
    //舱位等_航班日期
    private Timestamp shiFightDate;
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
    //订票状态
    private int bookState;
    //订单创建时间
    private Timestamp bookDate;

    private ShippingSpace shippingSpace;
    private List<BookBill> bookBills;


    public Timestamp getBookDate() {
        return bookDate;
    }

    public void setBookDate(Timestamp bookDate) {
        this.bookDate = bookDate;
    }

    public List<BookBill> getBookBills() {
        return bookBills;
    }

    public void setBookBills(List<BookBill> bookBills) {
        this.bookBills = bookBills;
    }

    public ShippingSpace getShippingSpace() {
        return shippingSpace;
    }

    public void setShippingSpace(ShippingSpace shippingSpace) {
        this.shippingSpace = shippingSpace;
    }

    public Long getBookCode() {
        return bookCode;
    }

    public void setBookCode(Long bookCode) {
        this.bookCode = bookCode;
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

    public String getShiAlCode() {
        return shiAlCode;
    }

    public void setShiAlCode(String shiAlCode) {
        this.shiAlCode = shiAlCode;
    }

    public Timestamp getShiFightDate() {
        return shiFightDate;
    }

    public void setShiFightDate(Timestamp shiFightDate) {
        this.shiFightDate = shiFightDate;
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

    public int getBookState() {
        return bookState;
    }

    public void setBookState(int bookState) {
        this.bookState = bookState;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookCode=" + bookCode +
                ", alCode='" + alCode + '\'' +
                ", fightDate=" + fightDate +
                ", shiAlCode='" + shiAlCode + '\'' +
                ", shiFightDate=" + shiFightDate +
                ", ssCode='" + ssCode + '\'' +
                ", bpCode='" + bpCode + '\'' +
                ", bookNumber=" + bookNumber +
                ", bookTotal=" + bookTotal +
                ", bookState=" + bookState +
                ", bookDate=" + bookDate +
                ", shippingSpace=" + shippingSpace +
                ", bookBills=" + bookBills +
                '}';
    }
}
