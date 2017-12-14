package com.cs.lexiao.admin.basesystem.dictionary.core.code;

import java.util.ArrayList;
import java.util.List;

import com.cs.lexiao.admin.basesystem.dictionary.model.RegionModel;
import com.cs.lexiao.admin.basesystem.dictionary.util.DictionaryUtil;
import com.cs.lexiao.admin.constant.CodeKey;
import com.cs.lexiao.admin.framework.exception.DAOException;
import com.cs.lexiao.admin.mapping.basesystem.dictionary.Code;
import com.cs.lexiao.admin.model.ConditionBean;

public class RegionServiceImpl implements IRegionService {
	private ICodeDAO codeDAO;//spring 注入

	public List<RegionModel> getCountrys() throws DAOException {
		List<Code> list = DictionaryUtil.getCodesByKey(CodeKey.COUNTRY);
		
		ArrayList<RegionModel> regionList = new ArrayList<RegionModel>(list.size());
		for (Code code : list) {
			regionList.add(new RegionModel(code.getCodeNo(), code.getCodeName(), code.getCodeNo()));
		}
		
		return regionList;
	}

	public List<RegionModel> getProvinces(String countryNo) throws DAOException {
		ArrayList<ConditionBean> condList = new ArrayList<ConditionBean>(1);
		condList.add(new ConditionBean("codeNo", ConditionBean.LIKE, countryNo+"%"));
		
		List<Code> list = codeDAO.getCodesByKeyWithCodition(CodeKey.PROVINCE, condList);
		
		ArrayList<RegionModel> regionList = new ArrayList<RegionModel>(list.size());
		for (Code code : list) {
			regionList.add(new RegionModel(code.getCodeNo(), code.getCodeName(), code.getCodeNo()));
		}
		
		return regionList;
	}

	public List<RegionModel> getCitys(String provinceNo) throws DAOException {
		ArrayList<ConditionBean> condList = new ArrayList<ConditionBean>(1);
		condList.add(new ConditionBean("codeNo", ConditionBean.LIKE, provinceNo+"%"));
		
		List<Code> list = codeDAO.getCodesByKeyWithCodition(CodeKey.CITY, condList);
		
		ArrayList<RegionModel> regionList = new ArrayList<RegionModel>(list.size());
		for (Code code : list) {
			regionList.add(new RegionModel(code.getCodeNo(), code.getCodeName(), code.getCodeNo()));
		}
		
		return regionList;
	}

	public ICodeDAO getCodeDAO() {
		return codeDAO;
	}

	public void setCodeDAO(ICodeDAO codeDAO) {
		this.codeDAO = codeDAO;
	}
	
	
	

}
