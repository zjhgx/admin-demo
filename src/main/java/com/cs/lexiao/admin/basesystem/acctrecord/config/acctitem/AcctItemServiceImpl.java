/*
 * 源程序名称: AcctItemServiceImpl.java
 * 软件著作权: 某某集团股份有限公司 版权所有
 * 系统名称: 某某集团业务系统平台(UBSP)
 * 模块名称: 账务配置-记账项
 * 
 */
package com.cs.lexiao.admin.basesystem.acctrecord.config.acctitem;

import java.util.ArrayList;
import java.util.List;

import com.cs.lexiao.admin.basesystem.acctrecord.config.tranitem.ITranItemDAO;
import com.cs.lexiao.admin.constant.AcctRecordErrorConst;
import com.cs.lexiao.admin.framework.base.BaseService;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.framework.exception.DAOException;
import com.cs.lexiao.admin.framework.exception.ExceptionManager;
import com.cs.lexiao.admin.framework.exception.ServiceException;
import com.cs.lexiao.admin.mapping.basesystem.acctrecord.AcctItem;
import com.cs.lexiao.admin.mapping.basesystem.acctrecord.TranItem;
import com.cs.lexiao.admin.model.ConditionBean;
import com.cs.lexiao.admin.model.OrderBean;

/**
 * 
 * 功能说明：记账项服务层实现
 * @author shentuwy  
 * @date Jun 27, 2011 08:46:20 AM 
 *
 */
public class AcctItemServiceImpl extends BaseService implements IAcctItemService{
	private IAcctItemDAO acctItemDAO;
	private ITranItemDAO tranItemDAO;

	public ITranItemDAO getTranItemDAO() {
		return tranItemDAO;
	}

	public void setTranItemDAO(ITranItemDAO tranItemDAO) {
		this.tranItemDAO = tranItemDAO;
	}

	public IAcctItemDAO getAcctItemDAO() {
		return acctItemDAO;
	}

	public void setAcctItemDAO(IAcctItemDAO acctItemDAO) {
		this.acctItemDAO = acctItemDAO;
	}

	public void createAcctItem(AcctItem acctItem) throws DAOException {
		acctItemDAO.save(acctItem);
	}

	public void deleteAcctItem(Long id) throws DAOException, ServiceException {
		List list = tranItemDAO.queryTranItemByAcctItemId(id);
		if(list != null && list.size()>0){
			ExceptionManager.throwException(ServiceException.class, AcctRecordErrorConst.ACCT_ITEM_ALREADY_USED);
		}
		acctItemDAO.delete(id);
	}

	public void modifyAcctItem(AcctItem acctItem) throws DAOException {
		List<TranItem> list = tranItemDAO.queryTranItemByAcctItemId(acctItem.getId());
		if(!acctItem.getExpress().startsWith("{") || !acctItem.getExpress().endsWith("}")){
			if(list != null){
				for(int i=0; i<list.size(); i++){
					list.get(i).setValue(acctItem.getExpress());
				}
				tranItemDAO.saveOrUpdateAll(list);
			}
		}
		acctItemDAO.update(acctItem);
	}

	public List<AcctItem> queryAcctItem(List<ConditionBean> cblist, Page page)
			throws DAOException, ServiceException {
		List<OrderBean> oblist = new ArrayList<OrderBean>();
		oblist.add(new OrderBean("itemNo"));
		return acctItemDAO.queryEntity(cblist, oblist, page);
	}

	public AcctItem findAcctItem(Long id) throws DAOException, ServiceException {
		return acctItemDAO.get(id);
	}
}
