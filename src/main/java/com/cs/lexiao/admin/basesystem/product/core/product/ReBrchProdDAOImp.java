package com.cs.lexiao.admin.basesystem.product.core.product;

import com.cs.lexiao.admin.framework.base.BaseDAO;
import com.cs.lexiao.admin.mapping.basesystem.product.ReBrchProd;

public class ReBrchProdDAOImp extends BaseDAO<ReBrchProd, Long> implements IReBrchProdDAO {

	@Override
	public Class getEntityClass() {
		return ReBrchProd.class;
	}

	
}
