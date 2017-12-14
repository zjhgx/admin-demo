package com.cs.lexiao.admin.basesystem.product.core.product;

import java.util.List;

import com.cs.lexiao.admin.framework.base.IBaseDAO;
import com.cs.lexiao.admin.framework.exception.DAOException;
import com.cs.lexiao.admin.mapping.basesystem.product.ProductSysfunc;
import com.cs.lexiao.admin.mapping.basesystem.security.Sysfunc;

/**
 * 
 * IProductSysfuncDAO
 *
 * @author shentuwy
 *
 */
public interface IProductSysfuncDAO extends IBaseDAO<ProductSysfunc, Long> {

	/**
	 * 
	 * 获取权限列表
	 *
	 * @param productId
	 * @return
	 */
	public List<Sysfunc> getSysfuncByProduct(Long productId);
	
	/**
	 * 是否有产品引用权限
	 * @param funcId 
	 * @return true:有 false:无
	 * @throws DAOException
	 */
	public boolean hasProductRefFunc(Long funcId) throws DAOException;
	
}
