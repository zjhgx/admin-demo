package com.cs.lexiao.admin.basesystem.busidate.core;

import java.util.List;

import com.cs.lexiao.admin.framework.base.IBaseDAO;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.mapping.basesystem.busidate.BusiDate;
import com.cs.lexiao.admin.model.ConditionBean;

/**
 * 
 * IBusiDateDAO
 *
 * @author shentuwy
 *
 */
public interface IBusiDateDAO extends IBaseDAO<BusiDate, Long> {
	
	/**
	 * 
	 * 分页获取通用的营业日对象列表
	 *
	 * @param <T>
	 * @param cls
	 * @param conditionList
	 * @param page
	 * @return
	 */
	public <T extends BusiDate> List<T> getCommonBusiDateList(Class<T> cls,List<ConditionBean> conditionList,Page page);
	
	/**
	 * 
	 * 获取机构编号为空的通用营业日对象
	 *
	 * @param <T>
	 * @param cls
	 * @return
	 */
	public <T extends BusiDate> T getCommonBusiDateByNullMino(Class<T> cls);
	
}
