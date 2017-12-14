package com.cs.lexiao.admin.basesystem.autotask.core.autotasklog;

import java.util.List;

import com.cs.lexiao.admin.basesystem.autotask.core.AutoTaskInstance;
import com.cs.lexiao.admin.framework.base.BaseService;
import com.cs.lexiao.admin.framework.base.ICommonDAO;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.framework.base.QueryCondition;
import com.cs.lexiao.admin.framework.exception.DAOException;
import com.cs.lexiao.admin.framework.exception.ServiceException;
import com.cs.lexiao.admin.mapping.basesystem.autotask.AutoTaskLog;
import com.cs.lexiao.admin.model.OrderBean;

/**
 * 定时任务日志服务 
 *
 * @author shentuwy
 */
public class AutoTaskLogService extends BaseService implements IAutoTaskLogService{

	private IAutoTaskLogDAO autoTaskLogDAO;
	private ICommonDAO commonDAO;
	
	public void addAutoTaskLog(AutoTaskLog log) throws DAOException {
		autoTaskLogDAO.save(log);
	}
	
	
	public void saveAutoTaskLog(AutoTaskInstance ati)
			throws ServiceException {		
		//写入数据库
		AutoTaskLog log = new AutoTaskLog();
		log.setName(ati.getName());		
		log.setTaskType(ati.getTaskType());
		log.setRunDate(ati.getRunDate());
		log.setStartTime(ati.getStartTime());
		log.setStatus(ati.getStatus());
		log.setErrMessage(ati.getErrMessage());
		log.setTaskId(ati.getTaskId());
		log.setMemberNo(ati.getMemberNo());
		log.setEndTime(ati.getEndTime());			
		this.addAutoTaskLog(log);
		
	}

	public void delById(Long id) throws ServiceException {
		try {
			autoTaskLogDAO.delete(id);
		} catch (DAOException e) {
			e.printStackTrace();
		}
	}

	public void delAutoTaskLog(AutoTaskLog log) throws ServiceException {
		try {
			autoTaskLogDAO.delete(log);
		} catch (DAOException e) {
			e.printStackTrace();
		}
	}


	public AutoTaskLog getAutoTaskLog(Long id) throws DAOException {
		AutoTaskLog  obj = autoTaskLogDAO.get(id);
		return obj;
	}

	public List<AutoTaskLog> getAutoTaskLogs() throws ServiceException {
		List<AutoTaskLog> list=autoTaskLogDAO.queryEntity(null,null, null);
		
		return list;
	}

	public void updateAutoTaskLog(AutoTaskLog log) throws DAOException {
		autoTaskLogDAO.update(log);
	}
	


	public List<AutoTaskLog> queryLogs(QueryCondition qc, Page page)
			throws ServiceException {
		if (qc == null){
			qc = new QueryCondition();
			qc.addOrder(new OrderBean("id", false));
		}
		
		qc.setHql("from AutoTaskLog ");
		
		List<AutoTaskLog> list = this.commonDAO.queryByCondition(qc, page);
		
		return list;
	}

	
	
	
	//-----------
	public IAutoTaskLogDAO getAutoTaskLogDAO() {
		return autoTaskLogDAO;
	}

	public void setAutoTaskLogDAO(IAutoTaskLogDAO autoTaskLogDAO) {
		this.autoTaskLogDAO = autoTaskLogDAO;
	}


	public ICommonDAO getCommonDAO() {
		return commonDAO;
	}


	public void setCommonDAO(ICommonDAO commonDAO) {
		this.commonDAO = commonDAO;
	}

	
}
