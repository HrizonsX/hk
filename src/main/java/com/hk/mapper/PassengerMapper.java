package com.hk.mapper;

import com.hk.pojo.Passenger;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PassengerMapper {
    public int addPassenger(Passenger passenger);
    public Passenger findPassengerByPassCode(@Param("passCode") Long passCode);
}
