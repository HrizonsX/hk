package com.hk.mapper;

import com.hk.pojo.Passenger;
import org.springframework.stereotype.Repository;

@Repository
public interface PassengerMapper {
    public int addPassenger(Passenger passenger);
    public Passenger findPassengerByPassCode(Long passCode);
}
