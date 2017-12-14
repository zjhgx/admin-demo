/*
 * 源程序名称: SignleResult.java 
 * 软件著作权: 某某集团股份有限公司 版权所有
 * 系统名称: 某某集团业务系统平台(UBSP)
 * 模块名称：　外部服务接口
 * 
 */

package com.cs.lexiao.admin.model.response;

public class SingleResult<E> extends BaseResult{
	
	/**
	 * 数据对象
	 */
	private E data;

	public E getData() {
		return data;
	}

	public void setData(E data) {
		this.data = data;
	}
	
}
