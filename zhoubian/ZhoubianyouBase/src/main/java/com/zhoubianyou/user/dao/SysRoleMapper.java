package com.zhoubianyou.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhoubianyou.user.entity.SysRole;

public interface SysRoleMapper {
    int deleteByPrimaryKey(String id);

    int insert(SysRole record);

    int insertSelective(SysRole record);

    SysRole selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysRole record);

    int updateByPrimaryKey(SysRole record);
    
    List<SysRole> findRolesByUser(@Param("userId") String userId);
}