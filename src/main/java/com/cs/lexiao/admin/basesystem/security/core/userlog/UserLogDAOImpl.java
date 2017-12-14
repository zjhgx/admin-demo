package com.cs.lexiao.admin.basesystem.security.core.userlog;

import java.util.List;

import com.cs.lexiao.admin.framework.base.BaseDAO;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.framework.base.QueryCondition;
import com.cs.lexiao.admin.mapping.basesystem.security.Branch;
import com.cs.lexiao.admin.mapping.basesystem.security.UserActivityLog;
import com.cs.lexiao.admin.model.ConditionBean;

/**
 * 
 * UserLogDAOImpl
 *
 * @author shentuwy
 *
 */
public class UserLogDAOImpl extends BaseDAO<UserActivityLog, Long> implements IUserLogDAO {

	public Class<UserActivityLog> getEntityClass() {
		return UserActivityLog.class;
	}


	public List<UserActivityLog> findUserLogByPage(UserActivityLog log,Branch branch, Page page) {
		StringBuilder hql = new StringBuilder("from UserActivityLog ");
		QueryCondition qc = new QueryCondition();
		if(log != null) {
			if(log.getSysUserId() != null) {
				qc.addCondition(new ConditionBean("sysUserId", log.getSysUserId()));
			}
			if(branch != null && branch.getTreeCode() != null) {
				hql.append(" where brchId in (select brchId from Branch where treeCode like '").append(branch.getTreeCode()).append("%'")
					.append(" ) ");
			}
			if(log.getMiNo() != null && !"".equals(log.getMiNo())) {
				qc.addCondition(new ConditionBean("miNo", log.getMiNo()));
			}
			if(log.getLogTmBegin() != null) {
				qc.addCondition(new ConditionBean("logTm", ConditionBean.MORE_AND_EQUAL, log.getLogTmBegin()));
			}
			if(log.getLogTmEnd() != null) {
				qc.addCondition(new ConditionBean("logTm", ConditionBean.LESS_AND_EQUAL, log.getLogTmEnd()));
			}
		}
		hql.append(" order by logTm desc");
		qc.setHql(hql.toString());
		return this.queryByCondition(qc, page);
	}

}
