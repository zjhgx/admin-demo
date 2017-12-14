package com.cs.lexiao.admin.basesystem.product.core.product;

import com.cs.lexiao.admin.framework.base.IBaseDAO;
import com.cs.lexiao.admin.mapping.basesystem.product.ProductAttribute;

/**
 * 
 * IProductAttributeDAO
 * 
 * @author shentuwy
 * 
 */
public interface IProductAttributeDAO extends IBaseDAO<ProductAttribute, Long> {
	
	public ProductAttribute getProductAttributeByCode(String attributeCode);

}
