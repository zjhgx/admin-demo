package com.cs.lexiao.admin.basesystem;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang.StringUtils;

import com.cs.lexiao.admin.basesystem.dictionary.util.DictionaryUtil;
import com.cs.lexiao.admin.basesystem.product.core.product.IProductAttributeService;
import com.cs.lexiao.admin.basesystem.product.core.product.IProductService;
import com.cs.lexiao.admin.basesystem.security.core.branch.IBranchService;
import com.cs.lexiao.admin.basesystem.security.core.role.IRoleService;
import com.cs.lexiao.admin.basesystem.security.core.sysfunc.ISysfuncService;
import com.cs.lexiao.admin.basesystem.security.core.sysparam.ISysParamService;
import com.cs.lexiao.admin.basesystem.security.core.user.IUserDAO;
import com.cs.lexiao.admin.basesystem.security.core.user.IUserService;
//import com.cs.lexiao.admin.bpm.core.IUcarsProcessService;
import com.cs.lexiao.admin.constant.BeanNameConstants;
import com.cs.lexiao.admin.constant.ErrorCodeConst;
import com.cs.lexiao.admin.framework.base.BaseEntity;
import com.cs.lexiao.admin.framework.base.ICommonDAO;
import com.cs.lexiao.admin.framework.base.SessionTool;
//import com.cs.lexiao.admin.framework.bpm.base.Formatable;
//import com.cs.lexiao.admin.framework.bpm.base.TaskTraceInfoFormat;
//import com.cs.lexiao.admin.framework.bpm.tasktrace.service.ITaskTraceInfoService;
import com.cs.lexiao.admin.framework.exception.ActionException;
import com.cs.lexiao.admin.framework.exception.DAOException;
import com.cs.lexiao.admin.framework.exception.ExceptionManager;
import com.cs.lexiao.admin.framework.exception.ServiceException;
import com.cs.lexiao.admin.mapping.basesystem.product.ProductAttribute;
import com.cs.lexiao.admin.mapping.basesystem.product.ProductInfo;
import com.cs.lexiao.admin.mapping.basesystem.security.Branch;
import com.cs.lexiao.admin.mapping.basesystem.security.Buser;
import com.cs.lexiao.admin.mapping.basesystem.security.Role;
import com.cs.lexiao.admin.mapping.basesystem.security.Sysfunc;
//import com.cs.lexiao.admin.mapping.framework.bpm.TaskTraceInfo;
import com.cs.lexiao.admin.model.security.UserLogonInfo;
import com.cs.lexiao.admin.tools.template.TemplateEngine;
import com.cs.lexiao.admin.util.SourceTemplate;
import com.opensymphony.xwork2.ActionContext;

public class UcarsHelper {

	private static IProductAttributeService	productAttributeService	= SourceTemplate
																			.getBean(
																					IProductAttributeService.class,
																					BeanNameConstants.PRODUCT_ATTRIBUTE_SERVICE);
	private static IUserDAO					userDAO					= SourceTemplate.getBean(IUserDAO.class, "userDAO");

	private static IRoleService				roleService				= SourceTemplate.getBean(IRoleService.class,
																			BeanNameConstants.ROLE_SERVICE);

	private static ISysParamService			sysParamService			= SourceTemplate.getBean(ISysParamService.class,
																			BeanNameConstants.SYS_PARAM_SERVICE);

	private static ISysfuncService			sysfuncService			= SourceTemplate.getBean(ISysfuncService.class,
																			BeanNameConstants.SYSFUNC_SERVICE);
	
//	private static IRiskCreditDao         riskCreditDao          = SourceTemplate.getBean(IRiskCreditDao.class,
//            BeanNameConstants.IRiskCreditDao);

