package com.hk.mapper;

import com.hk.pojo.Book;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookMapper {
    //添加订单，主键会回填
    public int addBookDetail(Book book);
    //获得该订单及其详单
    public Book getBookByCode(Long bookCode);
    //支付完修改订单状态和保险单状态
    public int updateBookState(Long bookCode);
    //查询某一用户的所有订单
    public List<Book> getBooksByBpCode(@Param("bpCode") String bpCode);
}
