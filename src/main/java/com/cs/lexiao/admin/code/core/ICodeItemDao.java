package com.cs.lexiao.admin.code.core;

import java.util.List;

import com.cs.lexiao.admin.framework.base.IBaseDAO;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.mapping.business.LxCodeItem;


public interface ICodeItemDao extends IBaseDAO<LxCodeItem, Long> {

	/*
	 * 分页查询功能
	 */
	public List<LxCodeItem> findAllByPage(Page page);
	
	public List<LxCodeItem> getCodeItemByKey(String key);
	public List<LxCodeItem> getCodeItemByKeyAsc(String key);
	
	/**
	 * 包括无效的
	 * 
	 * @param key
	 * @return
	 */
	public List<LxCodeItem> findAllCodeItemByKey(String key);

	public String getCodeItemNameByKey(String codeKey, String codeNo);
	public String getCodeNoByKey(String codeKey, String codeName);
	
	/**
	 * 根据key和name查询字典项.
	 */
	public LxCodeItem getCodeItemByName(String codeKey, String codeName);
}
