/*******************************************************************************
 * Leadmind Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on Nov 6, 2008
 *******************************************************************************/


package com.cs.lexiao.admin.basesystem.acctrecord.analyse;

import java.util.List;

import com.cs.lexiao.admin.framework.base.BaseDAO;
import com.cs.lexiao.admin.mapping.basesystem.acctrecord.AcctTran;
import com.cs.lexiao.admin.mapping.basesystem.acctrecord.TranItem;

public class AcctTranAnaDAO extends BaseDAO{
	
	/*public List<AcctTranExpr> getAcctTranExpr(AcctTran tran){
		Long tranId = tran.getId();
		
		String hql = "from AcctTranExpr o where o.tranId=?";
		List list = this.getHibernateTemplate().find(hql, tranId);	
		
		return list;		
	}*/
	
	/**
	 * 获取交易项
	 *
	 * @param tran
	 * @return
	 */
	public List<TranItem> getAcctTranRecords(AcctTran tran){
		Long tranId = tran.getId();
		
		String hql = "select o from TranItem o where o.tranId=? order by rowNo";//按行号排序
		
		List list = this.getHibernateTemplate().find(hql, tranId);	
		
		return list;		
	}

	@Override
	public Class getEntityClass() {
		return null;
	}
	
	

}
