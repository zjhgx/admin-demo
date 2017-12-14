package com.cs.lexiao.admin.basesystem.dictionary.core.code;

import java.util.List;

import com.cs.lexiao.admin.framework.base.IXBaseService;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.mapping.basesystem.dictionary.CodeMeta;

/**
 * 
 * ICodeMetaService
 * 
 * @author shentuwy
 * 
 */
public interface ICodeMetaService extends IXBaseService<CodeMeta> {

	/**
	 * 
	 * 获取字典信息列表
	 * 
	 * @param cm
	 *            字典元数据信息
	 * @param pg
	 *            分页信息
	 * @return 字典元数据列表
	 */
	public List<CodeMeta> getCodeMetaList(CodeMeta cm, Page pg);

	/**
	 * 
	 * 获取字典元
	 * 
	 * @param key
	 *            字典元数据编号
	 * @return 字典元数据
	 */
	public CodeMeta getCodeMetaByKey(String key);

}
