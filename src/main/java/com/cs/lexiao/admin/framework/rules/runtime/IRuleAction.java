package com.cs.lexiao.admin.framework.rules.runtime;

import com.cs.lexiao.admin.framework.exception.SysException;
import com.cs.lexiao.admin.framework.rules.context.ContextInfo;
/**
 * 规则执行动作
 *
 * @author yangjun (mailto:yangjun@leadmind.com.cn)
 */
public interface IRuleAction {
	/**
	 * 执行
	 * @param context
	 * @return
	 * @throws SysException
	 */
	public Object execute(ContextInfo context) throws SysException;

}
