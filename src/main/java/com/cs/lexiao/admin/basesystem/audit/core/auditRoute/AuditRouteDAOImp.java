package com.cs.lexiao.admin.basesystem.audit.core.auditRoute;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.cs.lexiao.admin.framework.base.BaseDAO;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.mapping.basesystem.audit.AuditRoute;
import com.cs.lexiao.admin.model.ConditionBean;

public class AuditRouteDAOImp extends BaseDAO<AuditRoute, Long> implements
		IAuditRouteDAO {

	@Override
	public Class<AuditRoute> getEntityClass() {
		return AuditRoute.class;
	}

	public List<AuditRoute> findAuditRouteByMiNo(AuditRoute auditRoute,
			Page page) {
		List<ConditionBean> conditionList = new ArrayList<ConditionBean>();
		if (auditRoute != null) {
			String miNo = auditRoute.getMiNo();
			if (StringUtils.isNotBlank(miNo)) {
				ConditionBean partner = new ConditionBean(AuditRoute.MI_NO,
						ConditionBean.IS_NULL, null);
				partner.setLogic(ConditionBean.LOGIC_OR);
				conditionList.add(new ConditionBean(AuditRoute.MI_NO, miNo)
						.addPartner(partner));
			}
			String auditRouteName = auditRoute.getAuditRouteName();
			if (StringUtils.isNotBlank(auditRouteName)) {
				conditionList.add(new ConditionBean(
						AuditRoute.AUDIT_ROUTE_NAME, ConditionBean.LIKE,
						auditRouteName));
			}
		}
		return queryEntity(conditionList, page);
	}

}