	/**
	 * 判断当前登录用户是否有resourceId权限
	 * 
	 * @param resourceId
	 * @return
	 */
	public static final boolean hasResourcePermission(String resourceId) {
		boolean result = false;
		List<Long> roleIdList = null;
		UserLogonInfo uli = SessionTool.getUserLogonInfo();
		if (uli != null) {
			roleIdList = uli.getRoleList();
		}
		if (roleIdList != null && roleIdList.size() > 0) {
			result = SourceTemplate.getBean(ISysfuncService.class, BeanNameConstants.SYSFUNC_SERVICE)
					.hasResourcePermission(roleIdList, resourceId);
		}
		return result;
	}

	/**
	 * 判断用户是否有哪个角色名
	 * 
	 * @param userId
	 *            用户ID
	 * @param roleName
	 *            角色名称
	 * @return
	 */
	public static final boolean hasRoleNameByUserId(Long userId, String roleName) {
		boolean result = false;
		if (userId != null && StringUtils.isNotBlank(roleName)) {
			List<Role> roleList = userDAO.getAllredCheckedRolesByUserId(userId);
			if (roleList != null && roleList.size() > 0) {
				for (Role role : roleList) {
					if (StringUtils.equals(roleName, role.getRoleName())) {
						result = true;
						break;
					}
				}
			}
		}
		return result;
	}

	/**
	 * 返回产品属性转化后的值
	 * 
	 * @param productCode
	 * @param attributeCode
	 * @return
	 */
	public static final String getProductAttributeTransformedValue(String productCode, String attributeCode) {
		String result = getProductAttributeValue(productCode, attributeCode);
		if (StringUtils.isNotBlank(result)) {
			ProductAttribute attribute = productAttributeService.getProductAttributeByCode(attributeCode);
			if (attribute != null && StringUtils.isNotBlank(attribute.getCodeMetaKey())) {
				result = DictionaryUtil.getCodeNameByKey(attribute.getCodeMetaKey(), result);
			}
		}
		return result;
	}

	/**
	 * 返回产品属性的原生值
	 * 
	 * @param productCode
	 * @param attributeCode
	 * @return
	 */

	public static final String getProductAttributeValue(String productCode, String attributeCode) {
		String result = null;
		IProductService productService = getProductService();
		if (StringUtils.isNotBlank(productCode) && StringUtils.isNotBlank(attributeCode)) {
			ProductInfo product = productService.getProductByProdNo(productCode);
			if (product != null) {
				UserLogonInfo uli = SessionTool.getUserLogonInfo();
				if (uli != null) {
					result = productService.getAttributeValue(uli.getMiNo(), productCode, attributeCode);
				}
			}
		}
		return result;
	}

	/**
	 * 获取freemark引擎
	 * 
	 * @return
	 */
	public static final TemplateEngine getFreeMarkerTemplateEngine() {
		TemplateEngine result = SourceTemplate.getBean(TemplateEngine.class, "freeMarkerTemplateEngine");
		return result;
	}

	/**
	 * 用户服务
	 * 
	 * @return
	 */
	public static IUserService getUserService() {
		return SourceTemplate.getBean(IUserService.class, BeanNameConstants.USER_SERVICE);
	}

	/**
	 * 流程服务
	 * 
	 * @return
	 */
//	public static IUcarsProcessService getUcarsProcessService() {
//		return SourceTemplate.getBean(IUcarsProcessService.class, BeanNameConstants.UCARS_PROCESS_SERVICE);
//	}

	/**
	 * 当前用户是否有roleName的角色
	 * 
	 * @param roleName
	 * @return
	 */
	public static final boolean hasRoleName(String roleName) {
		boolean result = false;
		if (StringUtils.isNotBlank(roleName)) {
			UserLogonInfo uli = SessionTool.getUserLogonInfo();
			if (uli != null) {
				List<Long> roleIdList = uli.getRoleList();
				if (roleIdList != null && roleIdList.size() > 0) {
					for (Long roleId : roleIdList) {
						Role role = roleService.getRoleById(roleId);
						if (role != null && StringUtils.equals(roleName, role.getRoleName())) {
							result = true;
						}
					}
				}
			}
		}
		return result;
	}

