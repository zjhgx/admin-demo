package com.cs.lexiao.admin.code.core;

import java.util.List;

import com.cs.lexiao.admin.framework.base.IBaseService;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.mapping.business.FiCodeKey;

public interface ICodeKeyService extends IBaseService {
	public void addCodeKey(FiCodeKey codeKey);
	public void editCodeKey(FiCodeKey codeKey);
	public void deleteCodeKey(Long id);
	public void deleteByList(List<Long> ids);
	public List<FiCodeKey> findAllByPage(Page page);
	public FiCodeKey getCodeKeyById(Long id);

	/**
	 *
	 * 获取字典元
	 *
	 * @param key
	 *            字典元数据编号
	 * @return 字典元数据
	 */
	public FiCodeKey getCodeKeyByKey(String key);
}
