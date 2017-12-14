package com.cs.lexiao.admin.basesystem.autocode.action;


import java.util.HashMap;
import java.util.Map;

import com.cs.lexiao.admin.basesystem.autocode.util.AutoGenCodeUtil;
import com.cs.lexiao.admin.framework.base.BaseAction;
import com.cs.lexiao.admin.framework.base.SessionTool;
import com.cs.lexiao.admin.model.security.UserLogonInfo;

@SuppressWarnings("serial")
public class AutoCodeConfigAction extends BaseAction {
	
	private String codeKey;
	/**
	 * 生成编码
	 * @return
	 * @throws Exception
	 */
	public String genCode(){
		UserLogonInfo loginInfo = SessionTool.getUserLogonInfo();
		String miNo = loginInfo.getMiNo();
		String code = AutoGenCodeUtil.autoGenCode(codeKey, miNo, null);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("code", code);
		return setInputStreamData(map);
	}
	
	
	
	public String getCodeKey() {
		return codeKey;
	}
	public void setCodeKey(String codeKey) {
		this.codeKey = codeKey;
	}
}
