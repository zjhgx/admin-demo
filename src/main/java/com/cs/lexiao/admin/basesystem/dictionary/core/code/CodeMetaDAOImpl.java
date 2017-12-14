package com.cs.lexiao.admin.basesystem.dictionary.core.code;

import com.cs.lexiao.admin.framework.base.BaseDAO;
import com.cs.lexiao.admin.mapping.basesystem.dictionary.CodeMeta;
/**
 * 
 *CodeMetaDAOImpl
 *
 * @author shentuwy
 *
 */
public class CodeMetaDAOImpl extends BaseDAO<CodeMeta, Long> implements ICodeMetaDAO {

	public Class<CodeMeta> getEntityClass() {
		return CodeMeta.class;
	}

	

}
