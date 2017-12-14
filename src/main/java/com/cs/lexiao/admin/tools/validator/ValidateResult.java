/*
 * 源程序名称: ValidateResult.java 
 * 软件著作权: 某某集团股份有限公司 版权所有
 * 系统名称: 某某集团业务系统平台(UBSP)
 * 模块名称：TODO(这里注明模块名称)
 * 
 */

package com.cs.lexiao.admin.tools.validator;

public class ValidateResult {
	boolean isPass;
	String errorMessage;

	public ValidateResult(boolean isPass, String errorMessage) {
		super();
		this.isPass = isPass;
		this.errorMessage = errorMessage;
	}

	public boolean isPass() {
		return isPass;
	}

	public void setPass(boolean isPass) {
		this.isPass = isPass;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

}
