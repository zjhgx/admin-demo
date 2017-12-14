/*
 * 源程序名称: AcctPointDAOImpl.java
 * 软件著作权: 某某集团股份有限公司 版权所有
 * 系统名称: 某某集团业务系统平台(UBSP)
 * 模块名称: 账务配置-记账点
 * 
 */
package com.cs.lexiao.admin.basesystem.acctrecord.config.acctpoint;

import com.cs.lexiao.admin.framework.base.BaseDAO;
import com.cs.lexiao.admin.mapping.basesystem.acctrecord.AcctPoint;

/**
 * 
 * 功能说明：记账点数据库操作DAO实现
 * @author shentuwy  
 * @date Jun 27, 2011 08:46:20 AM 
 *
 */
public class AcctPointDAOImpl extends BaseDAO<AcctPoint, Long> implements IAcctPointDAO{

	@Override
	public Class getEntityClass() {
		return AcctPoint.class;
	}

}
