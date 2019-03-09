package com.atyou.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.atyou.pojo.ParentCategory;
import com.atyou.pojo.ParentCategoryExample;

public interface ParentCategoryMapper {
    int countByExample(ParentCategoryExample example);

    int deleteByExample(ParentCategoryExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ParentCategory record);

    int insertSelective(ParentCategory record);

    List<ParentCategory> selectByExample(ParentCategoryExample example);

    ParentCategory selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ParentCategory record, @Param("example") ParentCategoryExample example);

    int updateByExample(@Param("record") ParentCategory record, @Param("example") ParentCategoryExample example);

    int updateByPrimaryKeySelective(ParentCategory record);

    int updateByPrimaryKey(ParentCategory record);
}