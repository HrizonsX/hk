package com.hk.service.impl;

import com.hk.mapper.BookPeopleMapper;
import com.hk.pojo.BookPeople;
import com.hk.service.LoginService;
import com.hk.util.UserCacheUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private BookPeopleMapper bookPeopleMapper = null;
    @Autowired
    private UserCacheUtil userCacheUtil = null;

    @Override
    public int checkLoginUser(String bpCode, String bpPassword) {
        BookPeople bookPeople = bookPeopleMapper.checkUser(bpCode, bpPassword);
        if(bookPeople != null){
            //用户存在则加入缓存
            userCacheUtil.cacheUser(bookPeople);
        }
        return bookPeople==null?0:1;
    }
}
