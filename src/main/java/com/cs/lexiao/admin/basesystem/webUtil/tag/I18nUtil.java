package com.cs.lexiao.admin.basesystem.webUtil.tag;

import java.util.Locale;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.PageContext;

import org.apache.struts2.ServletActionContext;

import com.cs.lexiao.admin.constant.SessionKeyConst;
import com.cs.lexiao.admin.framework.base.SessionTool;
import com.cs.lexiao.admin.util.StringUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.util.LocalizedTextUtil;

/**
 * class description
 * 
 * @author shentuwy
 * @date 2011-12-21
 **/
public class I18nUtil {
	
	public static String getI18nText(String key,PageContext pageContext){
		if(StringUtil.isEmpty(key)) return "";
		if(".".equals(key)) return ".";
		HttpServletRequest httpRequest = (HttpServletRequest)pageContext.getRequest();
		ActionContext actionContext = ServletActionContext.getActionContext(httpRequest);
		if(actionContext != null){
			ActionInvocation ai = actionContext.getActionInvocation();
			if(ai != null){
				Object action = ai.getAction();
				if(action != null){
					String text = "";
					StringTokenizer strToke = new StringTokenizer(key, ",");
					while (strToke.hasMoreElements()) {
						String k = strToke.nextToken();
						Locale locale = (Locale) SessionTool.getAttribute(SessionKeyConst.SESSION_LOCAL);
						if (locale == null) {
							locale = Locale.CHINA;
						}
						String tmp = LocalizedTextUtil.findText(action.getClass(), k, locale);
						if(StringUtil.isEmpty(tmp))
							text = text + k;
						else
						    text = text + tmp;
					}
					if(StringUtil.isEmpty(text))
						return key;
					else
						return text;
				}
			}
		}
		return key;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
