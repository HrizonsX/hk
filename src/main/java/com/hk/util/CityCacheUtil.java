package com.hk.util;


import com.hk.mapper.CityMapper;
import com.hk.pojo.City;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.core.RedisOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.SessionCallback;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Component
//hash key='cities'
public class CityCacheUtil {
    @Autowired
    private RedisTemplate redisTemplate = null;
    @Autowired
    private CityMapper cityMapper = null;

    private static final String KEY = "cities";

    public Map<String, City> initCitiesCache(){
        List<City> cities = cityMapper.getAllCities();
        final Map<String, City> citiesMap = new HashMap<>();
        for(City i:cities){
            citiesMap.put(i.getCityCode(), i);
        }
        redisTemplate.execute(new SessionCallback() {
            @Override
            public Object execute(RedisOperations operations) throws DataAccessException {
                redisTemplate.opsForHash().putAll(KEY, citiesMap);
                //设置key超时时间 1天
                redisTemplate.expire(KEY, 1, TimeUnit.DAYS);
                return null;
            }
        });
        return citiesMap;
    }

    public Map<String, City> isCitiesCacheExist(){
        return redisTemplate.opsForHash().entries(KEY);
    }

}
