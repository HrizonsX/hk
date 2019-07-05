package com.hk.pojo;

public class PassengerParams {
    //乘客类型编号
    private String ptCode;
    //乘客名字
    private String passName;
    //乘客身份证
    private String passID;
    //联系电话
    private String passPhone;
    //单个乘客票价
    private Double passPrice;

    public Double getPassPrice() {
        return passPrice;
    }

    public void setPassPrice(Double passPrice) {
        this.passPrice = passPrice;
    }

    public String getPtCode() {
        return ptCode;
    }

    public void setPtCode(String ptCode) {
        this.ptCode = ptCode;
    }

    public String getPassName() {
        return passName;
    }

    public void setPassName(String passName) {
        this.passName = passName;
    }

    public String getPassID() {
        return passID;
    }

    public void setPassID(String passID) {
        this.passID = passID;
    }

    public String getPassPhone() {
        return passPhone;
    }

    public void setPassPhone(String passPhone) {
        this.passPhone = passPhone;
    }

    @Override
    public String toString() {
        return "PassengerParams{" +
                "ptCode='" + ptCode + '\'' +
                ", passName='" + passName + '\'' +
                ", passID='" + passID + '\'' +
                ", passPhone='" + passPhone + '\'' +
                ", passPrice=" + passPrice +
                '}';
    }
}
