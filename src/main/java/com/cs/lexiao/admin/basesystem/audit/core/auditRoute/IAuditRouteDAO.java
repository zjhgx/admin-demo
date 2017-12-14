package com.cs.lexiao.admin.basesystem.audit.core.auditRoute;

import java.util.List;

import com.cs.lexiao.admin.framework.base.IBaseDAO;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.mapping.basesystem.audit.AuditRoute;

public interface IAuditRouteDAO extends IBaseDAO<AuditRoute, Long> {

	/**
	 * 根据接入编号获取审批路线
	 * 
	 * @param auditRoute
	 * @param page
	 * @return
	 */
	List<AuditRoute> findAuditRouteByMiNo(AuditRoute auditRoute, Page page);

}
