package com.hk.mapper;

import com.hk.pojo.AirLine;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AirLineMapper {
    public int addAirLine(AirLine airLine);
    public int updateAirLine(AirLine airLine);
    public AirLine getAirLine(@Param("alCode") String alCode);
    public List<AirLine> getAllAirLine();
}
