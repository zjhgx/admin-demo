package com.cs.lexiao.admin.framework.base;

import java.util.Map;

import org.apache.commons.beanutils.LazyDynaMap;

/**
* 用于动态Bean的封装，具体使用参照LazyDynaMap
* @author alw
* @version 1.0 2011/04/08
* 某某集团股份有限公司版权所有.
*/

public class HsDynaBean extends LazyDynaMap{
	
	public HsDynaBean(Map map)
	{
		super(map);
	}
	public HsDynaBean()
	{
		super();
	}
}
