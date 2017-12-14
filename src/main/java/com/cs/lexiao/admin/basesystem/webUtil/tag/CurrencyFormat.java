package com.cs.lexiao.admin.basesystem.webUtil.tag;

import java.io.Writer;
import java.math.BigDecimal;
import java.text.DecimalFormat;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.components.Component;

import com.opensymphony.xwork2.util.ValueStack;

/**
 * 
 * MoneyFormat.java
 * 
 * @author shentuwy
 * @date 2012-9-17
 * 
 */
public class CurrencyFormat extends Component {

	private static final String			CURRENCY_FORMAT_PARTERN_INTEGER	= "###,###,###,###";

	private static final DecimalFormat	DECIMAL_FORMAT					= new DecimalFormat(
																				CURRENCY_FORMAT_PARTERN_INTEGER + ".##");

	private String						value;

	private int							scale;

	private boolean						wan;

	private String						divisor;

	public CurrencyFormat(ValueStack stack) {
		super(stack);
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
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
	
	// ==============================================

	@Override
	public boolean start(Writer writer) {
		if (StringUtils.isNotBlank(value)) {
			Object val = findValue(value);
			try {
				if (val instanceof String) {
					val = new BigDecimal((String) val);
				} else if (val instanceof Number && !(val instanceof BigDecimal)) {
					val = new BigDecimal(val.toString());
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			if (val instanceof BigDecimal) {
				
				if (StringUtils.isNotBlank(divisor)) {
					try{
						val = ((BigDecimal) val).divide(new BigDecimal(divisor),6,BigDecimal.ROUND_HALF_DOWN);
					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}
				
				String valStr = null;
				if (wan) {
					val = ((BigDecimal)(val)).divide(new BigDecimal(10000),6,BigDecimal.ROUND_HALF_DOWN);
				}
				try {
					DecimalFormat decimalFormat = DECIMAL_FORMAT;
					if (scale > 0 && scale != 2) {
						String pattern = CURRENCY_FORMAT_PARTERN_INTEGER + ".";
						for (int i = 0; i < scale; i++) {
							pattern += "#";
						}
						decimalFormat = new DecimalFormat(pattern);
					}
					valStr = decimalFormat.format(val);
					if (StringUtils.isNotBlank(valStr)) {
						writer.write(valStr);
					}
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
		return false;
	}

}
