package com.cs.lexiao.admin.util;

import java.util.List;

import com.cs.lexiao.admin.code.core.ICodeItemService;
import com.cs.lexiao.admin.mapping.business.LxCodeItem;

/**
 * 字典工具 
 *
 */
public class CodeItemUtil {
	
	/**
	 * 获取字典项名称
	 * @param codeKey
	 * @param codeNo
	 * @return
	 */
	public static String getCodeNameByKey(String codeKey, String codeNo){
		return SourceTemplate.getBean(ICodeItemService.class,"codeItemService").getCodeItemNameByKey(codeKey, codeNo);
	}
	
	public static List<LxCodeItem> getCodeItemsByKey(String codeKey){
		return SourceTemplate.getBean(ICodeItemService.class,"codeItemService").getCodeItemByKey(codeKey);
	}

	public static List<LxCodeItem> getCodeItemsByKeyOrderAsc(String codeKey){
		return SourceTemplate.getBean(ICodeItemService.class,"codeItemService").getCodeItemByKeyAsc(codeKey);
	}
	
	public static String getCodeNoByKey(String codeKey, String codeName){
		return SourceTemplate.getBean(ICodeItemService.class,"codeItemService").getCodeNoByKey(codeKey,codeName);
	}
}
