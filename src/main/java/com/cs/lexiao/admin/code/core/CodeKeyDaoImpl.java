package com.cs.lexiao.admin.code.core;

import java.util.List;

import com.cs.lexiao.admin.framework.annotation.Dao;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.framework.base.SysBaseDao;
import com.cs.lexiao.admin.mapping.business.FiCodeKey;

@Dao
public class CodeKeyDaoImpl extends SysBaseDao<FiCodeKey, Long> implements ICodeKeyDao  {


	@Override
	public List<FiCodeKey> findAllByPage(Page page) {
		String hql="FROM FiCodeKey";
		return this.queryByParam(hql.toString(), null, page);
	}

}
