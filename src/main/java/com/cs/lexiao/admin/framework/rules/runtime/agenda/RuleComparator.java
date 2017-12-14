package com.cs.lexiao.admin.framework.rules.runtime.agenda;

import java.util.Comparator;

import com.cs.lexiao.admin.framework.rules.runtime.RuleInstance;
/**
 * 规则排序
 * 
 * @author shentuwy
 */
public class RuleComparator implements Comparator<RuleInstance>{
	
	public int compare(RuleInstance o1, RuleInstance o2) {
		return o2.getRule().getLevel()-o1.getRule().getLevel();
	}
}
