package com.cs.lexiao.admin.code.core;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.cs.lexiao.admin.basesystem.dictionary.core.code.ICodeMetaDAO;
import com.cs.lexiao.admin.framework.annotation.Service;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.mapping.basesystem.dictionary.CodeMeta;
import com.cs.lexiao.admin.mapping.business.FiCodeKey;
import com.cs.lexiao.admin.model.ConditionBean;

@Service
public class CodeKeyServiceImpl implements ICodeKeyService {

	/** 字典元信息 */
	private ICodeKeyDao codeKeyDao;
	private ICodeMetaDAO codeMetaDAO;

	@Override
	public void addCodeKey(FiCodeKey codeKey) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void editCodeKey(FiCodeKey codeKey) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCodeKey(Long id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteByList(List<Long> ids) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<FiCodeKey> findAllByPage(Page page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FiCodeKey getCodeKeyById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FiCodeKey getCodeKeyByKey(String key) {
		CodeMeta ret = null;
		if (StringUtils.isNotBlank(key)) {
			List<ConditionBean> conditionList = new ArrayList<ConditionBean>();
			conditionList.add(new ConditionBean(CodeMeta.KEY, key));
			List<CodeMeta> list = codeMetaDAO.queryEntity(conditionList, null);
			if (list != null && list.size() > 0) {
				ret = list.get(0);
			}
		}
		FiCodeKey fiCodeKey = new FiCodeKey();
		fiCodeKey.setCodeKey(ret.getKey());
		fiCodeKey.setKeyName(ret.getName());
//		fiCodeKey.setLangType(ret.get);
		return fiCodeKey;
	}

	public ICodeKeyDao getCodeKeyDao() {
		return codeKeyDao;
	}

	public void setCodeKeyDao(ICodeKeyDao codeKeyDao) {
		this.codeKeyDao = codeKeyDao;
	}

	public ICodeMetaDAO getCodeMetaDAO() {
		return codeMetaDAO;
	}

	public void setCodeMetaDAO(ICodeMetaDAO codeMetaDAO) {
		this.codeMetaDAO = codeMetaDAO;
	}
}
