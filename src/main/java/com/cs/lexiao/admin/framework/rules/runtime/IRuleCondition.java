package com.cs.lexiao.admin.framework.rules.runtime;

import com.cs.lexiao.admin.framework.exception.SysException;
import com.cs.lexiao.admin.framework.rules.context.ContextInfo;
/**
 * 规则条件匹配接口
 * 
 * @author shentuwy
 */
public interface IRuleCondition {
	/**
	 * 条件是否匹配 
	 *
	 * @param context
	 * @return
	 */
	public boolean isMatch(ContextInfo context) throws SysException;

}
