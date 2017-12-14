package com.cs.lexiao.admin.code.core;

import java.util.List;

import com.cs.lexiao.admin.framework.base.IXBaseService;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.mapping.business.LxCodeItem;

public interface ICodeItemService extends IXBaseService<LxCodeItem> {
	public void addCodeItem(LxCodeItem codeItem);
	public void editCodeItem(LxCodeItem codeItem);
	public void deleteCodeItem(Long id);
	public void deleteByList(List<Long> ids);
	public List<LxCodeItem> findAllByPage(Page page);
	public LxCodeItem getCodeItemById(Long id);
	public List<LxCodeItem> getCodeItemByKey(String key);
	public List<LxCodeItem> getCodeItemByKeyAsc(String key);
	/**
	 * 获取所有的字典项，包括无效的
	 * 
	 * @param key
	 * @return
	 */
	public List<LxCodeItem> findAllCodeItemByKey(String key);
	
	public List<LxCodeItem> findCodeItemByKeyAndMiNo(String key,String fiMiNo);
	public String getCodeItemNameByKey(String codeKey,String codeNo);
	
	/**
	 * 获取部分字典项
	 * 
	 * @param key
	 * @return
	 */
	public List<LxCodeItem> getSomeCodeItemByKey(String key,String[] codeNo);
	
	public String getCodeNoByKey(String codeKey, String codeName);

}