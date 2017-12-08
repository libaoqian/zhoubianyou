package com.zhoubianyou.security.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.zhoubianyou.user.dao.SysRoleMapper;
import com.zhoubianyou.user.dao.SysUserMapper;
import com.zhoubianyou.user.entity.SysRole;
import com.zhoubianyou.user.entity.SysUser;
import com.zhoubianyou.user.service.SysUserService;

@Service
public class SysUserDetailsService implements UserDetailsService{

	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysRoleMapper roleMapper;
	@Autowired
	private SysUserMapper sysUserMapper;
	@Override
	public UserDetails loadUserByUsername(String username)
			{
		SysUser user = sysUserMapper.selectByUserName(username);
		if(user==null){
			throw new UsernameNotFoundException("未找到该用户");
		}
		Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		List<SysRole> roleList = roleMapper.findRolesByUser(user.getId());
		for(SysRole role:roleList){
			authorities.add(new SimpleGrantedAuthority("ROLE_"+role.getId()));
		}
		UserDetails detail = new User
				(username,user.getPassword(),true, true, true, true, authorities);
		return detail;
	}

}
