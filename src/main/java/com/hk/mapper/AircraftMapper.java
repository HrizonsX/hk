package com.hk.mapper;

import com.hk.pojo.Aircraft;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Repository
public interface AircraftMapper {
    public List<Aircraft> getAllAircrafts();
}
