package com.cs.lexiao.admin.basesystem.product.core.product;

import com.cs.lexiao.admin.framework.base.IXBaseService;
import com.cs.lexiao.admin.mapping.basesystem.product.ProductAttribute;

/**
 * 
 * IProductAttributeService
 * 
 * @author shentuwy
 * 
 */
public interface IProductAttributeService extends IXBaseService<ProductAttribute> {

	/** 产品属性的key已经存在 */
	public static final String	PRODUCT_ATTRIBUTE_KEY_EXIST_ERROR	= "PRODUCT_ATTRIBUTE_KEY_EXIST_ERROR";
	/** 产品流程属性 */
	public static final String 	PRODUCT_PROCESS_ATTR_CODE			= "SA0001";
	
	
	public ProductAttribute getProductAttributeByCode(String attributeCode);
	
}
