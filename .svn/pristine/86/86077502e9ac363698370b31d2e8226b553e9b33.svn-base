package com.atyou.dao;


import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.atyou.pojo.Detail;
import com.atyou.pojo.DetailExample;

public interface DetailMapper {
    int countByExample(DetailExample example);

    int deleteByExample(DetailExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Detail record);

    int insertSelective(Detail record);

    List<Detail> selectByExampleWithBLOBs(DetailExample example);

    List<Detail> selectByExample(DetailExample example);

    Detail selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Detail record, @Param("example") DetailExample example);

    int updateByExampleWithBLOBs(@Param("record") Detail record, @Param("example") DetailExample example);

    int updateByExample(@Param("record") Detail record, @Param("example") DetailExample example);

    int updateByPrimaryKeySelective(Detail record);

    int updateByPrimaryKeyWithBLOBs(Detail record);

    int updateByPrimaryKey(Detail record);

	List<Detail> searchByTitle(@Param("title")String title);


}