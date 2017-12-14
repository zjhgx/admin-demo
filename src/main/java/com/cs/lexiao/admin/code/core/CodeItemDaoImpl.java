package com.cs.lexiao.admin.code.core;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.cs.lexiao.admin.framework.annotation.Dao;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.framework.base.SysBaseDao;
import com.cs.lexiao.admin.mapping.business.LxCodeItem;

@Dao
public class CodeItemDaoImpl extends SysBaseDao<LxCodeItem, Long> implements ICodeItemDao  {

	@Override
	public List<LxCodeItem> findAllByPage(Page page) {
		String hql="FROM CodeItem";
		return this.queryByParam(hql.toString(), null, page);
	}

	@Override
	public List<LxCodeItem> getCodeItemByKey(String key) {
		String hql="FROM CodeItem where codeKey=? and isPublic=1 ORDER BY order DESC";
//		super.getHibernateTemplate().setCacheQueries(true);
		return super.find(hql, new Object[]{key});
	}

	@Override
	public List<LxCodeItem> getCodeItemByKeyAsc(String key) {
		String hql="FROM CodeItem where codeKey=? and isPublic=1 ORDER BY order asc";
//		super.getHibernateTemplate().setCacheQueries(true);
		return super.find(hql, new Object[]{key});
	}

	@Override
	public String getCodeItemNameByKey(String codeKey, String codeNo) {
		String hql="FROM CodeItem where codeKey=? and codeNo=?";
		List<LxCodeItem> items=super.find(hql, new Object[]{codeKey,codeNo});
		if(!items.isEmpty()){
			LxCodeItem fiCodeItem=items.get(0);
			if(fiCodeItem!=null&&StringUtils.isNotEmpty(fiCodeItem.getCodeName())){
				return fiCodeItem.getCodeName();
			}else{
				/*
				if(codeKey == CodeKeyConstant.XHH_PRJ_TYPE){
					return "—";
				}
				return "数据字典不存在！";
				*/
				return "";
			}
		}else{
			/*
			if(codeKey == CodeKeyConstant.XHH_PRJ_TYPE){
				return "—";
			}
			return "数据字典不存在！";
			*/
			return "";
		}
	}

	@Override
	public List<LxCodeItem> findAllCodeItemByKey(String key) {
		String hql = "FROM CodeItem where codeKey=?";
		return find(hql, key);
	}

	@Override
	public String getCodeNoByKey(String codeKey, String codeName) {
		String hql="FROM FiCodeItem where codeKey=? and codeName=?";
		List<LxCodeItem> items=super.find(hql, new Object[]{codeKey,codeName});
		if(!items.isEmpty()){
			LxCodeItem fiCodeItem=items.get(0);
			if(fiCodeItem!=null&&StringUtils.isNotEmpty(fiCodeItem.getCodeNo())){
				return fiCodeItem.getCodeNo();
			}else
			{
				return "";
			}
		}else
		{
			return "";
		}
	}

	/**
	 * 根据key和name查询字典项.
	 */
	public LxCodeItem getCodeItemByName(String codeKey, String codeName) {
		String hql="FROM CodeItem where codeKey = ? and codeName = ?";
		List<LxCodeItem> items = super.find(hql, new Object[] {codeKey, codeName.trim()});
		if (null != items && !items.isEmpty()) {
			return items.get(0);
		}
		return null;
	}
}
