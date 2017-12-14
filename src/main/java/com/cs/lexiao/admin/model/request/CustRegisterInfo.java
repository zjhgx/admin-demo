/*
 * 源程序名称: CustRegisterInfo.java 
 * 软件著作权: 某某集团股份有限公司 版权所有
 * 系统名称: 某某集团业务系统平台(UBSP)
 * 模块名称：TODO(这里注明模块名称)
 * 
 */

package com.cs.lexiao.admin.model.request;

import java.io.Serializable;

import com.cs.lexiao.admin.constant.ErrorCodeConst;
import com.cs.lexiao.admin.framework.exception.ExceptionManager;
import com.cs.lexiao.admin.framework.exception.ValidateException;



public class CustRegisterInfo implements Serializable {
    private String miNo;		//接入编号
	
	private Long custId;		//客户ＩＤ
	
	private String custNo;		//客户号
	
	private String custName;	//客户名称
	
	private String custAcctNo;	//客户账号

	public String getMiNo() {
		return miNo;
	}

	public void setMiNo(String miNo) {
		this.miNo = miNo;
	}

	public Long getCustId() {
		return custId;
	}

	public void setCustId(Long custId) {
		this.custId = custId;
	}

	public String getCustNo() {
		return custNo;
	}

	public void setCustNo(String custNo) {
		this.custNo = custNo;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getCustAcctNo() {
		return custAcctNo;
	}

	public void setCustAcctNo(String custAcctNo) {
		this.custAcctNo = custAcctNo;
	}
	
//	public boolean validate() throws Exception{
		public boolean validate() throws ValidateException{
		StringBuffer sbr = new StringBuffer();
		if(miNo == null || "".equals(miNo.trim())){
			sbr.append("miNo,");
	    }
	    if(custNo == null || "".equals(custNo.trim())){
	    	sbr.append("custNo,");
	    }
	    if(custAcctNo == null || "".equals(custAcctNo)){
	    	sbr.append("custAcctNo,");
	    }
		if(sbr.length() > 0){
			throw ExceptionManager.getException(ValidateException.class,
					ErrorCodeConst.ESI_CANTNOT_BE_NULL,sbr.deleteCharAt(sbr.length() -1).toString());
//			throw new Exception();//
		}
		return true;
	} 
}