/*
 * 源程序名称: AcctTranDAOImpl.java
 * 软件著作权: 某某集团股份有限公司 版权所有
 * 系统名称: 某某集团业务系统平台(UBSP)
 * 模块名称: 账务配置-记账交易
 * 
 */
package com.cs.lexiao.admin.basesystem.acctrecord.config.accttran;

import java.util.List;

import com.cs.lexiao.admin.framework.base.BaseDAO;
import com.cs.lexiao.admin.framework.exception.DAOException;
import com.cs.lexiao.admin.mapping.basesystem.acctrecord.AcctTran;

/**
 * 
 * 功能说明：记账交易数据库操作DAO实现
 * @author shentuwy  
 * @date Jun 27, 2011 08:46:20 AM 
 *
 */
public class AcctTranDAOImpl extends BaseDAO<AcctTran, Long> implements IAcctTranDAO{

	@Override
	public Class getEntityClass() {
		return AcctTran.class;
	}

	public List<AcctTran> queryAcctTranByAcctPointId(Long acctPointId)
			throws DAOException {
		String hql = "from AcctTran acctTran where acctTran.pointId=?";
		return super.find(hql, acctPointId);
	}

}
