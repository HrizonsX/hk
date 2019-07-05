package com.hk.util;

import com.hk.pojo.Fights;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.SessionCallback;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Component
public class FightsCacheUtil {

    @Autowired
    private RedisTemplate redisTemplate = null;

    //返回key的hash所有键。可以用来判断是否存在和返回缓存内容
    public Map<String, Fights> isFightsCacheExists(String key){
        return redisTemplate.opsForHash().entries(key);
    }

    public int cacheFights(final String key, List<Fights> fights){

        final Map<String, Fights> fightsMap = new HashMap<>();
        for(int i = 0; i < fights.size(); i++){
            fightsMap.put(fights.get(i).getAlCode(), fights.get(i));
        }
        redisTemplate.execute(new SessionCallback() {
            @Override
            public Object execute(RedisOperations operations) throws DataAccessException {
                redisTemplate.opsForHash().putAll(key, fightsMap);
                //设置key超时时间 1个小时
                redisTemplate.expire(key, 1, TimeUnit.HOURS);
                return null;
            }
        });
        //TODO: 关闭连接
        return fightsMap.size();
    }

    //订票后触发对修改的fights二次缓存
    public int cacheSingleFights(String key, Fights fights){
        //全部fights缓存不存在，则退出
        Map<String, Fights> fightsMap = isFightsCacheExists(key);
        if(fightsMap.size() == 0){
            return 0;
        }
        else{
            //存在则修改相应的key里的 '机型'的value缓存
            redisTemplate.opsForHash().put(key, fights.getAlCode(), fights);
            return 1;
        }
    }

    //数据库设计有问题，缓存仍是hash式
    public int cacheAlFights(final String key, List<Fights> fights){
        final Map<String, Fights> fightsMap = new HashMap<>();
        for(int i = 0; i < fights.size(); i++){
            fightsMap.put(fights.get(i).getAlName(), fights.get(i));
        }
        redisTemplate.execute(new SessionCallback() {
            @Override
            public Object execute(RedisOperations operations) throws DataAccessException {
                redisTemplate.opsForHash().putAll(key, fightsMap);
                //设置key超时时间 10分钟
                redisTemplate.expire(key, 10, TimeUnit.MINUTES);
                return null;
            }
        });
        return fightsMap.size();
    }

}
