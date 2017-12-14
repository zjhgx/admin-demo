/*
 * 源程序名称: IDictTradeService.java 
 * 软件著作权: 某某集团股份有限公司 版权所有
 * 系统名称: UPG业务服务平台(UBSP)
 * 模块名称：数据字典-行业
 * 
 */

package com.cs.lexiao.admin.basesystem.dictionary.core.code;


import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.framework.exception.ServiceException;
import com.cs.lexiao.admin.mapping.basesystem.dictionary.DictTrade;

public interface IDictTradeService {

	/**
	 * 建立行业类别树
	 * @param ttc 行业类别
	 * @param parentId 父id
	 * @param args 级别或其他String类型参数
	 * @return 层级行业树
	 */
	public String createTree(DictTrade ttc, Page page, String... args) throws ServiceException;
	
	public DictTrade findTradeByCode(String code);
	
	public DictTrade getDictTradeById(Long id);
}
