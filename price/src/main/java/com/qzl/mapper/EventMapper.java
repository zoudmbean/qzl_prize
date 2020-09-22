package com.qzl.mapper;

import com.qzl.pojo.Event;
import com.qzl.pojo.EventExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EventMapper {
    int countByExample(EventExample example);

    int deleteByExample(EventExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Event record);

    int insertSelective(Event record);

    List<Event> selectByExample(EventExample example);

    Event selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Event record, @Param("example") EventExample example);

    int updateByExample(@Param("record") Event record, @Param("example") EventExample example);

    int updateByPrimaryKeySelective(Event record);

    int updateByPrimaryKey(Event record);
}