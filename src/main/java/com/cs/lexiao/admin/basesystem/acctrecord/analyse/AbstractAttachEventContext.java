package com.cs.lexiao.admin.basesystem.acctrecord.analyse;

import com.cs.lexiao.admin.basesystem.acctrecord.runtime.AcctInfoCollector;

/**
 * 
 * 记帐附加上下文
 *
 * @author shentuwy
 */
public abstract class AbstractAttachEventContext {	
	
	/**
	 * 添加上下文
	 * @param eventColler
	 */
	public abstract void attachContext(AcctInfoCollector eventColler);
	
	

}
