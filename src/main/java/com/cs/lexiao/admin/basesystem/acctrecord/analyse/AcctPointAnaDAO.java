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

public class AcctPointAnaDAO extends BaseDAO{
	
	public List<AcctTran> getAcctTrans(String miNo, String prodNo, String eventNo){
		String hql = "select tran from AcctPoint point , AcctTran tran where tran.miNo=? AND point.id=tran.pointId AND point.prodNo =? AND point.eventNo=? ";
	
		return this.getHibernateTemplate().find(hql, miNo, prodNo, eventNo);
	}

	@Override
	public Class getEntityClass() {		
		return null;
	}

}
