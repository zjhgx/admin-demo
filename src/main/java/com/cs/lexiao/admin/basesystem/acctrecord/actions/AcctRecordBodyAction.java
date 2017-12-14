/*
 * 源程序名称: AcctRecordBodyAction.java
 * 软件著作权: 某某集团股份有限公司 版权所有
 * 系统名称: 某某集团业务系统平台(UBSP)
 * 模块名称: 账务配置
 * 
 */
package com.cs.lexiao.admin.basesystem.acctrecord.actions;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import com.cs.lexiao.admin.basesystem.acctrecord.config.acctrecordbody.IAcctRecordBodyService;
import com.cs.lexiao.admin.basesystem.dictionary.util.DictionaryUtil;
import com.cs.lexiao.admin.constant.AcctRecordConst;
import com.cs.lexiao.admin.factory.DynamicPropertyTransfer;
import com.cs.lexiao.admin.framework.base.BaseAction;
import com.cs.lexiao.admin.framework.base.SessionTool;
import com.cs.lexiao.admin.framework.base.message.MessageLevel;
import com.cs.lexiao.admin.mapping.basesystem.acctrecord.AcctRecordBody;
import com.cs.lexiao.admin.mapping.basesystem.product.ProductInfo;
import com.cs.lexiao.admin.model.ConditionBean;
import com.cs.lexiao.admin.util.PropertyTransVo;

/**
 * 
 * 功能说明：分录结构体配置的Action
 * @author shentuwy  
 * @date Jun 27, 2011 08:46:20 AM 
 *
 */
public class AcctRecordBodyAction extends BaseAction{
	private AcctRecordBody acctRecordBody;
	private InputStream jsonStream;
	private IAcctRecordBodyService acctRecordBodyService;
	private List list;
	private List valueTypeList = DictionaryUtil.getCodesByKey(AcctRecordConst.ACCT_ITEM_VALUE_TYPE);
	
	public AcctRecordBody getAcctRecordBody() {
		return acctRecordBody;
	}

	public void setAcctRecordBody(AcctRecordBody acctRecordBody) {
		this.acctRecordBody = acctRecordBody;
	}

	public InputStream getJsonStream() {
		return jsonStream;
	}

	public void setJsonStream(InputStream jsonStream) {
		this.jsonStream = jsonStream;
	}

	public IAcctRecordBodyService getAcctRecordBodyService() {
		return acctRecordBodyService;
	}

	public void setAcctRecordBodyService(
			IAcctRecordBodyService acctRecordBodyService) {
		this.acctRecordBodyService = acctRecordBodyService;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public List getValueTypeList() {
		return valueTypeList;
	}

	public void setValueTypeList(List valueTypeList) {
		this.valueTypeList = valueTypeList;
	}

	public String list() throws Exception {
		return "LIST";
	}
	
	public String queryData() throws Exception {
		if(acctRecordBody==null) acctRecordBody = new AcctRecordBody();
		List<ConditionBean> cblist = new ArrayList<ConditionBean>();		
		cblist.add(new ConditionBean("miNo", SessionTool.getUserLogonInfo().getMiNo()));
		
		list = acctRecordBodyService.queryAcctRecordBody(cblist, this.getPg());
		
		List tmpList =  new ArrayList();
		tmpList.add(new PropertyTransVo("prodNo", ProductInfo.class,"prodNo","prodName"));
		list = DynamicPropertyTransfer.transform(list, tmpList);

		setDatagridInputStreamData(list, getPg());
		jsonStream = this.getDataStream();
		
		SessionTool.publishNews(MessageLevel.LEVEL_NORMAL, "查询数据成功,共"
				+ getPg().getTotalRows() + "条");
		return "table";
	}
	
	public String toCreateAcctRecordBody() throws Exception {
		acctRecordBody = new AcctRecordBody();
		return "AddAcctRecordBody";
	}
	
	public String createAcctRecordBody() throws Exception {
		acctRecordBody.setMiNo(SessionTool.getUserLogonInfo().getMiNo());
		acctRecordBodyService.createAcctRecordBody(acctRecordBody);
		return null;
	}
	
	public String toEditAcctRecordBody() throws Exception {		
		acctRecordBody = acctRecordBodyService.findAcctRecordBody(Long.valueOf(getId()));
		return "EditAcctRecordBody";
	}
	
	public String modifyAcctRecordBody() throws Exception {
		acctRecordBody.setMiNo(SessionTool.getUserLogonInfo().getMiNo());
		acctRecordBodyService.modifyAcctRecordBody(acctRecordBody);
		return null;
	}
	
	public String deleteAcctRecordBody() throws Exception {
		acctRecordBodyService.deleteAcctRecordBody(Long.valueOf(getId()));
		return null;
	}
	
	public String listAcctRecordBodyForChoose() throws Exception{
		return "LISTFORCHOOSE";
	}
}
