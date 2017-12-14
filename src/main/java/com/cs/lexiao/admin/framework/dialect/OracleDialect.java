package com.cs.lexiao.admin.framework.dialect;

import java.sql.Types;

import org.hibernate.Hibernate;
import org.hibernate.dialect.Oracle10gDialect;
import org.hibernate.dialect.function.SQLFunctionTemplate;

public class OracleDialect extends Oracle10gDialect {
	public OracleDialect() {
		super();
		registerFunction("convert_gbk", new SQLFunctionTemplate(Hibernate.STRING, "convert(?1 using gbk)"));
		registerHibernateType(Types.NUMERIC, Hibernate.BIG_DECIMAL.getName());
		registerHibernateType(Types.LONGVARCHAR, Hibernate.STRING.getName());
	}
}
