package com.hk.pojo;

import java.util.List;

public class InsuranceParams {
    //订单编号
    private List<InsuranceOrder> insuranceOrders;

    public List<InsuranceOrder> getInsuranceOrders() {
        return insuranceOrders;
    }

    public void setInsuranceOrders(List<InsuranceOrder> insuranceOrders) {
        this.insuranceOrders = insuranceOrders;
    }
}
