package com.cs.lexiao.admin.framework.rules.stage;

import com.cs.lexiao.admin.framework.exception.ServiceException;
import com.cs.lexiao.admin.framework.rules.context.ResultInfo;

/**
 * 规则会话 
 *
 * @author shentuwy
 */
public interface IRuleSession {
	/**
	 * 设置会话信息
	 * @param key
	 * @param value
	 */
	void insertFact(String key, Object value);
	/**
	 * 分析执行
	 *
	 * @throws ServiceException
	 */
	ResultInfo fireAllRules() throws ServiceException;
	

}
