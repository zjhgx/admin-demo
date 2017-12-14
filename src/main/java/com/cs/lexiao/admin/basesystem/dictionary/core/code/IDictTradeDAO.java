package com.cs.lexiao.admin.basesystem.dictionary.core.code;

import java.util.List;

import com.cs.lexiao.admin.framework.base.IBaseDAO;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.mapping.basesystem.dictionary.DictTrade;

/**
 * 提供对DictTrade 数据访问功能
 *
 * @author anlw
 */
public interface IDictTradeDAO extends IBaseDAO<DictTrade, Long> {
	
   
	
	public List<DictTrade> findTradeByParentid(Long pid);
    
	
	public List<DictTrade> queryTrade(DictTrade trade ,Page page);
	
	public DictTrade findTradeByCode(String code);
	
	
}
