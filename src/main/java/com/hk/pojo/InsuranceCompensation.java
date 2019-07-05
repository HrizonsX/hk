package com.hk.pojo;

public class InsuranceCompensation {
    //保险赔偿编号
    private String icCode;
    //保险信息编号
    private String insuranceCode;
    //保险赔偿名
    private String icName;
    //保险赔偿价格
    private Double icPrice;
    //保险状态
    private int icState;

    public String getIcCode() {
        return icCode;
    }

    public void setIcCode(String icCode) {
        this.icCode = icCode;
    }

    public String getInsuranceCode() {
        return insuranceCode;
    }

    public void setInsuranceCode(String insuranceCode) {
        this.insuranceCode = insuranceCode;
    }

    public String getIcName() {
        return icName;
    }

    public void setIcName(String icName) {
        this.icName = icName;
    }

    public Double getIcPrice() {
        return icPrice;
    }

    public void setIcPrice(Double icPrice) {
        this.icPrice = icPrice;
    }

    public int getIcState() {
        return icState;
    }

    public void setIcState(int icState) {
        this.icState = icState;
    }
}
