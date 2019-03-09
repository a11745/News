package com.atyou.dao;


import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.atyou.pojo.Userlog;
import com.atyou.pojo.UserlogExample;

public interface UserlogMapper {
    int countByExample(UserlogExample example);

    int deleteByExample(UserlogExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Userlog record);

    int insertSelective(Userlog record);

    List<Userlog> selectByExample(UserlogExample example);

    Userlog selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Userlog record, @Param("example") UserlogExample example);

    int updateByExample(@Param("record") Userlog record, @Param("example") UserlogExample example);

    int updateByPrimaryKeySelective(Userlog record);

    int updateByPrimaryKey(Userlog record);
}