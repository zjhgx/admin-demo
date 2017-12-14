package com.cs.lexiao.admin.framework.log.core;

import org.apache.log4j.jdbc.JDBCAppender;

import com.cs.lexiao.admin.util.DESKeyUtil;
/**
 * 数据源配置加密
 *
 * @author shentuwy
 */
public class ExJDBCAppender extends JDBCAppender {

	@Override
	public void setPassword(String password) {
		//将密文进行解密
		String realPassword = DESKeyUtil.dec("base-config/keydb.dat", password);
		
		super.setPassword(realPassword);
	}

}
