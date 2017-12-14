/*******************************************************************************
 * Copyright (c) 2003-2008 leadmind Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2008-11-13
 *******************************************************************************/


package com.cs.lexiao.admin.basesystem.autotask.actions;

import java.util.List;

import com.cs.lexiao.admin.basesystem.autotask.core.AutoTaskCurrentMonitor;
import com.cs.lexiao.admin.basesystem.autotask.core.AutoTaskInstance;
import com.cs.lexiao.admin.basesystem.autotask.core.AutoTaskServiceFactory;
import com.cs.lexiao.admin.basesystem.autotask.core.IAutoTaskCurrentService;
import com.cs.lexiao.admin.framework.base.BaseAction;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.framework.exception.ServiceException;
/**
 * 任务监控控制器 
 *
 * @author shentuwy
 */
public class AutoTaskMonitorAction extends BaseAction{
	private List<AutoTaskInstance> autoTaskInstances;
	private Long taskId;
	private String memberNo;
	
	//service
	private IAutoTaskCurrentService autoTaskCurrentService;
	

	public String main() throws ServiceException{
		
		return MAIN;
	}

	public String list() throws ServiceException{
		Page pg=this.getPg();
		pg.setPageSize(30);
	
		autoTaskInstances = AutoTaskServiceFactory.getAutoTaskCurrentService().getAllAutoTasks();
		
		return setDatagridInputStreamData(autoTaskInstances, pg);
		
	}
	
	public String memberList() throws ServiceException{		
		AutoTaskInstance instance = AutoTaskCurrentMonitor.getInstance().getAutoTaskInstance(taskId);
		autoTaskInstances = instance.getSubTaskList();		
		return "memberList";
	}
		
	public String runTask() throws ServiceException{
		
		autoTaskCurrentService.runTask(taskId);
		
		return "listAction";
	}
	
	
	
	
	
	public String runSubTask() throws ServiceException{
		
		autoTaskCurrentService.runSubTask(taskId, memberNo);
		
		return this.memberList();
	}
	
	public String stopTask() throws ServiceException{
		
		autoTaskCurrentService.runTask(taskId);
		
		return "listAction";
	}
	
	public String stopSubTask() throws ServiceException{
		
		autoTaskCurrentService.runSubTask(taskId, memberNo);
		
		return this.memberList();
	}
	

	
	public List<AutoTaskInstance> getAutoTaskInstances() {
		return autoTaskInstances;
	}

	public void setAutoTaskInstances(List<AutoTaskInstance> autoTaskInstances) {
		this.autoTaskInstances = autoTaskInstances;
	}

	/**
	 * @return Returns the taskId.
	 */
	public Long getTaskId() {
		return taskId;
	}

	/**
	 * @param taskId The taskId to set.
	 */
	public void setTaskId(Long taskId) {
		this.taskId = taskId;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	
	
	//spring
	public IAutoTaskCurrentService getAutoTaskCurrentService() {
		return autoTaskCurrentService;
	}

	public void setAutoTaskCurrentService(
			IAutoTaskCurrentService autoTaskCurrentService) {
		this.autoTaskCurrentService = autoTaskCurrentService;
	}
	
}
