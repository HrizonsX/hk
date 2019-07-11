package com.hk.pojo;

public class BookBill {
    //订票编号
    private Long bookCode;
    //订票详单编号
    private Long bbCode;
    //乘客编号
    private Long passCode;
    //订票详单价格
    private Double bbPrice;
    //订票详单状态
    private int bbState;
    //1:1
    private Passenger passenger;

    public Passenger getPassenger() {
        return passenger;
    }

    public void setPassenger(Passenger passenger) {
        this.passenger = passenger;
    }

    public Long getBookCode() {
        return bookCode;
    }

    public void setBookCode(Long bookCode) {
        this.bookCode = bookCode;
    }

    public Long getBbCode() {
        return bbCode;
    }

    public void setBbCode(Long bbCode) {
        this.bbCode = bbCode;
    }

    public Long getPassCode() {
        return passCode;
    }

    public void setPassCode(Long passCode) {
        this.passCode = passCode;
    }

    public Double getBbPrice() {
        return bbPrice;
    }

    public void setBbPrice(Double bbPrice) {
        this.bbPrice = bbPrice;
    }

    public int getBbState() {
        return bbState;
    }

    public void setBbState(int bbState) {
        this.bbState = bbState;
    }

    @Override
    public String toString() {
        return "BookBill{" +
                "bookCode=" + bookCode +
                ", bbCode=" + bbCode +
                ", passCode=" + passCode +
                ", bbPrice=" + bbPrice +
                ", bbState=" + bbState +
                ", passenger=" + passenger +
                '}';
    }
}
