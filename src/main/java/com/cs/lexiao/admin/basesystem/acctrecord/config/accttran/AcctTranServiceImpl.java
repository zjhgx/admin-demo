/*
 * 源程序名称: AcctPointServiceImpl.java
 * 软件著作权: 某某集团股份有限公司 版权所有
 * 系统名称: 某某集团业务系统平台(UBSP)
 * 模块名称: 账务配置-记账交易
 * 
 */
package com.cs.lexiao.admin.basesystem.acctrecord.config.accttran;

import java.util.ArrayList;
import java.util.List;

import com.cs.lexiao.admin.basesystem.acctrecord.config.tranitem.ITranItemDAO;
import com.cs.lexiao.admin.constant.AcctRecordErrorConst;
import com.cs.lexiao.admin.framework.base.BaseService;
import com.cs.lexiao.admin.framework.base.ICommonDAO;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.framework.exception.DAOException;
import com.cs.lexiao.admin.framework.exception.ExceptionManager;
import com.cs.lexiao.admin.framework.exception.ServiceException;
import com.cs.lexiao.admin.mapping.basesystem.acctrecord.AcctTran;
import com.cs.lexiao.admin.mapping.basesystem.acctrecord.AcctTranExpr;
import com.cs.lexiao.admin.model.ConditionBean;
import com.cs.lexiao.admin.model.OrderBean;

/**
 * 
 * 功能说明：记账交易服务层实现
 * @author shentuwy  
 * @date Jun 27, 2011 08:46:20 AM 
 *
 */
public class AcctTranServiceImpl extends BaseService implements IAcctTranService{
	private IAcctTranDAO acctTranDAO;
	private IAcctTranExprDAO acctTranExprDAO;
	private ITranItemDAO tranItemDAO;
	
	private ICommonDAO commonDAO;//spring set

	public ICommonDAO getCommonDAO() {
		return commonDAO;
	}

	public void setCommonDAO(ICommonDAO commonDAO) {
		this.commonDAO = commonDAO;
	}

	public ITranItemDAO getTranItemDAO() {
		return tranItemDAO;
	}

	public void setTranItemDAO(ITranItemDAO tranItemDAO) {
		this.tranItemDAO = tranItemDAO;
	}

	public IAcctTranDAO getAcctTranDAO() {
		return acctTranDAO;
	}

	public void setAcctTranDAO(IAcctTranDAO acctTranDAO) {
		this.acctTranDAO = acctTranDAO;
	}

	public IAcctTranExprDAO getAcctTranExprDAO() {
		return acctTranExprDAO;
	}

	public void setAcctTranExprDAO(IAcctTranExprDAO acctTranExprDAO) {
		this.acctTranExprDAO = acctTranExprDAO;
	}

	public void createAcctTran(AcctTran acctTran) throws DAOException {
		acctTranDAO.save(acctTran);
	}

	public void deleteAcctTran(Long id) throws DAOException, ServiceException {
		List list = tranItemDAO.queryTranItemByAcctTranId(id);
		if(list != null && list.size()>0){
			ExceptionManager.throwException(ServiceException.class, AcctRecordErrorConst.ACCT_TRAN_ALREADY_USED);
		}
		
		Page p = new Page();
		p.setPageSize(65536);
		List<ConditionBean> cblist = new ArrayList<ConditionBean>();
		cblist.add(new ConditionBean("tranId",id));
		list = acctTranExprDAO.queryEntity(cblist, p);
		acctTranExprDAO.delAll(list);
		acctTranDAO.delete(id);
	}

	public AcctTran findAcctTran(Long id) throws DAOException, ServiceException {
		return acctTranDAO.get(id);
	}

	public void modifyAcctTran(AcctTran acctTran) throws DAOException {
		acctTranDAO.update(acctTran);
	}

	public List<AcctTran> queryAcctTran(List<ConditionBean> cblist, Page page)
			throws DAOException, ServiceException {
		List<OrderBean> oblist = new ArrayList<OrderBean>();
		oblist.add(new OrderBean("tranNo"));
		return acctTranDAO.queryEntity(cblist, oblist, page);
	}

	public void createAcctTranExpr(AcctTranExpr acctTranExpr)
			throws DAOException {
		acctTranExprDAO.save(acctTranExpr);
	}

	public void deleteAcctTranExpr(Long id) throws DAOException {
		acctTranExprDAO.delete(id);
	}

	public List<AcctTranExpr> queryAcctTranExpr(List<ConditionBean> cblist,
			Page page) throws DAOException, ServiceException {
		List<OrderBean> oblist = new ArrayList<OrderBean>();
		oblist.add(new OrderBean("id"));
		return acctTranExprDAO.queryEntity(cblist, oblist, page);
	}

	public List<Object[]> findAcctPointAndTranInfoByMember(String miNo) throws DAOException {
		String hql = "SELECT point, tran, product.prodName " +
				"FROM AcctPoint point, AcctTran tran, ProductInfo product " +
				"WHERE tran.miNo=? AND point.id=tran.pointId AND point.prodNo=product.prodNo ";
		
		List list = this.commonDAO.find(hql, miNo);
		return list;
	}
	
}
