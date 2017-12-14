package com.cs.lexiao.admin.basesystem.security.core.user;

import java.util.List;

import com.cs.lexiao.admin.framework.base.IBaseDAO;
import com.cs.lexiao.admin.framework.exception.DAOException;
import com.cs.lexiao.admin.mapping.basesystem.security.Buser;
import com.cs.lexiao.admin.mapping.basesystem.security.ReUserRole;

/**
 * 
 * IReUserRoleDAO.java
 * 
 * @author shentuwy
 * @date 2012-7-27
 *
 */
public interface IReUserRoleDAO extends IBaseDAO<ReUserRole, Long> {

	public ReUserRole findByUserIdAndRoleId(Long userId, Long roleId)throws DAOException;
	public boolean hasRoles(Long userId) throws DAOException;
	
	/**
	 * 根据角色获取用户
	 * 
	 * @param roleType
	 * @return
	 */
	public List<Buser> getUserByRole(String roleType);
	
	/**
	 * 根据角色名称获取用户
	 * 
	 * @param roleName
	 * @return
	 */
	public List<Buser> getUserByRoleName(String roleName);
	
	
	public List<Buser> getUsersByRoleAndBrch(String roleName,String brchNo);
	
	public List<Buser> getUsersByRoleNameAndBrch(String roleName,Long brchId);
	
	public List<Buser> getUsersByRoleIdAndBrch(Long roleId,Long brchId);
}
