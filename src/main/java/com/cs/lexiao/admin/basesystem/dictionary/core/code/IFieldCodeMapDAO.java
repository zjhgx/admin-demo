package com.cs.lexiao.admin.basesystem.dictionary.core.code;

import java.util.List;

import com.cs.lexiao.admin.framework.base.IBaseDAO;
import com.cs.lexiao.admin.framework.exception.DAOException;
import com.cs.lexiao.admin.mapping.basesystem.dictionary.CodeMeta;
import com.cs.lexiao.admin.mapping.basesystem.dictionary.FieldCodeMap;

/**
 * 对FieldCodeMap数据访问功能
 *
 * @author shentuwy
 */
public interface IFieldCodeMapDAO extends IBaseDAO<FieldCodeMap, Long> {
	
	public void deleteFieldCodeMapsByKey(String key)throws DAOException;
	
	
	public List<FieldCodeMap> getFieldCodeMapsByKey(String key)throws DAOException;
	
	
	public CodeMeta getCodeMetaByField(String tableName, String fieldName)throws DAOException;

}
