package com.hk.service.impl;

import com.hk.mapper.AirLineMapper;
import com.hk.mapper.CityMapper;
import com.hk.mapper.FightsMapper;
import com.hk.pojo.AirLine;
import com.hk.pojo.City;
import com.hk.pojo.Fights;
import com.hk.service.SearchTicketService;
import com.hk.util.CityCacheUtil;
import com.hk.util.FightsCacheUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class SearchTicketServiceImpl implements SearchTicketService {

    @Autowired
    private FightsMapper fightsMapper = null;
    @Autowired
    private FightsCacheUtil fightsCacheUtil = null;
    @Autowired
    private AirLineMapper airLineMapper = null;
    @Autowired
    private CityCacheUtil cityCacheUtil = null;

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public List<Fights> getFightsByDateAndDT(Date fightDate, String dcityName, String tcityName) {
        List<Fights> fights = null;
        String key = fightDate.toString() + '-' + dcityName + '-' + tcityName;
        Map<String, Fights> cacheFights = fightsCacheUtil.isFightsCacheExists(key);
        if(cacheFights.size() == 0){
            //缓存无则去数据库里查
            fights = fightsMapper.getFightsByDateAndDT(fightDate, dcityName, tcityName);
            if(fights.size() != 0){
                fightsCacheUtil.cacheFights(key, fights);
            }
        }
        else{
            //有则取缓存
            fights = new ArrayList<>(cacheFights.values());
        }
        return fights;
    }

    /*
        按照航班号和飞行日期查询加缓存
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public List<Fights> getFightsByDateAndAlCode(Date fightDate, String alCode) {
        List<Fights> fights = null;
        String key = fightDate.toString() + '-' + alCode;
        Map<String, Fights> cacheFights = fightsCacheUtil.isFightsCacheExists(key);
        if(cacheFights.size() == 0){
            //数据库查数据
            fights = fightsMapper.getAlFights(alCode, fightDate);
            if(fights.size() != 0){
                fightsCacheUtil.cacheAlFights(key, fights);
            }
        }
        else{
            fights = new ArrayList<>(cacheFights.values());
        }
        return fights;
    }

    @Override
    public int checkAlCode(String alCode) {
        return airLineMapper.getAirLine(alCode)==null?0:1;
    }

    @Override
    public List<City> getAllCities() {
        Map<String, City> citiesMap = cityCacheUtil.isCitiesCacheExist();
        if(citiesMap.size() == 0){
            citiesMap = cityCacheUtil.initCitiesCache();
        }
        return new ArrayList<>(citiesMap.values());
    }
}
