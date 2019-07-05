package com.hk.mapper;

import com.hk.pojo.Airport;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AirportMapper {
    public List<Airport> getAllAirports();
}
