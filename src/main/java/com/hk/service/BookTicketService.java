package com.hk.service;

import com.hk.pojo.*;

import java.util.List;

public interface BookTicketService {
    public Book createNewBook(BookParams bookParams, PassengerModel passengerModel);
    public int buyTicketInsurance(List<InsuranceOrder> insuranceOrders);
    //把保险缓存，直接返回所有保险类型
    public List<Insurance> getInsurancesInfo();
}
