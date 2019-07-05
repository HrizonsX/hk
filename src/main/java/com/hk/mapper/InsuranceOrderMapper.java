package com.hk.mapper;

import com.hk.pojo.InsuranceOrder;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InsuranceOrderMapper {
    public int addInsuranceOrder(InsuranceOrder insuranceOrder);
    public List<InsuranceOrder> getInsuranceOrder(@Param("bookCode") int bookCode, @Param("bbCode") int bbCode);
    //支付成功后改状态
    public int updateInsuranceState(@Param("bookCode") int bookCode, @Param("bbCode") int bbCode);
}
