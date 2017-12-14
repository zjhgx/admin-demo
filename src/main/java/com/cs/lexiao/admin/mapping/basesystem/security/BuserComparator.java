/*
 * 源程序名称: BuserComparator.java 
 * 软件著作权: 某某集团股份有限公司 版权所有
 * 系统名称: 某某集团业务系统平台(UBSP)
 * 模块名称：TODO(这里注明模块名称)
 * 
 */

package com.cs.lexiao.admin.mapping.basesystem.security;

import java.util.Comparator;


public class BuserComparator implements Comparator<Buser> {

	public int compare(Buser o1, Buser o2) {
		int flag=o1.getUserNo().compareTo(o2.getUserNo());
		if(flag==0){
			return o1.getUserName().compareTo(o2.getUserName());
		}
		return flag;
	}

}
