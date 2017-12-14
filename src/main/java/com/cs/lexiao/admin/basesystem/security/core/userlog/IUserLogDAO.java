package com.cs.lexiao.admin.basesystem.security.core.userlog;

import java.util.List;

import com.cs.lexiao.admin.framework.base.IBaseDAO;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.mapping.basesystem.security.Branch;
import com.cs.lexiao.admin.mapping.basesystem.security.UserActivityLog;

public interface IUserLogDAO extends IBaseDAO<UserActivityLog, Long> {
	/**
	 * 分页查询
	 * @param log	查询bean
	 * @param page	分页信息
	 * @return
	 */
	public List<UserActivityLog> findUserLogByPage(UserActivityLog log,Branch branch, Page page);

}
