package com.cs.lexiao.admin.framework.rules.runtime;

import com.cs.lexiao.admin.framework.rules.context.ContextInfo;

/**
 * 规则参数接口
 * @author shentuwy
 */
public interface IRuleParameter {
	/**
	 * 参数接口的返回值
	 * @return
	 */
	public Object get(ContextInfo context);

}
