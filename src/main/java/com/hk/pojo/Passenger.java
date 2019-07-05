package com.hk.pojo;

import java.io.Serializable;

public class Passenger implements Serializable {

    private static final long serialVersionUID = 3597270310406063917L;
    //乘客编号
    private Long passCode;
    //乘客类型编号
    private String ptCode;
    //乘客名字
    private String passName;
    //乘客身份证
    private String passID;
    //联系电话
    private String passPhone;
    //备注
    private String passRemark;
    //乘客状态
    private int passState;

    public Long getPassCode() {
        return passCode;
    }

    public void setPassCode(Long passCode) {
        this.passCode = passCode;
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

    public String getPassRemark() {
        return passRemark;
    }

    public void setPassRemark(String passRemark) {
        this.passRemark = passRemark;
    }

    public int getPassState() {
        return passState;
    }

    public void setPassState(int passState) {
        this.passState = passState;
    }
}
