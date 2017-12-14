package com.cs.lexiao.admin.tools.msg;

import com.cs.lexiao.admin.tools.msg.cfg.AbstractConfig;

public interface ConfigParser {
	public AbstractConfig parse(String cfgPath);
}
