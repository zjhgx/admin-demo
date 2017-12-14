package com.cs.lexiao.admin.framework.interceptor;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Date;

import org.hibernate.EmptyInterceptor;
import org.hibernate.type.Type;

import com.cs.lexiao.admin.framework.base.BaseEntity;
import com.cs.lexiao.admin.framework.base.SessionTool;

/**
 * Hibernate实体对象操作拦截器
 *<br>
 * Spring中配置方式：
 *<bean id="myInterceptor" class="com.upg.fosc.demo.mapping.MyInterceptor" />
  <bean id="sessionFactory" class="org.springframework.orm.hibernate3.LocalSessionFactoryBean">
       <property name="entityInterceptor">   
               <ref bean="myInterceptor"/>   
       </property>  
   <bean> 
 * @author alw
 */
@SuppressWarnings("serial")

public class HibernateEntityInterceptor extends EmptyInterceptor {
	

	
	/**
	 * 当实体进行更新保存时触发该拦截器，进行修改时间的设置
	 * @return boolean  如果用户修改了currentState 将返回true,否则返回false
	 */
	public boolean onFlushDirty(
								Object entity, 
								Serializable id, 
								Object[] currentState, 
								Object[] previousState, 
								String[] propertyNames, 
								Type[] types) {
		boolean result = false;
		
		for(int i=0;i<propertyNames.length;i++)
		{
			String pn = propertyNames[i];
			if(BaseEntity.MODIFY_TIME.equals(pn) || "mtime".equalsIgnoreCase(pn))
			{
				currentState[i]=new Date();
				result = true;
			} else if (BaseEntity.MODIFIER.equals(pn)){
				Long userId = getLogonUserId();
				if (userId != null) {
					currentState[i] = getLogonUserId();
					result = true;
				}
			} else if (BaseEntity.MI_NO.equals(pn)) {
				String miNo = getMiNo();
				if (miNo != null) {
					currentState[i] = miNo;
					result = true;
				}
			}
			if ( currentState[i] != null && currentState[i] instanceof String ) {
				if (((String)currentState[i]).length() == 0) {
					currentState[i] = null;
				}
			}
		}
		return result;
	}
	
	private String getMiNo(){
		String miNo = null;
		if (SessionTool.getUserLogonInfo() != null && SessionTool.getUserLogonInfo().getMiNo() != null) {
			miNo = SessionTool.getUserLogonInfo().getMiNo();
		}
		return miNo;
	}
	
	private Long getLogonUserId(){
		Long result = null;
		if (SessionTool.getUserLogonInfo() != null) {
			result = SessionTool.getUserLogonInfo().getSysUserId();
		}
		return result;
	}
	
	/**
	 * 当实体对象进行新增保存时进行创建时间及更新时间的设定
	 * @return boolean  如果用户修改了state 将返回true,否则返回false
	 */
	public boolean onSave(
							Object entity, 
							Serializable id, 
							Object[] state, 
							String[] propertyNames, 
							Type[] types) {
		boolean result = false;
		Date curTime = new Date();
		for(int i=0;i<propertyNames.length;i++){
			if(BaseEntity.CREATE_TIME.equals(propertyNames[i]) || "ctime".equalsIgnoreCase(propertyNames[i]) ){
				state[i]=curTime;
				result = true;
			} else if (BaseEntity.CREATOR.equals(propertyNames[i])){
				Long userId = getLogonUserId();
				if (userId != null) {
					state[i] = userId;
					result = true;
				}
			} else if(BaseEntity.MODIFY_TIME.equals(propertyNames[i]) || "mtime".equalsIgnoreCase(propertyNames[i]) ){
				state[i]=curTime;
				result = true;
			} else if (BaseEntity.MODIFIER.equals(propertyNames[i])) {
				Long userId = getLogonUserId();
				if (userId != null) {
					state[i] = userId;
					result = true;
				}
			} else if (BaseEntity.MI_NO.equals(propertyNames[i])) {
				String miNo = getMiNo();
				if (miNo != null) {
					state[i] = miNo;
					result = true;
				}
//			} else if (FiPrj.class.equals(entity.getClass()) && BaseEntity.COMBINE_ORDER.equals(propertyNames[i])) {
//				//设置FiPrj表综合排序字段默认值
//				Long combineOrder = 9999999999999L;
//				state[i] = combineOrder;
//				result = true;
			}
			if ( state[i] != null && state[i] instanceof String ) {
				if (((String)state[i]).length() == 0) {
					state[i] = null;
				}
			}
		}
		return result;
	}
	
	private static final DecimalFormat DECIMAL_FORMAT = new DecimalFormat("#.######");
	
	public boolean onLoad(Object entity, Serializable id, Object[] state, String[] propertyNames, Type[] types) {
		boolean result =  false;
		for(int i = 0; i < propertyNames.length; i++){
			Object value = state[i];
			if (value != null && value instanceof BigDecimal) {
				state[i] = new BigDecimal(DECIMAL_FORMAT.format((BigDecimal)value));
			}
		}
		return result;
	}
}
