/*
 * 源程序名称: AcctItemDAOImpl.java
 * 软件著作权: 某某集团股份有限公司 版权所有
 * 系统名称: 某某集团业务系统平台(UBSP)
 * 模块名称: 账务配置-记账项
 * 
 */
package com.cs.lexiao.admin.basesystem.acctrecord.config.acctitem;

import java.util.List;

import com.cs.lexiao.admin.framework.base.BaseDAO;
import com.cs.lexiao.admin.framework.exception.DAOException;
import com.cs.lexiao.admin.mapping.basesystem.acctrecord.AcctItem;

/**
 * 
 * 功能说明：记账项数据库操作DAO实现
 * @author shentuwy  
 * @date Jun 27, 2011 08:46:20 AM 
 *
 */
public class AcctItemDAOImpl extends BaseDAO<AcctItem, Long> implements IAcctItemDAO{

	@Override
	public Class getEntityClass() {
		return AcctItem.class;
	}

	public List<AcctItem> queryAcctItemByAcctPointId(Long acctPointId)
			throws DAOException {
		String hql = "from AcctItem acctItem where acctItem.pointId=? order by acctItem.itemNo";
		return super.find(hql, new Object[]{acctPointId});
	}

}