	/**
	 * 返回参数值
	 * 
	 * @param paramKey
	 * @return
	 */
	public static final String getSysParamValue(String paramKey) {
		String result = null;
		if (StringUtils.isNotBlank(paramKey)) {
			UserLogonInfo uli = SessionTool.getUserLogonInfo();
			if (uli != null) {
				result = sysParamService.getSysParamValueByKey(uli.getMiNo(), paramKey);
			} else {
				result = sysParamService.getSysParamValueByKey(null, paramKey);
			}
		}
		return result;
	}


	public static final String getSysParamName(String paramKey) {
		String result = null;
		if (StringUtils.isNotBlank(paramKey)) {
			UserLogonInfo uli = SessionTool.getUserLogonInfo();
			if (uli != null) {
				result = sysParamService.getSysParamNameByKey(uli.getMiNo(), paramKey);
			} else {
				result = sysParamService.getSysParamNameByKey(null, paramKey);
			}
		}
		return result;
	}



	/**
	 * 返回参数值
	 * 
	 * @param paramKey
	 * @param miNo
	 * @return
	 */
	public static final String getSysParamValue(String paramKey, String miNo) {
		String result = null;
		if (StringUtils.isNotBlank(paramKey)) {
			result = sysParamService.getSysParamValueByKey(miNo, paramKey);
		}
		return result;
	}

	/**
	 * 获取登录者的所有权限
	 * 
	 * @return
	 */
	public static final List<Sysfunc> getCurrentUserSysfunc() {
		List<Sysfunc> result = new ArrayList<Sysfunc>();
		UserLogonInfo uli = SessionTool.getUserLogonInfo();
		if (uli != null) {
			result = sysfuncService.getUserFunc(uli);
		}
		return result;
	}

	/**
	 * 获取登录者的功能点权限
	 * 
	 * @return
	 */
	public static final List<Sysfunc> getCurrentUserFuncSysfunc() {
		List<Sysfunc> result = new ArrayList<Sysfunc>();
		List<Sysfunc> allSysfunc = getCurrentUserSysfunc();
		if (allSysfunc != null && allSysfunc.size() > 0) {
			for (Sysfunc sf : allSysfunc) {
				if (StringUtils.equals(Sysfunc.FUNC_TYPE_FUNC, sf.getFuncType())) {
					result.add(sf);
				}
			}
		}
		return result;
	}

	public static final void throwServiceException(String message) {
		throwException(ServiceException.class, message);
	}
	
	public static final void throwServiceException(Exception ex, String message) {
		throw new RuntimeException(message, ex);
	}

	public static final void throwServiceException(Throwable ta, String message) {
		throw new RuntimeException(message, ta);
	}

	public static final void throwActionException(String message) {
		throwException(ActionException.class, message);
	}

	public static final void throwDAOException(String message) {
		throwException(DAOException.class, message);
	}

	public static final <T extends Throwable> void throwException(Class<T> exception, String message) {
		if (message == null) {
			message = "";
		}
		ExceptionManager.throwException(exception, ErrorCodeConst.COMMON_ERROR_CODE, message);
	}

	public static final List<Long> translateLongList(List<? extends Number> list) {
		List<Long> result = new ArrayList<Long>();
		if (list != null && !list.isEmpty()) {
			for (Number n : list) {
				Long value = n.longValue();
				result.add(value);
			}
		}
		return result;
	}

	/**
	 * 获取产品服务类
	 * 
	 * @return
	 */
	public static final IProductService getProductService() {
		return getBean(IProductService.class, BeanNameConstants.PRODUCT_SERVICE);
	}

	/**
	 * 获取Bean实例
	 * 
	 * @param clazz
	 *            返回类型
	 * @param beanName
	 *            bean名字
	 * @return
	 */
	public static final <T> T getBean(Class<T> clazz, String beanName) {
		return SourceTemplate.getBean(clazz, beanName);
	}

	/**
	 * 获取Bean
	 * 
	 * @param clazz
	 * @return
	 */
	public static final <T> T getBean(Class<T> clazz) {
		return SourceTemplate.getBean(clazz);
	}

