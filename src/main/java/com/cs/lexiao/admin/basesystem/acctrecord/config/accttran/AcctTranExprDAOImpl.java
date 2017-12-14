/*
 * 源程序名称: AcctTranExprDAOImpl.java
 * 软件著作权: 某某集团股份有限公司 版权所有
 * 系统名称: 某某集团业务系统平台(UBSP)
 * 模块名称: 账务配置-记账交易表达式
 * 
 */
package com.cs.lexiao.admin.basesystem.acctrecord.config.accttran;

import com.cs.lexiao.admin.framework.base.BaseDAO;
import com.cs.lexiao.admin.mapping.basesystem.acctrecord.AcctTranExpr;

/**
 * 
 * 功能说明：记账交易表达式数据库操作DAO实现
 * @author shentuwy  
 * @date Jun 27, 2011 08:46:20 AM 
 *
 */
public class AcctTranExprDAOImpl extends BaseDAO<AcctTranExpr, Long> implements IAcctTranExprDAO{

	@Override
	public Class getEntityClass() {
		return AcctTranExpr.class;
	}

}
