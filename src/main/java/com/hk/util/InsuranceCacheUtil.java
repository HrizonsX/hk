package com.hk.util;

import com.hk.mapper.InsuranceMapper;
import com.hk.pojo.Insurance;
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
public class InsuranceCacheUtil {
    @Autowired
    private RedisTemplate redisTemplate = null;
    @Autowired
    private InsuranceMapper insuranceMapper = null;

    private static final String KEY = "insurances";

    public int initInsurancesCache(){
        List<Insurance> insurances = insuranceMapper.getAllInsurances();
        final Map<String, Insurance> insuranceMap = new HashMap<>();
        for(Insurance i:insurances){
            insuranceMap.put(i.getInsuranceCode(), i);
        }
        redisTemplate.execute(new SessionCallback() {
            @Override
            public Object execute(RedisOperations operations) throws DataAccessException {
                redisTemplate.opsForHash().putAll(KEY, insuranceMap);
                //设置key超时时间 1个小时
                redisTemplate.expire(KEY, 6, TimeUnit.HOURS);
                return null;
            }
        });
        return insuranceMap.size();
    }

    public Map<String, Insurance> isInsurancesCacheExist(){
        return redisTemplate.opsForHash().entries(KEY);
    }

    public List<Insurance> getInsuranceFromCache(String...insuranceCode){
        List<String> keyList = new ArrayList<>();
        for(String s:insuranceCode) {
            keyList.add(s);
        }
        return redisTemplate.opsForHash().multiGet(KEY, keyList);
    }
}