	/**
	 * 获取用户名称
	 * 
	 * @param userId
	 * @return
	 */
	public static final String getUserName(Long userId) {
		String result = null;
		if (userId != null) {
			Buser user = getUserService().getUserById(userId);
			if (user != null) {
				result = user.getUserName();
			}
		}
		return result;
	}

	/**
	 * 获取机构名称
	 * 
	 * @param brchId
	 * @return
	 */
	public static final String getBrchName(Long brchId) {
		String result = null;
		if (brchId != null) {
			IBranchService branchService = getBean(IBranchService.class, BeanNameConstants.BRANCH_SERVICE);
			Branch branch = branchService.getBranchByBrchId(brchId);
			if (branch != null) {
				result = branch.getBrchName();
			}
		}
		return result;
	}

	/**
	 * 仅适合于要更新的实体对象
	 * 
	 * @param object
	 * @return
	 */
	public static final <T extends BaseEntity> T convertUpdateObject(T object, String varName) {
		T result = null;
		if (object != null && StringUtils.isNotBlank(varName)) {
			BaseEntity entity = (BaseEntity) object;
			Long id = entity.getId();
			ICommonDAO commonDao = getBean(ICommonDAO.class, BeanNameConstants.COMMON_DAO);
			List<BaseEntity> existEntityList = commonDao.find("from " + object.getClass().getName() + " where id=?",
					new Object[] { id });
			if (existEntityList != null && existEntityList.size() > 0 && existEntityList.size() == 1) {
				result = (T) existEntityList.get(0);
				Map<String, Object> requestMap = ActionContext.getContext().getParameters();
				Class<?> cls = object.getClass();
				Field[] fields = cls.getDeclaredFields();
				if (fields != null && fields.length > 0) {
					try {
						for (Field f : fields) {
							String fieldName = f.getName();
							String path = varName + "." + fieldName;

							if (requestMap.containsKey(path)) {
								Object value = PropertyUtils.getProperty(object, fieldName);
								PropertyUtils.setProperty(result, fieldName, value);
							}
						}
					} catch (Exception ex) {
						throw new RuntimeException(ex);
					}

				}
			}
		}
		return result;
	}

	/**
	 * format所有审批意见
	 * 
	 * @param list
	 */
//	public static List<TaskTraceInfo> getAllLeaderAuditHistory(Long instanceBusinessId) {
//		ITaskTraceInfoService taskTraceInfoService = SourceTemplate.getBean(ITaskTraceInfoService.class,
//				"taskTraceInfoService");
//		List<TaskTraceInfo> taskTraceList = taskTraceInfoService.getInstanceTaskTraceInfoList(instanceBusinessId);
//		try {
//			processTaskTraceInfo(taskTraceList);
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		return taskTraceList;
//	}
//
//	private static void processTaskTraceInfo(List<TaskTraceInfo> list) throws Exception {
//		if (list != null && list.size() > 0) {
//			for (Iterator<TaskTraceInfo> it = list.iterator(); it.hasNext();) {
//				TaskTraceInfo tti = it.next();
//				TaskTraceInfoFormat ttif = null;
//				if (StringUtils.isNotBlank(tti.getBusinessData()) && StringUtils.isNotBlank(tti.getBusinessType())) {
//					Class<?> clazz = Class.forName(tti.getBusinessType());
//					Object obj = JsonUtils.string2Object(tti.getBusinessData(), clazz);
//					String businessFormatMessage = StringUtils.EMPTY;
//					if (obj instanceof Collection<?>) {
//						Collection<?> collection = (Collection<?>) obj;
//						for (Object o : collection) {
//							if (o instanceof TaskTraceInfoFormat) {
//								ttif = (TaskTraceInfoFormat) o;
//							}
//							businessFormatMessage += appendHtmlBr(getFormatString(o));
//						}
//					} else {
//						businessFormatMessage = getFormatString(obj);
//						if (obj instanceof TaskTraceInfoFormat) {
//							ttif = (TaskTraceInfoFormat) obj;
//						}
//					}
//					if (StringUtils.isNotBlank(businessFormatMessage)) {
//						if (StringUtils.isNotBlank(tti.getRemark())) {
//							tti.setBusinessFormatMessage(appendHtmlBr(businessFormatMessage));
//						} else {
//							tti.setBusinessFormatMessage(businessFormatMessage);
//						}
//					}
//				}
//
//				String remark = StringUtils.EMPTY;
//				if (ttif != null) {
//					remark += ttif.getRemarkPreFix();
//				}
//				if (StringUtils.isNotBlank(tti.getRemark())) {
//					remark += StringUtil.convertHTML(tti.getRemark());
//				}
//				tti.setRemark(remark);
//			}
//		}
//	}

