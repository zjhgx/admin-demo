/*
 * 源程序名称: IAcctRecordBodyService.java
 * 软件著作权: 某某集团股份有限公司 版权所有
 * 系统名称: 某某集团业务系统平台(UBSP)
 * 模块名称: 账务配置-分录结构体
 * 
 */
package com.cs.lexiao.admin.basesystem.acctrecord.config.acctrecordbody;

import java.util.List;

import com.cs.lexiao.admin.framework.base.IBaseService;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.framework.exception.DAOException;
import com.cs.lexiao.admin.framework.exception.ServiceException;
import com.cs.lexiao.admin.mapping.basesystem.acctrecord.AcctRecordBody;
import com.cs.lexiao.admin.model.ConditionBean;

/**
 * 
 * 功能说明：分录结构体服务层接口
 * @author shentuwy  
 * @date Jun 24, 2011 11:52:28 AM 
 *
 */
public interface IAcctRecordBodyService extends IBaseService{
	/**
	 * 新增分录结构体
	 * @param acctRecordBody
	 * @throws DAOException
	 */
	public void createAcctRecordBody(AcctRecordBody acctRecordBody) throws DAOException;
	
	/**
	 * 修改分录结构体
	 * @param acctRecordBody
	 * @throws DAOException
	 */
	public void modifyAcctRecordBody(AcctRecordBody acctRecordBody) throws DAOException, ServiceException;
	
	/**
	 * 删除分录结构体
	 * @param id
	 * @throws DAOException
	 * @throws ServiceException
	 */
	public void deleteAcctRecordBody(Long id) throws DAOException, ServiceException;
	
	/**
	 * 查找分录结构体
	 * @param id
	 * @throws DAOException
	 * @throws ServiceException
	 */
	public AcctRecordBody findAcctRecordBody(Long id) throws DAOException, ServiceException;
	
	/**
	 * 根据查询条件和分页信息查询分录结构体
	 * @param cblist 查询条件
	 * @param page 分页信息
	 * @return
	 * @throws DAOException
	 * @throws ServiceException
	 */
	public List<AcctRecordBody> queryAcctRecordBody(List<ConditionBean> cblist, Page page) throws DAOException, ServiceException;
	/**
	 * 查询接入点的分录结构 
	 *
	 * @param miNo 接入编号
	 * @param cblist
	 * @param page
	 * @return
	 * @throws DAOException
	 * @throws ServiceException
	 */
	public List<AcctRecordBody> queryAcctRecordBodyByMember(String miNo, List<ConditionBean> cblist, Page page) throws DAOException, ServiceException;

}
