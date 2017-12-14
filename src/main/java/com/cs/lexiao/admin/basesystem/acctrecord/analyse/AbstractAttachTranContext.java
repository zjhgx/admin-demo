package com.cs.lexiao.admin.basesystem.acctrecord.analyse;

import com.cs.lexiao.admin.basesystem.acctrecord.runtime.AcctInfoCollector;
import com.cs.lexiao.admin.mapping.basesystem.acctrecord.AcctTran;
/**
 * 
 * 记帐附加上下文
 *
 * @author shentuwy
 */
public abstract class AbstractAttachTranContext {
	/**
	 * 添加上下文
	 * @param eventColler
	 */
	public abstract void attachContext(AcctTran tran, AcctInfoCollector eventColler);
	

}
