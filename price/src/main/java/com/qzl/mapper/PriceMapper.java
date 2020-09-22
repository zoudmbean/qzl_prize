package com.qzl.mapper;

import com.qzl.pojo.Price;
import com.qzl.pojo.PriceExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PriceMapper {
    int countByExample(PriceExample example);

    int deleteByExample(PriceExample example);

    int insert(Price record);

    int insertSelective(Price record);

    List<Price> selectByExample(PriceExample example);

    int updateByExampleSelective(@Param("record") Price record, @Param("example") PriceExample example);

    int updateByExample(@Param("record") Price record, @Param("example") PriceExample example);
}