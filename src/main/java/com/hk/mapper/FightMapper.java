package com.hk.mapper;

import com.hk.pojo.Fight;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

@Repository
public interface FightMapper {
    public int decreaseBcsqNumber(@Param("alCode") String alCode, @Param("fightDate") Timestamp fightDate, @Param("bcVersion") int bcVersion);
    public int decreaseEcsqNumber(@Param("alCode") String alCode, @Param("fightDate") Timestamp fightDate, @Param("ecVersion") int ecVersion);
    public int decreaseFcsqNumber(@Param("alCode") String alCode, @Param("fightDate") Timestamp fightDate, @Param("fcVersion") int fcVersion);
    public Fight getFight(@Param("alCode") String alCode, @Param("fightDate") Timestamp fightDate);
    public int addFight(Fight fight);
    public int updateFight(Fight fight);
    public List<Fight> getAllFights();
}
