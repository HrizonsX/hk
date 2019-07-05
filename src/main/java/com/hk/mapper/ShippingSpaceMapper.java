package com.hk.mapper;

import com.hk.pojo.FightShipping;
import com.hk.pojo.ShippingSpace;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

@Repository
public interface ShippingSpaceMapper {
    public ShippingSpace getshippingSpace(@Param("alCode") String alCode, @Param("fightDate") Timestamp fightDate, @Param("ssCode") String ssCode);
    public int addShippingSpace(ShippingSpace fightShipping);
    public int updateShippingSpace(ShippingSpace fightShipping);
    public List<ShippingSpace> getShippingSpacesOfFight(@Param("alCode") String alCode, @Param("fightDate") Timestamp fightDate);
}
