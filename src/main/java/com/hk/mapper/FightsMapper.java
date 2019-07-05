package com.hk.mapper;

import com.hk.pojo.Fights;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

@Repository
public interface FightsMapper {
    //返回所有的当天航班
    public List<Fights> getFightsByDateAndDT(@Param("fightDate") Date fightDate, @Param("dcityName") String dcityName,
                                             @Param("tcityName") String tcityName);
    //根据飞行时间和航线编号获得唯一一趟航班 redis用
    public Fights getSingleFights(@Param("alCode") String alCode, @Param("fightDate") Timestamp fightDate);
    public List<Fights> getAlFights(@Param("alCode") String alCode, @Param("fightDate") Date fightDate);
}
