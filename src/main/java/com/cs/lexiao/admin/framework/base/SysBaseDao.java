package com.cs.lexiao.admin.framework.base;

import java.io.Serializable;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;

public abstract class SysBaseDao<T, PK extends Serializable> extends BaseDAO<T, PK> {

	private HibernateTemplate	sysHibernateTemplate;
	private HibernateTemplate	sysOracleHibernateTemplate;

	@Resource(name = "sysHibernateTemplate")
	public void setSysHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.sysHibernateTemplate = hibernateTemplate;
	}
	/*@Resource(name = "sysOracleHibernateTemplate")
	public void setSysOracleHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.sysOracleHibernateTemplate = hibernateTemplate;
	}*/

	protected void initDao() throws Exception {
		super.initDao();
		if (sysHibernateTemplate != null) {
			super.setHibernateTemplate(sysHibernateTemplate);
		}/*else if (sysOracleHibernateTemplate != null) {
			super.setHibernateTemplate(sysOracleHibernateTemplate);
		}*/
	}

}
