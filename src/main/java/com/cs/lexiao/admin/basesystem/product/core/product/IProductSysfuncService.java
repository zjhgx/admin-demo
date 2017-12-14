package com.cs.lexiao.admin.basesystem.product.core.product;

import java.util.List;

import com.cs.lexiao.admin.framework.base.IXBaseService;
import com.cs.lexiao.admin.mapping.basesystem.product.ProductSysfunc;
import com.cs.lexiao.admin.mapping.basesystem.security.Sysfunc;

/**
 * 
 * IProductSysfuncService
 *
 * @author shentuwy
 *
 */
public interface IProductSysfuncService extends IXBaseService<ProductSysfunc> {
	
	/**
	 * 
	 * 获取权限列表
	 *
	 * @param productId
	 * @return
	 */
	public List<Sysfunc> getSysfuncByProduct(Long productId);
	
	/**
	 * 
	 * 产品分配权限
	 *
	 * @param productId
	 * @param funcIdList
	 */
	public void assignSysfuncForProduct(Long productId,List<Long> funcIdList);
	

}
