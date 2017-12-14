/*
 * 源程序名称: ISecurityPwdEncoder.java 
 * 软件著作权: 某某集团股份有限公司 版权所有
 * 系统名称: 某某集团业务系统平台(UBSP)
 * 技术平台：XCARS
 * 模块名称：TODO(这里注明模块名称)
 * 
 */

package com.cs.lexiao.admin.framework.security;
/**
 * 
 * 功能说明：密码处理器
 * @author shentuwy  
 * @date 2011-5-25 上午10:06:35 
 *
 */
public interface ISecurityPwdEncryptor {
	/**
	 * 加密
	 * @param pwd 原文
	 * @return 密文
	 */
	public String encryption(String pwd);
}
