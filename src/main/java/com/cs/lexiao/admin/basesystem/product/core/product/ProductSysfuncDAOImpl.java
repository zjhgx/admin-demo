package com.cs.lexiao.admin.basesystem.product.core.product;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cs.lexiao.admin.constant.ErrorCodeConst;
import com.cs.lexiao.admin.framework.base.BaseDAO;
import com.cs.lexiao.admin.framework.exception.DAOException;
import com.cs.lexiao.admin.framework.exception.ExceptionManager;
import com.cs.lexiao.admin.mapping.basesystem.product.ProductSysfunc;
import com.cs.lexiao.admin.mapping.basesystem.security.Sysfunc;

/**
 * 
 * ProductSysfuncDAOImpl
 *
 * @author shentuwy
 *
 */
@SuppressWarnings("unchecked")
public class ProductSysfuncDAOImpl extends BaseDAO<ProductSysfunc, Long> implements IProductSysfuncDAO {

	public Class<ProductSysfunc> getEntityClass() {
		return ProductSysfunc.class;
	}

	public List<Sysfunc> getSysfuncByProduct(Long productId) {
		List<Sysfunc> ret = null;
		if( productId != null ){
			String hql = "select sf from ProductSysfunc ps,Sysfunc sf where ps.funcId=sf.funcId and ps.productId=?";
			ret = getHibernateTemplate().find(hql, productId);
		}
		return ret == null ? Collections.EMPTY_LIST : ret;
	}

	public boolean hasProductRefFunc(Long funcId) throws DAOException {
		String hql="select count(*) from ProductSysfunc t where t.funcId=:funcId";
		try{/////////
			int count=0;
			Map<String, Object> parameterMap = new HashMap<String, Object>(1);
			parameterMap.put("funcId", funcId);
			List list = super.queryByParam(hql, parameterMap, null);
			count=Integer.parseInt(""+list.get(0));
			return count>0;
		}catch(Exception e){
			ExceptionManager.throwException(DAOException.class, ErrorCodeConst.DB_OPERATION_ERROR, new String[]{hql}, e);
		}
		return false;
	}

}
