package com.cs.lexiao.admin.code.core;

import java.util.List;

import com.cs.lexiao.admin.framework.base.IBaseDAO;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.mapping.business.FiCodeKey;


public interface ICodeKeyDao extends IBaseDAO<FiCodeKey, Long> {

	/*
	 * 分页查询功能
	 */
	public List<FiCodeKey> findAllByPage(Page page);
}
