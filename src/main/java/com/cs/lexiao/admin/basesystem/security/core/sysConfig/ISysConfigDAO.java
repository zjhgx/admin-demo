package com.cs.lexiao.admin.basesystem.security.core.sysConfig;


import com.cs.lexiao.admin.framework.base.IBaseDAO;
import com.cs.lexiao.admin.mapping.basesystem.security.SysConfig;

/**
 * 
 * ISysConfigDAO
 *
 * @author shentuwy
 *
 */
public interface ISysConfigDAO extends IBaseDAO<SysConfig,Long> {
	/**
	 * 获取接入者的系统配置信息
	 * 
	 * @param miNo 接入编号
	 * @return	
	 */
	public SysConfig getConfigByMiNo(String miNo);
}
