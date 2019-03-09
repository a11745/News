package com.atyou.dao;


import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.atyou.pojo.Comment;
import com.atyou.pojo.CommentExample;
import com.atyou.pojo.CommentResult;
import com.atyou.query.CommentQueryObject;

public interface CommentMapper {
    int countByExample(CommentExample example);

    int deleteByExample(CommentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Comment record);

    int insertSelective(Comment record);

    List<Comment> selectByExampleWithBLOBs(CommentExample example);

    List<Comment> selectByExample(CommentExample example);
    List<CommentResult> queryCommUser(Integer detailId);
    List<CommentResult> queryCommUserNoDetail(Integer userId);
    
    Comment selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Comment record, @Param("example") CommentExample example);

    int updateByExampleWithBLOBs(@Param("record") Comment record, @Param("example") CommentExample example);

    int updateByExample(@Param("record") Comment record, @Param("example") CommentExample example);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKeyWithBLOBs(Comment record);

    int updateByPrimaryKey(Comment record);
    
    /**
     * 高级查询总数
     * @param qo
     * @return
     */
	int queryForCount(CommentQueryObject qo);
	/**
	 * 查询当前页数据
	 * @param qo
	 * @return
	 */
	List<Comment> query(CommentQueryObject qo);
}