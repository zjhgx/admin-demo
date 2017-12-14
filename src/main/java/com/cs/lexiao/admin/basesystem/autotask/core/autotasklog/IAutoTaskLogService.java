package com.cs.lexiao.admin.basesystem.autotask.core.autotasklog;

import java.util.List;

import com.cs.lexiao.admin.basesystem.autotask.core.AutoTaskInstance;
import com.cs.lexiao.admin.framework.base.IBaseService;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.framework.base.QueryCondition;
import com.cs.lexiao.admin.framework.exception.ServiceException;
import com.cs.lexiao.admin.mapping.basesystem.autotask.AutoTaskLog;
/**
 * 自动任务日志
 * @author shentuwy
 */
public interface IAutoTaskLogService extends IBaseService{
	public void addAutoTaskLog(AutoTaskLog log) throws ServiceException;
	public void delAutoTaskLog(AutoTaskLog log) throws ServiceException;
	public void delById(Long id) throws ServiceException;
	public void updateAutoTaskLog(AutoTaskLog log) throws ServiceException;
	public AutoTaskLog getAutoTaskLog(Long id) throws ServiceException;
	
	public List<AutoTaskLog> getAutoTaskLogs() throws ServiceException;
	
	/**
	 * 保存日志信息
	 * @param ati 任务实例
	 * @throws ServiceException
	 */
	public void saveAutoTaskLog(AutoTaskInstance ati) throws ServiceException;
	/**
	 * 日志查询 
	 *
	 * @param qc
	 * @param page
	 * @return
	 * @throws ServiceException
	 */
	public List<AutoTaskLog> queryLogs(QueryCondition qc, Page page) throws ServiceException;
	
}
