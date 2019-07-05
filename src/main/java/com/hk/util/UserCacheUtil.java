package com.hk.util;

import com.hk.pojo.BookPeople;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Component
//hash key='users'
public class UserCacheUtil {
    @Autowired
    private RedisTemplate redisTemplate = null;
    private static final String KEY = "users";

    public int cacheUser(BookPeople bookPeople){
        redisTemplate.opsForHash().put(KEY, bookPeople.getBpCode(), bookPeople);
        if(redisTemplate.opsForHash().size(KEY) == 1){
            redisTemplate.expire(KEY, 10, TimeUnit.MINUTES);
        }
        return 1;
    }

    public List<BookPeople> getUserInfo(String...bpCode){
        List<String> keyList = new ArrayList<>();
        for(String s:bpCode) {
            keyList.add(s);
        }
        return redisTemplate.opsForHash().multiGet(KEY, keyList);
    }

    public Boolean isUserCacheExist(String bpCode){
        return redisTemplate.opsForHash().hasKey(KEY, bpCode);
    }
}
