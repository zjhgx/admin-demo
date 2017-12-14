/*
 * 源程序名称: DictAreaDAOImpl.java 
 * 软件著作权: 某某集团股份有限公司 版权所有
 * 系统名称: UPG业务服务平台(UBSP)
 * 模块名称：数据字典
 * 
 */

package com.cs.lexiao.admin.basesystem.dictionary.core.code;

import java.util.List;

import com.cs.lexiao.admin.framework.annotation.Dao;
import com.cs.lexiao.admin.framework.base.BaseDAO;
import com.cs.lexiao.admin.mapping.basesystem.dictionary.DictArea;

@Dao
public class DictAreaDAOImpl extends BaseDAO<DictArea, Long> implements IDictAreaDAO{

	
	public List<DictArea> getProvinceList()
	{
		StringBuffer hql = new StringBuffer("select area from DictArea area where area.status='1' and area.areaLevel=1 order by area.code asc ");
		
		return this.find(hql.toString());
	}
	    
	public List<DictArea> getAreaListByPid(Long pid) {
		StringBuffer hql = new StringBuffer("select area from DictArea area where area.status='1'");
		if(pid == null)
		   hql.append( " and area.areaLevel=0");
		else
		   hql.append( " and area.pid =").append(pid);
		
		hql.append(" order by area.code asc ");
		
		return this.find(hql.toString());
	}

	public List<DictArea> getAreaListByCode(String code) {
		StringBuffer hql = new StringBuffer("select area from DictArea area where area.status='1'");
		if(code == null)
		   hql.append( " and area.areaLevel=0");
		else
		   hql.append( " and area.code='").append(code).append("'");
		
		return this.find(hql.toString());
	}
}
