package com.cs.lexiao.admin.framework.dialect;


import org.hibernate.Hibernate;
import org.hibernate.dialect.MySQL5Dialect;
import org.hibernate.dialect.function.SQLFunctionTemplate;

public class MySQLDialect extends MySQL5Dialect {

	public MySQLDialect() {
		super();
		registerFunction("convert_gbk", new SQLFunctionTemplate(Hibernate.STRING, "convert(?1 using gbk)"));
	}

}
