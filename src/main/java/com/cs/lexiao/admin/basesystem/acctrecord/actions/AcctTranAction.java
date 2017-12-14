/*
 * 源程序名称: AcctTranAction.java
 * 软件著作权: 某某集团股份有限公司 版权所有
 * 系统名称: 某某集团业务系统平台(UBSP)
 * 模块名称: 账务配置
 * 
 */
package com.cs.lexiao.admin.basesystem.acctrecord.actions;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cs.lexiao.admin.basesystem.acctrecord.config.acctpoint.IAcctPointService;
import com.cs.lexiao.admin.basesystem.acctrecord.config.accttran.IAcctTranService;
import com.cs.lexiao.admin.basesystem.dictionary.util.DictionaryUtil;
import com.cs.lexiao.admin.basesystem.product.core.product.IProductService;
import com.cs.lexiao.admin.constant.AcctRecordConst;
import com.cs.lexiao.admin.constant.BeanNameConstants;
import com.cs.lexiao.admin.factory.DynamicPropertyTransfer;
import com.cs.lexiao.admin.framework.base.BaseAction;
import com.cs.lexiao.admin.framework.base.SessionTool;
import com.cs.lexiao.admin.framework.base.message.MessageLevel;
import com.cs.lexiao.admin.mapping.basesystem.acctrecord.AcctPoint;
import com.cs.lexiao.admin.mapping.basesystem.acctrecord.AcctTran;
import com.cs.lexiao.admin.mapping.basesystem.acctrecord.AcctTranExpr;
import com.cs.lexiao.admin.mapping.basesystem.product.ProductInfo;
import com.cs.lexiao.admin.model.ConditionBean;
import com.cs.lexiao.admin.util.PropertyTransVo;
import com.cs.lexiao.admin.util.SourceTemplate;

import net.sf.json.JSONObject;

/**
 * 
 * 功能说明：记账交易的Action
 * @author shentuwy  
 * @date Jun 27, 2011 08:46:20 AM 
 *
 */
public class AcctTranAction extends BaseAction{
	private AcctTran acctTran;
	private AcctTranExpr acctTranExpr;
	private InputStream jsonStream;
	private IAcctTranService acctTranService;
	private IAcctPointService acctPointService;
	private List list;
	

	public AcctTranExpr getAcctTranExpr() {
		return acctTranExpr;
	}


	public void setAcctTranExpr(AcctTranExpr acctTranExpr) {
		this.acctTranExpr = acctTranExpr;
	}


	public AcctTran getAcctTran() {
		return acctTran;
	}


	public void setAcctTran(AcctTran acctTran) {
		this.acctTran = acctTran;
	}


	public InputStream getJsonStream() {
		return jsonStream;
	}


	public void setJsonStream(InputStream jsonStream) {
		this.jsonStream = jsonStream;
	}


	public IAcctTranService getAcctTranService() {
		return acctTranService;
	}


	public void setAcctTranService(IAcctTranService acctTranService) {
		this.acctTranService = acctTranService;
	}


	public IAcctPointService getAcctPointService() {
		return acctPointService;
	}


	public void setAcctPointService(IAcctPointService acctPointService) {
		this.acctPointService = acctPointService;
	}


	public List getList() {
		return list;
	}


	public void setList(List list) {
		this.list = list;
	}


	public String list() throws Exception {
		return "LIST";
	}

	public String queryData() throws Exception {
		List<ConditionBean> cblist = new ArrayList<ConditionBean>();
		cblist.add(new ConditionBean("miNo", SessionTool.getUserLogonInfo().getMiNo()));
		list = acctTranService.queryAcctTran(cblist, this.getPg());
		
		List tmpList =  new ArrayList();
		tmpList.add(new PropertyTransVo("pointId", AcctPoint.class,"id","prodNo"));
		tmpList.add(new PropertyTransVo("pointId", AcctPoint.class,"id","eventNo"));
		list = DynamicPropertyTransfer.transform(list, tmpList);
		
		tmpList =  new ArrayList();
		tmpList.add(new PropertyTransVo("pointId_prodNo", ProductInfo.class,"prodNo","prodName"));
		list = DynamicPropertyTransfer.transform(list, tmpList);
	
		setDatagridInputStreamData(list, getPg());
		jsonStream = this.getDataStream();
		
		SessionTool.publishNews(MessageLevel.LEVEL_NORMAL, "查询数据成功,共"
				+ getPg().getTotalRows() + "条");
		return "table";
	}
	
	public String toCreateAcctTran() throws Exception {
		acctTran = new AcctTran();
		return "AddAcctTran";
	}
	
	public String createAcctTran() throws Exception {
		acctTran.setMiNo(SessionTool.getUserLogonInfo().getMiNo());
		acctTranService.createAcctTran(acctTran);
		return null;
	}
	
	public String toEditAcctTran() throws Exception {
		this.acctTran = this.acctTranService.findAcctTran(getPKId());
		
		AcctPoint ap = this.acctPointService.findAcctPoint(this.acctTran.getPointId());
		
		String prodName = SourceTemplate.getBean(IProductService.class,BeanNameConstants.PRODUCT_SERVICE).getProductByProdNo(ap.getProdNo()).getProdName();
		
		String eventName = DictionaryUtil.getCodeNameByKey(AcctRecordConst.ACCT_EVENT, ap.getEventNo());
		
		this.acctTran = (AcctTran)DynamicPropertyTransfer.dynamicAddProperty(this.acctTran, "pointName", prodName+eventName);
		
		return "EditAcctTran";
	}
	
	public String editAcctTran() throws Exception {
		
		acctTranService.modifyAcctTran(acctTran);
		
		return null;
	}
	
	
	public String deleteAcctTran() throws Exception {
		acctTranService.deleteAcctTran(Long.valueOf(getId()));
		return null;
	}
	
	public String listAcctTranExpr() throws Exception {
		return "ListAcctTranExpr";
	}
	
	public String queryAcctTranExprData() throws Exception {
		List<ConditionBean> cblist = new ArrayList<ConditionBean>();
		cblist.add(new ConditionBean("tranId",Long.valueOf(getId())));
		list = acctTranService.queryAcctTranExpr(cblist, this.getPg());
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("total", this.getPg().getTotalRows());
		jsonMap.put("rows", list);
		JSONObject jsonObject = JSONObject.fromObject(jsonMap);
		jsonStream = outJsonUTFStream(jsonObject);
		System.out.println("the json data is:" + jsonObject.toString());
		SessionTool.publishNews(MessageLevel.LEVEL_NORMAL, "查询数据成功,共"
				+ getPg().getTotalRows() + "条");
		return "table";
	}
	
	public String toCreateAcctTranExpr() throws Exception {
		acctTran = new AcctTran();
		return "AddAcctTranExpr";
	}
	
	public String createAcctTranExpr() throws Exception {
		acctTranService.createAcctTranExpr(acctTranExpr);
		return null;
	}
	
	public String deleteAcctTranExpr() throws Exception {
		acctTranService.deleteAcctTranExpr(Long.valueOf(getId()));
		return null;
	}
	
	public String listAcctTranForChoose() throws Exception {
		return "LISTFORCHOOSE";
	}
}
