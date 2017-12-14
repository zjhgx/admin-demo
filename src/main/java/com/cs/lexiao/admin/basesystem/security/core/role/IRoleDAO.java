package com.cs.lexiao.admin.basesystem.security.core.role;

import java.util.List;

import com.cs.lexiao.admin.framework.base.IBaseDAO;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.framework.base.QueryCondition;
import com.cs.lexiao.admin.framework.exception.DAOException;
import com.cs.lexiao.admin.mapping.basesystem.security.Role;

public interface IRoleDAO extends IBaseDAO<Role, Long> {
	/**
	 * 根据机构编号查询角色
	 * 
	 * @param brchId
	 * @return
	 * @throws DAOException
	 */
	public List<Role> getRolesByBrchId(Long brchId);

	/**
	 * 按条件查询
	 * 
	 */
	public <T> List<T> queryByCondition(QueryCondition qc, Page page);

}
