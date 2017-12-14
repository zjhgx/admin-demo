package com.cs.lexiao.admin.basesystem.webUtil.tag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.Component;
import org.apache.struts2.views.jsp.ui.AbstractUITag;

import com.opensymphony.xwork2.util.ValueStack;

/**
 * 
 * MoneyFormatTag.java
 * 
 * @author shentuwy
 * @date 2012-9-17
 * 
 */
public class CurrencyFormatTag extends AbstractUITag {

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -420217219445859922L;

	/** 小数位数 */
	private int					scale;

	private boolean				wan;

	private String				divisor;

	@Override
	public Component getBean(ValueStack stack, HttpServletRequest req, HttpServletResponse res) {
		return new CurrencyFormat(stack);
	}

	@Override
	protected void populateParams() {
		CurrencyFormat currencyFormat = (CurrencyFormat) component;
		currencyFormat.setValue(value);
		currencyFormat.setScale(scale);
		currencyFormat.setWan(wan);
		currencyFormat.setDivisor(divisor);
	}

	public int getScale() {
		return scale;
	}

	public void setScale(int scale) {
		this.scale = scale;
	}

	public boolean isWan() {
		return wan;
	}

	public void setWan(boolean wan) {
		this.wan = wan;
	}

	public String getDivisor() {
		return divisor;
	}

	public void setDivisor(String divisor) {
		this.divisor = divisor;
	}
	
}
