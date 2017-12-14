/*
 * 源程序名称: ISubsysDAO.java 
 * 软件著作权: 某某集团股份有限公司 版权所有
 * 系统名称: 某某集团业务系统平台(UBSP)
 * 技术平台：XCARS
 * 模块名称：TODO(这里注明模块名称)
 * 
 */

package com.cs.lexiao.admin.basesystem.security.core.subsystem;

import java.util.List;

import com.cs.lexiao.admin.framework.base.IBaseDAO;
import com.cs.lexiao.admin.framework.exception.DAOException;
import com.cs.lexiao.admin.mapping.basesystem.security.Subsystem;
/**
 * 
 * 功能说明：子系统数据层
 * @author shentuwy  
 * @date 2011-5-30 下午04:21:34 
 *
 */
public interface ISubsystemDAO extends IBaseDAO<Subsystem,Long>{
	/**
	 * 根据状态获取子系统集合
	 * @param statusOpen 子系统状态
	 * @return
	 * @throws DAOException
	 */
	List<Subsystem> getSubsystemByStatus(String statusOpen)throws DAOException;
	/**
	 * 获取所有子系统集合
	 * @return
	 * @throws DAOException
	 */
	List<Subsystem> findAllSubsystem()throws DAOException;

}
