/*
 * 源程序名称: IAcctRecordBodyService.java
 * 软件著作权: 某某集团股份有限公司 版权所有
 * 系统名称: 某某集团业务系统平台(UBSP)
 * 模块名称: 账务配置-记账交易
 * 
 */
package com.cs.lexiao.admin.basesystem.acctrecord.config.accttran;

import java.util.List;

import com.cs.lexiao.admin.framework.base.IBaseService;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.framework.exception.DAOException;
import com.cs.lexiao.admin.framework.exception.ServiceException;
import com.cs.lexiao.admin.mapping.basesystem.acctrecord.AcctTran;
import com.cs.lexiao.admin.mapping.basesystem.acctrecord.AcctTranExpr;
import com.cs.lexiao.admin.model.ConditionBean;

/**
 * 
 * 功能说明：记账交易服务层接口
 * @author shentuwy  
 * @date Jun 24, 2011 11:52:28 AM 
 *
 */
public interface IAcctTranService extends IBaseService{
	/**
	 * 新增记账交易
	 * @param acctTran
	 * @throws DAOException
	 */
	public void createAcctTran(AcctTran acctTran) throws DAOException;
	
	/**
	 * 修改记账交易
	 * @param acctTran
	 * @throws DAOException
	 */
	public void modifyAcctTran(AcctTran acctTran) throws DAOException;
	
	/**
	 * 删除记账交易
	 * @param id
	 * @throws DAOException
	 * @throws ServiceException
	 */
	public void deleteAcctTran(Long id) throws DAOException, ServiceException;
	
	/**
	 * 查找记账交易
	 * @param id
	 * @throws DAOException
	 * @throws ServiceException
	 */
	public AcctTran findAcctTran(Long id) throws DAOException, ServiceException;
	
	/**
	 * 根据查询条件和分页信息查询记账交易
	 * @param cblist 查询条件
	 * @param page 分页信息
	 * @return
	 * @throws DAOException
	 * @throws ServiceException
	 */
	public List<AcctTran> queryAcctTran(List<ConditionBean> cblist, Page page) throws DAOException, ServiceException;
	/**
	 * TODO 
	 *
	 * @param miNo
	 * @return Object[AcctPoint, AcctTran,  tranName]
	 * @throws DAOException
	 */
	public List<Object[]> findAcctPointAndTranInfoByMember(String miNo) throws DAOException;

	/**
	 * 新增记账交易表达式
	 * @param acctTranExpr
	 * @throws DAOException
	 */
	public void createAcctTranExpr(AcctTranExpr acctTranExpr) throws DAOException;
	
	/**
	 * 删除记账交易表达式
	 * @param id
	 * @throws DAOException
	 */
	public void deleteAcctTranExpr(Long id) throws DAOException;
	
	/**
	 * 根据查询条件和分页信息查询记账交易表达式
	 * @param cblist 查询条件
	 * @param page 分页信息
	 * @return
	 * @throws DAOException
	 * @throws ServiceException
	 */
	public List<AcctTranExpr> queryAcctTranExpr(List<ConditionBean> cblist, Page page) throws DAOException, ServiceException;
}
