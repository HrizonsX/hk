package com.hk.pojo;

public class InsuranceOrder {
    //订单编号
    private int bookCode;
    //订单里详单编号
    private int bbCode;
    //保险信息编号
    private String insuranceCode;
    //保险订单状态
    private int insuranceState;

    public int getBookCode() {
        return bookCode;
    }

    public void setBookCode(int bookCode) {
        this.bookCode = bookCode;
    }

    public int getBbCode() {
        return bbCode;
    }

    public void setBbCode(int bbCode) {
        this.bbCode = bbCode;
    }

    public String getInsuranceCode() {
        return insuranceCode;
    }

    public void setInsuranceCode(String insuranceCode) {
        this.insuranceCode = insuranceCode;
    }

    public int getInsuranceState() {
        return insuranceState;
    }

    public void setInsuranceState(int insuranceState) {
        this.insuranceState = insuranceState;
    }

    @Override
    public String toString() {
        return "InsuranceOrder{" +
                "bookCode=" + bookCode +
                ", bbCode=" + bbCode +
                ", insuranceCode='" + insuranceCode + '\'' +
                ", insuranceState=" + insuranceState +
                '}';
    }
}
