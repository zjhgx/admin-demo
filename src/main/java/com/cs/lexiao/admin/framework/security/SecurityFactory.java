/*
 * 源程序名称: SecurityFactory.java 
 * 软件著作权: 某某集团股份有限公司 版权所有
 * 系统名称: 某某集团业务系统平台(UBSP)
 * 模块名称：TODO(这里注明模块名称)
 * 
 */

package com.cs.lexiao.admin.framework.security;

import com.cs.lexiao.admin.basesystem.security.core.sysfunc.ISysfuncService;
import com.cs.lexiao.admin.constant.BeanNameConstants;
import com.cs.lexiao.admin.util.SourceTemplate;
/**
 * 
 * 功能说明：TODO(权限管理器工厂)
 * @author shentuwy  
 * @date 2012-1-30 上午10:37:26 
 *
 */
public class SecurityFactory {
	public static ISecurityManager getSecurityManager(){
		ISecurityManager security=null;
		security=(ISecurityManager)SourceTemplate.getBean(SecurityConstants.SECURITY_MANAGER_BEAN);
		return security;
	}
	
	public static ISysfuncService getSysfuncService(){
		ISysfuncService sysfuncService = SourceTemplate.getBean(ISysfuncService.class, BeanNameConstants.SYSFUNC_SERVICE);
		return sysfuncService;
	}
	
}
