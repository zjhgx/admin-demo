package com.cs.lexiao.admin.framework.rules.runtime.execute;

import java.util.List;

import com.cs.lexiao.admin.framework.rules.context.ContextInfo;
import com.cs.lexiao.admin.framework.rules.context.ResultInfo;
import com.cs.lexiao.admin.framework.rules.runtime.RuleInstance;

/**
 * 执行器
 *
 * @author shentuwy
 */
public class ExecuteProcessor {
	/**
	 * 执行规则动作
	 * @param context
	 * @param riList
	 * @return
	 */
	public static ResultInfo execute(ContextInfo context, List<RuleInstance> riList){
		ResultInfo rs = new ResultInfo(riList.size());
		
		
		for (RuleInstance ruleInstance : riList) {
			Object obj = ruleInstance.getRuleAction().execute(context);
			rs.putRuleResult(ruleInstance.getRule().getName(), obj);
		}
		
		return rs;
	}

}
