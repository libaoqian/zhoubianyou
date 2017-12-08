package com.zhoubianyou.user.service;

import java.util.List;

import com.zhoubianyou.user.entity.SysRole;

public interface SysUserService {
	
	public List<SysRole> getRoleList(String userName);

}
