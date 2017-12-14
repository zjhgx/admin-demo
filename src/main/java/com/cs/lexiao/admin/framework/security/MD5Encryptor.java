/*
 * 源程序名称: SecurityPwdHandler.java 
 * 软件著作权: 某某集团股份有限公司 版权所有
 * 系统名称: 某某集团业务系统平台(UBSP)
 * 技术平台：XCARS
 * 模块名称：TODO(这里注明模块名称)
 * 
 */

package com.cs.lexiao.admin.framework.security;

import com.cs.lexiao.admin.util.DigestUtil;
/**
 * 
 * 功能说明：MD%加密器，实现权限加密接口
 * @author shentuwy  
 * @date 2011-8-3 下午8:36:11 
 *
 */
public class MD5Encryptor implements ISecurityPwdEncryptor {

	public String encryption(String pwd) {

		return DigestUtil.getMD5(pwd);
	}

}
