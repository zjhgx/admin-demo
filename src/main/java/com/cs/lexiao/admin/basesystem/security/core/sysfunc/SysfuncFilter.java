package com.cs.lexiao.admin.basesystem.security.core.sysfunc;

import java.util.List;

import com.cs.lexiao.admin.mapping.basesystem.security.Sysfunc;

public interface SysfuncFilter {

	/**
	 * 对现有的权限进行过滤
	 * 
	 * @param funcList
	 *            已有的权限列表
	 */
	public void doFilter(List<Sysfunc> funcList);
	
	/**
	 * 获取顺序
	 * 
	 * @return
	 */
	public int getOrder();

}
