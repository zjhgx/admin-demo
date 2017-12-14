package com.cs.lexiao.admin.framework.rules.runtime.match;

import java.util.ArrayList;
import java.util.List;

import com.cs.lexiao.admin.framework.rules.context.ContextInfo;
import com.cs.lexiao.admin.framework.rules.runtime.RuleInstance;

/**
 * 匹配器 
 *
 * @author shentuwy
 */
public class PatternMatchProcessor {
	/**
	 * 将满足条件的规则筛选出来
	 * @param context
	 * @param riList
	 * @return
	 */
	public static List<RuleInstance> passMatchRule(ContextInfo context, List<RuleInstance> riList){
		List<RuleInstance> list = new ArrayList<RuleInstance>(riList.size());
		
		for (RuleInstance ruleInstance : riList) {
			boolean b = ruleInstance.getRuleCondition().isMatch(context);
			if (b)
				list.add(ruleInstance);
		}
		
		return list;
	}

}
