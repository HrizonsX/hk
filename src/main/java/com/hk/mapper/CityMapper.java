package com.hk.mapper;

import com.hk.pojo.City;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CityMapper {
    public List<City> getAllCities();
}
