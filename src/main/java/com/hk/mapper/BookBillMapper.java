package com.hk.mapper;

import com.hk.pojo.BookBill;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookBillMapper {
    //获取详单
    public List<BookBill> getBookBillsByCode(Long bookCode);
    //增加详单
    public int addBookBill(BookBill bookBill);
    //支付完改状态
    public int updateBookBillState(@Param("bookCode") Long bookCode,@Param("bbCode") Long bbCode);
}
