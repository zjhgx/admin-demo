package com.cs.lexiao.admin.basesystem.security.core.role;

import java.util.List;

import com.cs.lexiao.admin.framework.base.BaseDAO;
import com.cs.lexiao.admin.mapping.basesystem.security.Role;

public class RoleDAOImpl extends BaseDAO<Role, Long> implements IRoleDAO {

	@Override
	public Class<Role> getEntityClass() {
		return Role.class;
	}

	public List<Role> getRolesByBrchId(Long brchId) {
		// 根据机构编号查询角色，如果机构id为空，则查询机构id为null的角色
		String hql = null;
		if (brchId == null) {
			hql = "from Role as role where (role.brchId is null or role.brchId='') order by role.roleName";
			List<Role> list = find(hql);
			return list;
		} else {
			hql = "from Role as role where role.brchId=?  order by role.roleName ";
			List<Role> list = this.find(hql, brchId);
			return list;
		}
	}

}
