package com.cs.lexiao.admin.framework.rules.context;

import java.util.ArrayList;
import java.util.List;

import com.cs.lexiao.admin.framework.rules.graph.def.Parameter;
import com.cs.lexiao.admin.framework.rules.graph.def.RuleNode;
import com.cs.lexiao.admin.framework.rules.runtime.IRuleParameter;
import com.cs.lexiao.admin.util.LogUtil;
import com.cs.lexiao.admin.util.SourceTemplate;
import com.cs.lexiao.admin.util.StringUtil;

import bsh.EvalError;
import bsh.Interpreter;

/**
 * 上下文信息 
 *
 * @author shentuwy
 */
public class ContextInfo {
	public final static String _PARA = "$para_";
	//public final static String _MEMBER = "$member";
	
	private RuleNode ruleNode;
	private Interpreter itpr;
	private List paraList = new ArrayList();
	
	
	public ContextInfo(RuleNode ruleNode, Interpreter itpr){
		this.itpr = itpr;
		this.ruleNode = ruleNode;
		
		this.initImport();
		this.initParas();
		
	}
	
	/**
	 * 获取变量值 
	 *
	 * @param name
	 * @return
	 */
	public Object getVariable(String name) {
		try {
			return this.itpr.get(name);
		} catch (EvalError e) {
			LogUtil.getWorkFlowLog().warn("getVariable("+name+")", e);
			return null;
		}
	}
	
	public Interpreter getInterpreter(){
		return this.itpr;
	}
	
	
	
	private void initImport(){
		// itpr.eval("import com.leadmind.common.constants.BusiCodeConst;");
		Class clazz = SourceTemplate.class;
		try {
			itpr.eval("import " + clazz.getName());
			if (!StringUtil.isEmpty(this.ruleNode.getImportExpr()))
				itpr.eval(this.ruleNode.getImportExpr());
		} catch (EvalError e) {
			//TODO 暂不处理此异常
		}
	}
	private void initParas(){
		if (ruleNode.getParaList().isEmpty())
			return;
		try {
			for (Parameter para : ruleNode.getParaList()) {
				Object value = null;
				if (!StringUtil.isEmpty(para.getParaClass())){
					
						Object obj = Class.forName(para.getParaClass()).newInstance();
						IRuleParameter rulePara = (IRuleParameter)obj;
						value = rulePara.get(this);
					
				}else{
					value = this.itpr.eval(para.getParaExpr());
					
				}
				
				this.itpr.set(_PARA+para.getName(), value);
				this.paraList.add(value);
						
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public Object getParameterByName(String paraName){
		try {
			return this.itpr.get(_PARA+paraName);
		} catch (EvalError e) {
			return null;
		}
	}
	
	public Object getParemeterByIndex(int index){
		return paraList.get(index);
	}
	

}
