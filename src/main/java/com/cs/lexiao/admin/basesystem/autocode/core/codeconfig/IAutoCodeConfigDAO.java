package com.cs.lexiao.admin.basesystem.autocode.core.codeconfig;

import java.util.List;

import com.cs.lexiao.admin.framework.base.IBaseDAO;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.framework.exception.DAOException;
import com.cs.lexiao.admin.mapping.basesystem.product.AutoCodeConfig;

/**
 * 编码配置DAO
 * @author alw
 *
 */
public interface IAutoCodeConfigDAO extends IBaseDAO<AutoCodeConfig, Long>{
	
	/**
	 * 根据编码的key查询编码配置
	 * @param codeKey
	 * @param miNod
	 * @return
	 */
	public AutoCodeConfig findByCodeKey(String codeKey) throws DAOException;
	

	/**
	 * 根据编码的key和接入点查询编码配置
	 * @param codeKey
	 * @param miNo
	 * @return
	 * @throws DAOException
	 */
	public AutoCodeConfig findByKeyAndMino(String codeKey,String miNo) throws DAOException;
	/**
	 * 获取接入点的编码配置
	 * @param miNo
	 * @param page
	 * @return
	 */
	public List<AutoCodeConfig> findAutoGenCodesByMiNo(String miNo,Page page) throws DAOException;
}
