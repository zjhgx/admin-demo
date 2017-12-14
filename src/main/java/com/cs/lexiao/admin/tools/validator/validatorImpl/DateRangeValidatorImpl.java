/*
 * 源程序名称: DateRangeValidatorImpl.java 
 * 软件著作权: 某某集团股份有限公司 版权所有
 * 系统名称: 某某集团业务系统平台(UBSP)
 * 模块名称：TODO(这里注明模块名称)
 * 
 */

package com.cs.lexiao.admin.tools.validator.validatorImpl;



import java.util.Date;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang.StringUtils;

import com.cs.lexiao.admin.basesystem.busidate.util.BusiDateUtil;
import com.cs.lexiao.admin.tools.validator.Validator;
import com.cs.lexiao.admin.tools.validator.annotation.DateRange;

public class DateRangeValidatorImpl implements Validator<DateRange,Date> {
	DateRange annotation = null;
	Object bean = null;
	boolean containMin = true;
	boolean containMax = true;

	public void init(DateRange annotation,Object bean) {
		this.annotation = annotation;
		this.bean = bean;
		this.containMin = annotation.containMin();
		this.containMax = annotation.containMax();
	}

	public boolean isValidatePass(Date value) throws Exception{
		Date minDt = null;
		Date maxDt = null;
		if(value == null){
			return true;
		}
		if(StringUtils.isNotBlank(annotation.min())){
			minDt = getDate(annotation.min());
			if(containMin){
				if(((Date)value).before(minDt)){
					return false;
				}
			}else{
				if(((Date)value).compareTo(minDt) <= 0){
					return false;
				}
			}
		}
		if(StringUtils.isNotBlank(annotation.max())){
			maxDt = getDate(annotation.max());
			if(containMax){
				if(((Date)value).after(maxDt)){
					return false;
				}
			}else{
				if(((Date)value).compareTo(maxDt) >= 0){
					return false;
				}
			}
		}
		return true;
	}

	private Date getDate(String annotationKey) throws Exception {
		Date minDt;
		if(DateRange.busiDate.equals(annotationKey)){
			minDt = BusiDateUtil.getCurBusiDate();
		}else{
			minDt = (Date) PropertyUtils.getProperty(bean, annotationKey);
		}
		return minDt;
	}
	
	

}
