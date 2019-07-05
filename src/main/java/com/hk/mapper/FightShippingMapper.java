package com.hk.mapper;

import com.hk.pojo.FightShipping;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

@Repository
public interface FightShippingMapper {
    public List<FightShipping> getFightAllShippings(@Param("fightDate") Timestamp fightDate, @Param("alCode") String alCode);
}
