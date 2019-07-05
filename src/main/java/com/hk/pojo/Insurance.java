package com.hk.pojo;

import java.util.List;

public class Insurance {
    //保险信息编号
    private String insuranceCode;
    //保险信息名
    private String insuranceName;
    //保险描述
    private String insuranceDescribe;
    //保险价格
    private Double insurancePrice;
    //保险备注
    private String insuranceRemark;
    private List<InsuranceCompensation> insuranceRoles;

    public List<InsuranceCompensation> getInsuranceRoles() {
        return insuranceRoles;
    }

    public void setInsuranceRoles(List<InsuranceCompensation> insuranceRoles) {
        this.insuranceRoles = insuranceRoles;
    }

    public String getInsuranceCode() {
        return insuranceCode;
    }

    public void setInsuranceCode(String insuranceCode) {
        this.insuranceCode = insuranceCode;
    }

    public String getInsuranceName() {
        return insuranceName;
    }

    public void setInsuranceName(String insuranceName) {
        this.insuranceName = insuranceName;
    }

    public String getInsuranceDescribe() {
        return insuranceDescribe;
    }

    public void setInsuranceDescribe(String insuranceDescribe) {
        this.insuranceDescribe = insuranceDescribe;
    }

    public Double getInsurancePrice() {
        return insurancePrice;
    }

    public void setInsurancePrice(Double insurancePrice) {
        this.insurancePrice = insurancePrice;
    }

    public String getInsuranceRemark() {
        return insuranceRemark;
    }

    public void setInsuranceRemark(String insuranceRemark) {
        this.insuranceRemark = insuranceRemark;
    }

    @Override
    public String toString() {
        return "Insurance{" +
                "insuranceCode='" + insuranceCode + '\'' +
                ", insuranceName='" + insuranceName + '\'' +
                ", insuranceDescribe='" + insuranceDescribe + '\'' +
                ", insurancePrice=" + insurancePrice +
                ", insuranceRemark='" + insuranceRemark + '\'' +
                ", insuranceRoles=" + insuranceRoles +
                '}';
    }
}
