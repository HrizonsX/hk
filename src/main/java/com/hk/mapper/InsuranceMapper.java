package com.hk.mapper;

import com.hk.pojo.Insurance;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InsuranceMapper {
    public Insurance getInsuranceInfo(@Param("insuranceCode") String insurance_code);
    public List<Insurance> getAllInsurances();
}
