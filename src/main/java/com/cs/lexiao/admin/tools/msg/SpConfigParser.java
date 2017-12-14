package com.cs.lexiao.admin.tools.msg;

import java.io.InputStream;

import javax.xml.bind.JAXBException;

import com.cs.lexiao.admin.constant.ErrorCodeConst;
import com.cs.lexiao.admin.framework.exception.ConfigException;
import com.cs.lexiao.admin.framework.exception.ExceptionManager;
import com.cs.lexiao.admin.tools.msg.cfg.AbstractConfig;
import com.cs.lexiao.admin.tools.msg.cfg.sp.SpConfig;
import com.cs.lexiao.admin.tools.msg.cfg.sp.SpField;
import com.cs.lexiao.admin.tools.msg.cfg.sp.SpItem;
import com.cs.lexiao.admin.tools.msg.cfg.sp.SpItems;
import com.cs.lexiao.admin.tools.msg.cfg.sp.SpList;
import com.cs.lexiao.admin.util.JAXBUtil;

public class SpConfigParser implements ConfigParser {

	public AbstractConfig parse(String cfgPath) {
		InputStream is = this.getClass().getClassLoader().getResourceAsStream(cfgPath);
		SpConfig config = null;
		try {
			config = JAXBUtil.unmarshall(is,new Class[]{SpItem.class,SpItems.class,SpField.class,SpConfig.class,SpList.class });
		} catch (JAXBException e) {
			ExceptionManager.throwException(ConfigException.class,ErrorCodeConst.ESB_MSG_TF_CONF_ERROR,"file["+cfgPath+"] config error!");
		}
		return config;
	}

	public static void main(String[] args) {
		new SpConfigParser().parse("msg-transform-config/demo/spCfg.xml");
	}
}
