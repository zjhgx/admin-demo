package com.cs.lexiao.admin.framework.rules.runtime.agenda;

import java.util.Collections;
import java.util.List;

import com.cs.lexiao.admin.framework.rules.context.ContextInfo;
import com.cs.lexiao.admin.framework.rules.runtime.RuleInstance;

/**
 * 议程器 
 *
 * @author shentuwy
 */
public class AgandaProcessor {
	
	public static List<RuleInstance> sortRule(ContextInfo context, List<RuleInstance> riList){
	
		//进行排序
		Collections.sort(riList, new RuleComparator());
		
		return riList;
	}

}
