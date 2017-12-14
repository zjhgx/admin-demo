package com.cs.lexiao.admin.framework.base;

import java.io.Serializable;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;

public class BusinessBaseDao<T, PK extends Serializable> extends BaseDAO<T, PK>{
	
	private HibernateTemplate	cloudHibernateTemplate;

	@Resource(name = "cloudHibernateTemplate")
	public void setCloudHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.cloudHibernateTemplate = hibernateTemplate;
	}

	protected void initDao() throws Exception {
		super.initDao();
		if (cloudHibernateTemplate != null) {
			super.setHibernateTemplate(cloudHibernateTemplate);
		}
	}

}
