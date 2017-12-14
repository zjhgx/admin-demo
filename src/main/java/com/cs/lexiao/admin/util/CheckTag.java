package com.cs.lexiao.admin.util;

import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import com.cs.lexiao.admin.basesystem.security.core.sysfunc.ISysfuncService;
import com.cs.lexiao.admin.constant.BeanNameConstants;
import com.cs.lexiao.admin.framework.base.SessionTool;
import com.cs.lexiao.admin.mapping.basesystem.security.Sysfunc;
import com.cs.lexiao.admin.model.security.UserLogonInfo;

/**
 * <p>Description:CheckTag 检测按钮是否有权限</p>
 * <p>Create Time:2015-6-16</p>
 * @author yangyong
 *
 */
public class CheckTag extends TagSupport{
	
	private static final long serialVersionUID = 1L;

	private String butId;
	
	private static ISysfuncService sysfuncService = SourceTemplate.getBean(ISysfuncService.class, BeanNameConstants.SYSFUNC_SERVICE);
	
	@Override
	public int doStartTag() throws JspException {
		// 1、获取页面的模块id，及操作的url  
        // 2、获取session中的权限信息pageContext.getAttribute("session");  
        // 3、判断如果没有此权限则不显示操作按钮  
        // 可以根据权限判断是否显示操作  
        if (checkPermit()) {  
            // 有此权限则显示  
            return EVAL_PAGE;  
        }  
        // 没有权限则不显示  
        return SKIP_BODY; 
	}
	
	/**
	 * 检测按钮是否有权限
	 * @return
	 */
	private boolean checkPermit(){
		boolean flag = false;
		if(isBlank(butId)){
			return flag;
		}

		UserLogonInfo logonInfo=SessionTool.getUserLogonInfo();
		String funcId = pageContext.getRequest().getParameter("funcId");

		//通过获取子节点的url，扫描全局获取是否权限//不是最佳方式
		//flag = sysfuncService.hasResourcePermission(logonInfo.getRoleList(), butId);
		
		//通过获取子节点的英文名称，扫描该节点是否拥有按钮权限
		List<Sysfunc> nodes=sysfuncService.getSubMenuButton(logonInfo,Long.valueOf(funcId));
		for(Sysfunc node:nodes){
			if("button".equals(node.getUrl())){
				String nameKey=node.getFuncNameKey();//update、query
//				String funcName=node.getFuncName();//修改、查询
			    if(!isBlank(nameKey) && butId.equals(nameKey.trim())){
			    	flag = true;
			    	break;
			    }
			}
		}

		return flag;
	}
	
	public static boolean isBlank(String str) {
		return (str == null) || (str.trim().length() == 0);
	}

	public String getButId() {
		return butId;
	}
	public void setButId(String butId) {
		this.butId = butId;
	}

}
