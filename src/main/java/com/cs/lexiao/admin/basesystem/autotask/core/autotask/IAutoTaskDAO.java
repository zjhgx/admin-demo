
package com.cs.lexiao.admin.basesystem.autotask.core.autotask;

import java.util.List;

import com.cs.lexiao.admin.framework.base.IBaseDAO;
import com.cs.lexiao.admin.framework.exception.DAOException;
import com.cs.lexiao.admin.framework.exception.ServiceException;
import com.cs.lexiao.admin.mapping.basesystem.autotask.AutoTask;

public interface IAutoTaskDAO extends  IBaseDAO<AutoTask, Long>{
	
	/**
	 * 获取打开的任务
	 * @return
	 * @throws ServiceException
	 */
	public List<AutoTask> getOpenAutoTasks() throws DAOException;
	/**
	 * 获取关闭的任务
	 * @return
	 * @throws ServiceException
	 */
	public List<AutoTask> getCloseAutoTasks() throws DAOException;
	
}
