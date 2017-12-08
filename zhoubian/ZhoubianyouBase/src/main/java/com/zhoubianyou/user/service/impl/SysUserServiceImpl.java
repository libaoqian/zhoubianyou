package com.zhoubianyou.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhoubianyou.user.dao.SysRoleMapper;
import com.zhoubianyou.user.entity.SysRole;
import com.zhoubianyou.user.service.SysUserService;

@Service
public class SysUserServiceImpl implements SysUserService{

	@Autowired
	private SysRoleMapper sysRoleMapper;
	
	public List<SysRole> getRoleList(String userId) {
		return sysRoleMapper.findRolesByUser(userId);
	}
	

}
