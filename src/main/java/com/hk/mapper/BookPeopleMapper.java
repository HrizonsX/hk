package com.hk.mapper;

import com.hk.pojo.BookPeople;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BookPeopleMapper {
    public int addNewUser(BookPeople bookPeople);
    public BookPeople checkUser(@Param("bpCode") String bpCode,@Param("bpPassword") String bpPassword);
    public BookPeople getUserInfo(@Param("bpCode") String bpCode);
    public BookPeople checkBpCode(@Param("bpCode") String bpCode);
}