	private static final String appendHtmlBr(String str) {
		String result = str;
		if (result != null) {
			result += "<br/>";
		}
		return result;
	}

//	private static String getFormatString(Object obj) {
//		String ret = null;
//		if (obj != null) {
//			if (obj instanceof Formatable) {
//				ret = ((Formatable) obj).format();
//			}
//		}
//		if (ret == null) {
//			ret = StringUtils.EMPTY;
//		}
//		return ret;
//	}

	private static final ThreadPoolExecutor	THREAD_POOL_EXECUTOR	= new ThreadPoolExecutor(15, 350, 30l,
																			TimeUnit.MINUTES,
																			new ArrayBlockingQueue<Runnable>(100),
																			new ThreadPoolExecutor.CallerRunsPolicy());
	/**
	 * 提交需要异步执行的动作
	 *  
	 */
	public static final void asyncExecute(Runnable command) {
		THREAD_POOL_EXECUTOR.execute(command);
	}
	
	/**    
	   
	 * computePlatFee(计算平台管理费) 
	
	 * @param carLoan
	 * @return String   
	   
	 * @throws    
	   
	 * @since    
	   
	*/
//	public static String computePlatFee(FiPrj fiPrj) {
//	    // 计算贷款年化利率
//	    BigDecimal rate = fiPrj.getRate();
//	    String rateType = fiPrj.getRateType();
//	    if ("day".equals(rateType)) {
//	        rate = rate.multiply(BigDecimal.valueOf(36.5));
//	    } else if("month".equals(rateType)) {
//	        rate = rate.multiply(BigDecimal.valueOf(12));
//	    }
//	    
//	    
//	    // 计算平台管理费
//	    RiskCredit riskCredit = riskCreditDao.getCreditAmountByGuranId(fiPrj.getPublishInstId());
//	    BigDecimal packagePrice = riskCredit.getPackagePrice();
//	    if (packagePrice == null) {
//	        UcarsHelper.throwServiceException("发布机构打包价格未设定");
//	    }
//	    BigDecimal platFeeRate = (packagePrice.subtract(rate));
//	    BigDecimal loanAmount = fiPrj.getDemandAmount();
//	    BigDecimal platFee = null;
//	    // 计算贷款周期(以天为周期)
//        int timeLimit = fiPrj.getTimeLimit();
//        String timeUnit = fiPrj.getTimeLimitUnit();
//        if ("day".equals(timeUnit)) {
//            platFee = ((loanAmount.multiply(platFeeRate)).multiply(BigDecimal.valueOf(timeLimit))).divide(BigDecimal.valueOf(36500), 2, BigDecimal.ROUND_HALF_UP);
//        } else if ("month".equals(timeUnit)) {
//            platFee = ((loanAmount.multiply(platFeeRate)).multiply(BigDecimal.valueOf(timeLimit))).divide(BigDecimal.valueOf(1200), 2, BigDecimal.ROUND_HALF_UP);
//        } else if ("year".equals(timeUnit)) {
//            platFee = ((loanAmount.multiply(platFeeRate)).multiply(BigDecimal.valueOf(timeLimit))).divide(BigDecimal.valueOf(100), 2, BigDecimal.ROUND_HALF_UP);
//        }
//	    
//	    // 格式化，保留二位小数
//	    DecimalFormat df = new DecimalFormat("0.##");
//	    return df.format(platFee);
//	}

}
