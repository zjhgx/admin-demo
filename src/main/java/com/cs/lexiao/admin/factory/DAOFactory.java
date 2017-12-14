package com.cs.lexiao.admin.factory;

import com.cs.lexiao.admin.basesystem.security.core.member.IMemberDAO;
import com.cs.lexiao.admin.constant.BeanNameConstants;
import com.cs.lexiao.admin.framework.base.ICommonDAO;
import com.cs.lexiao.admin.util.SourceTemplate;

/**
 * DAO工厂
 * <br>用于获取构造DAO层bean，主要针对一些工具助手类使用<br>
 * <br>禁止在Service类中使用<br>
 * @author alw
 *
 */
public class DAOFactory {

	
	public static ICommonDAO getCommonDao()
	{
		return SourceTemplate.getBean(ICommonDAO.class,BeanNameConstants.COMMON_DAO);
	}
	
	public static IMemberDAO getMemberInfoDao()
	{
		return SourceTemplate.getBean(IMemberDAO.class,BeanNameConstants.MEMBER_DAO);
	}
}
