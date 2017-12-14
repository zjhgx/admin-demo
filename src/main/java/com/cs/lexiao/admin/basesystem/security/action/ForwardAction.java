package com.cs.lexiao.admin.basesystem.security.action;

import com.cs.lexiao.admin.framework.base.BaseAction;
import com.cs.lexiao.admin.framework.base.SessionTool;
import com.cs.lexiao.admin.model.security.UserLogonInfo;

public class ForwardAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	/** 用户是否登陆标志*/
	private String isLogin;
	
	public String error() {
		UserLogonInfo user = SessionTool.getUserLogonInfo();
		isLogin = "0";
		if (null != user) {
			isLogin = "1";
		}
		return ERROR;
	}

	public String getIsLogin() {
		return isLogin;
	}

	public void setIsLogin(String isLogin) {
		this.isLogin = isLogin;
	}
}