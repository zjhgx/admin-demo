package com.cs.lexiao.admin.code.core;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.cs.lexiao.admin.framework.annotation.Service;
import com.cs.lexiao.admin.framework.base.IBaseDAO;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.framework.base.XBaseService;
import com.cs.lexiao.admin.mapping.business.LxCodeItem;
import com.cs.lexiao.admin.model.ConditionBean;
import com.cs.lexiao.admin.model.OrderBean;

@Service
public class CodeItemServiceImpl  extends XBaseService<LxCodeItem> implements ICodeItemService {
	@Autowired
	private ICodeItemDao codeItemDao;

	@Override
	public IBaseDAO<LxCodeItem, Long> getBaseDAO() {
		return codeItemDao;
	}

	@Override
	public void addCodeItem(LxCodeItem codeItem) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void editCodeItem(LxCodeItem codeItem) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCodeItem(Long id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public LxCodeItem getCodeItemById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<LxCodeItem> getCodeItemByKey(String key) {
		return codeItemDao.getCodeItemByKey(key);
	}

	@Override
	public void deleteByList(List<Long> ids) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<LxCodeItem> findAllByPage(Page page) {
		// TODO Auto-generated method stub
		return null;
	}

	public void setCodeItemDao(ICodeItemDao codeItemDao) {
		this.codeItemDao = codeItemDao;
	}

	public String getCodeItemNameByKey(String codeKey, String codeNo) {
		// TODO Auto-generated method stub
		return codeItemDao.getCodeItemNameByKey(codeKey,codeNo);
	}

	public ICodeItemDao getCodeItemDao() {
		return codeItemDao;
	}

	@Override
	public List<LxCodeItem> findAllCodeItemByKey(String key) {
		return codeItemDao.findAllCodeItemByKey(key);
	}

	@Override
	public List<LxCodeItem> findCodeItemByKeyAndMiNo(String key, String fiMiNo) {
		List<ConditionBean> conditionList = new ArrayList<ConditionBean>();
		conditionList.add(new ConditionBean("codeKey", key));
		if (StringUtils.isNotBlank(fiMiNo)) {
			conditionList.add(new ConditionBean("fiMiNo", fiMiNo));
		}
		return codeItemDao.queryEntity(conditionList, null);
	}

	@Override
	public List<LxCodeItem> getCodeItemByKeyAsc(String key) {
		return codeItemDao.getCodeItemByKeyAsc(key);
	}

	@Override
	public List<LxCodeItem> getSomeCodeItemByKey(String key, String[] codeNo) {
		List<ConditionBean> conditionList = new ArrayList<ConditionBean>();
		conditionList.add(new ConditionBean("codeKey", key));
		if (codeNo != null && codeNo.length!=0) {
			conditionList.add(new ConditionBean("codeNo", ConditionBean.IN, codeNo));
		}
		List<OrderBean> orderList = new ArrayList<OrderBean>();
		orderList.add(new OrderBean("order",true));
		return codeItemDao.queryEntity(conditionList, orderList, null);
	}

	@Override
	public String getCodeNoByKey(String codeKey, String codeName) {
		return codeItemDao.getCodeNoByKey(codeKey, codeName);
	}
}