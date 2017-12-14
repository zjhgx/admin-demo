package com.cs.lexiao.admin.basesystem.acctrecord.runtime;

import java.util.List;

import com.cs.lexiao.admin.mapping.basesystem.acctrecord.AcctRecordFlow;
import com.cs.lexiao.admin.mapping.basesystem.acctrecord.AcctRecordInfo;

/**
 * 分录信息服务实现类
 * 
 * @author shentuwy
 */
public class AcctRecordInfoServiceImpl {
	
	private AcctRecordInfoDAO acctRecordInfoDAO = null;
	/**
	 * TODO 
	 *
	 * @param flow
	 * @return
	 */
	public Long addAcctRecordFlow(AcctRecordFlow flow) {
		return acctRecordInfoDAO.addFlow(flow);
	}
	/**
	 * TODO 
	 *
	 * @param info
	 */
	public void addAcctRecordInfo(AcctRecordInfo info) {
		acctRecordInfoDAO.addInfo(info);
	}
	/**
	 * TODO 
	 *
	 * @param flowId
	 * @return
	 */
	public AcctRecordFlow getAcctRecordFlow(Long flowId){		
		return acctRecordInfoDAO.getAcctRecordFlow(flowId);
	}
	
	/**
	 * TODO 
	 *
	 * @param flowNo
	 * @return
	 */
	public List<AcctRecordFlow> queryAcctRecordFlowByAcctFlowId(Long acctFlowId){
		return acctRecordInfoDAO.queryAcctRecordFlowByAcctFlowId(acctFlowId);
		
	}
	/**
	 * TODO 
	 *
	 * @param tranFlowId
	 * @return
	 */
	public List<AcctRecordInfo> queryAcctRecordInfoByTranFlowId(Long tranFlowId) {
		List list = acctRecordInfoDAO.queryAcctRecordInfoByTranFlowId(tranFlowId);
		return list;
	}
	
	public void deleteRecordInfoByFlow(Long acctFlowId){
		this.acctRecordInfoDAO.deleteRecordInfoByFlow(acctFlowId);
	}
	public AcctRecordInfoDAO getAcctRecordInfoDAO() {
		return acctRecordInfoDAO;
	}
	public void setAcctRecordInfoDAO(AcctRecordInfoDAO acctRecordInfoDAO) {
		this.acctRecordInfoDAO = acctRecordInfoDAO;
	}

}
