package com.hk.service.impl;

import com.hk.mapper.BookPeopleMapper;
import com.hk.pojo.BookPeople;
import com.hk.service.RegisterService;
import com.hk.util.UserCacheUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    private BookPeopleMapper bookPeopleMapper = null;
    @Autowired
    private UserCacheUtil userCacheUtil = null;

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public int registerNewUser(BookPeople bookPeople) {
        int searchResult = checkBpCode(bookPeople.getBpCode());
        if(searchResult != 0){
            //重复用户名，失败
            return 0;
        }
        else{
            //注册成功，插入表
//            System.out.println(bookPeople.getBpPassword());
            return bookPeopleMapper.addNewUser(bookPeople);
        }
    }

    @Override
    public int checkBpCode(String bpCode) {
        Boolean result = userCacheUtil.isUserCacheExist(bpCode);
        if(result == true){
            //缓存中存在，则不需要再去数据库里查
            return result?1:0;
        }
        else{
            return bookPeopleMapper.checkBpCode(bpCode)==null?0:1;
        }
    }
}
