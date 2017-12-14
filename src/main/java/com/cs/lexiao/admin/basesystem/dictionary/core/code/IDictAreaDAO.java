package com.cs.lexiao.admin.basesystem.dictionary.core.code;

import java.util.List;

import com.cs.lexiao.admin.framework.base.IBaseDAO;
import com.cs.lexiao.admin.mapping.basesystem.dictionary.DictArea;



/**
 * 提供对DictArea 数据访问功能
 *
 * @author anlw
 */
public interface IDictAreaDAO extends IBaseDAO<DictArea, Long> {
	
	/**
    * 获取身份列表
    * @param pid
    * @return
    */
    public List<DictArea> getProvinceList();
   /**
    * 获取父级区域下的子区域
    * @param pid
    * @return
    */
    public List<DictArea> getAreaListByPid(Long pid);
    /**
     * 根据Code获取地区
     * @param pid
     * @return
     */
    public List<DictArea> getAreaListByCode(String code);
	
    
}
