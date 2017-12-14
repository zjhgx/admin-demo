/*
 * 源程序名称: SizeValidatorImpl.java 
 * 软件著作权: 某某集团股份有限公司 版权所有
 * 系统名称: 某某集团业务系统平台(UBSP)
 * 模块名称：TODO(这里注明模块名称)
 * 
 */

package com.cs.lexiao.admin.tools.validator.validatorImpl;

import java.util.Arrays;
import java.util.Collection;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.cs.lexiao.admin.tools.validator.Validator;
import com.cs.lexiao.admin.tools.validator.annotation.Size;

public class SizeValidatorImpl implements Validator<Size,Object> {
	private Size annotation;

	public void init(Size annotation,Object bean) {
		this.annotation = annotation;

	}

	@SuppressWarnings("unchecked")
	public boolean isValidatePass(Object value) {
		if(value == null){
			return true;
		}
		if(value instanceof String){
			return compare(((String)value).trim().getBytes().length);
		}else if(value instanceof Map ){
			return compare(((Map)value).size());
		}else if(value instanceof Collection && ((Collection)value).size() == 0){
			return compare(((Collection)value).size());
		}else if(value.getClass().isArray()){
			return compare(Arrays.asList(value).size());
		}
		return false;
	}
	
	private boolean compare(int size){
		int min;
		int max;
		if(StringUtils.isNotBlank(annotation.min())){
			min = Integer.parseInt(annotation.min());
			if(size < min){
				return false;
			}
		}
		if(StringUtils.isNotBlank(annotation.max())){
			max = Integer.parseInt(annotation.max());
			if(size > max){
				return false;
			}
		}
		return true;
	}

}
