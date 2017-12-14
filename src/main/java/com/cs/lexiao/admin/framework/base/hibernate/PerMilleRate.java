package com.cs.lexiao.admin.framework.base.hibernate;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.hibernate.HibernateException;
import org.hibernate.type.BigDecimalType;

@SuppressWarnings("serial")
public class PerMilleRate extends BigDecimalType {
	private static final BigDecimal	TEN	= new BigDecimal(10);

	@Override
	public void set(PreparedStatement st, BigDecimal value, int index) throws HibernateException, SQLException {
		if (value != null && value instanceof BigDecimal) {
			value = ((BigDecimal) value).multiply(TEN);
		}
		super.set(st,  value, index);
	}

	@Override
	public Object get(ResultSet rs, String name) throws HibernateException, SQLException {
		Object result = super.get(rs, name);
		if (result != null && result instanceof BigDecimal) {
			result = ((BigDecimal) result).divide(TEN, BigDecimal.ROUND_HALF_UP);
		}
		return result;
	}
}
