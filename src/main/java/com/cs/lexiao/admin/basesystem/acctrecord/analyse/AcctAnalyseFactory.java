/*******************************************************************************
 * Leadmind Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on Nov 6, 2008
 *******************************************************************************/

package com.cs.lexiao.admin.basesystem.acctrecord.analyse;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.cs.lexiao.admin.basesystem.acctrecord.runtime.AcctRecordInfoDAO;
import com.cs.lexiao.admin.util.SourceTemplate;

public class AcctAnalyseFactory {
	private static HibernateTemplate ht = SourceTemplate.getHibernateTemplate();
	

	public static AcctTranAnaDAO getAcctTranDAO() {
		AcctTranAnaDAO dao = new AcctTranAnaDAO();
		dao.setHibernateTemplate(ht);
		return dao;
	}

	public static AcctPointAnaDAO getAcctPointDAO() {
		AcctPointAnaDAO dao = new AcctPointAnaDAO();
		dao.setHibernateTemplate(ht);
		return dao;
	}
	
	public static AcctRecordInfoDAO getAcctRecordInfoDAO() {
		AcctRecordInfoDAO dao = new AcctRecordInfoDAO();
		dao.setHibernateTemplate(ht);
		return dao;
	}

}
