package com.hk.mapper;

import com.hk.pojo.InsuranceCompensation;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InsuranceCompensationMapper {
    public List<InsuranceCompensation> getInsuranceRoles(@Param("insuranceCode") String insurance_code);
}
