package com.cs.lexiao.admin.framework.base;

import java.util.Collections;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 * @author shentuwy
 * 
 */
public abstract class BaseService implements IBaseService {

	public final static Logger logger = LoggerFactory.getLogger(BaseService.class);

	@SuppressWarnings("rawtypes")
	protected static final List	SERVICE_EMPTY_LIST	= Collections.emptyList();

}
