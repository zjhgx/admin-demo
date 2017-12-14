/*
 * 源程序名称: BaseResult.java 
 * 软件著作权: 某某集团股份有限公司 版权所有
 * 系统名称: 某某集团业务系统平台(UBSP)
 * 模块名称：　外部服务接口
 * 
 */

package com.cs.lexiao.admin.model.response;

public class BaseResult {
	
	/*
	 * 成功码常量
	 */
	public static final String successCode="AAA";   
	/*
	 * 返回码。如果成功返回AAA,否则，返回具体的错误码。
	 */
	private String returnCode;
	/*
	 * 提示信息
	 */
	private String returnMsg;
	
	public String getReturnCode() {
		return returnCode;
	}
	
	public void setReturnCode(String returnCode) {
		this.returnCode = returnCode;
	}
	
	public String getReturnMsg() {
		return returnMsg;
	}
	
	public void setReturnMsg(String returnMsg) {
		this.returnMsg = returnMsg;
	}
	
	/**
	 * 是否成功
	 * @return
	 */
	public boolean isSuccess(){
		if(successCode.equals(returnCode)){
			return true;
		}else{
			return false;
		}
	}

}
