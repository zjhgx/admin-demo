package com.cs.lexiao.admin.basesystem.audit.core.auditStation;

import java.util.List;

import com.cs.lexiao.admin.framework.base.IBaseDAO;
import com.cs.lexiao.admin.mapping.basesystem.audit.AuditStation;
import com.cs.lexiao.admin.mapping.basesystem.audit.ReAuditStationRole;
import com.cs.lexiao.admin.mapping.basesystem.security.Buser;
import com.cs.lexiao.admin.mapping.basesystem.security.Role;

public interface IAuditStationRoleDAO extends
		IBaseDAO<ReAuditStationRole, Long> {

	/**
	 * 获取岗位角色
	 * @param auditStationId 审批岗位id
	 * @return
	 */
	List<Role> findRoleByAuditStationId(Long auditStationId);
	/**
	 * 根据审批岗位id获取岗位角色关系
	 * @param auditStationId 审批岗位id
	 * @return
	 */
	List<ReAuditStationRole> findReAuditStationRoleBy(Long auditStationId);
	/**
	 * 删除岗位上的角色配置
	 * @param userIds
	 * @param auditStation
	 */
	void delete(String[] roleids, AuditStation auditStation);
	/**
	 * 获取通过角色分配到的人员
	 * @param auditStationid
	 * @return
	 */
	List<Buser> findBuserByAuditStationId(Long auditStationid);
	/**
	 * 统计通过角色绑定的人员数
	 * @param auditStationId 
	 * @return
	 */
	Long countUserNumberByAuditStationId(Long auditStationId);

}
