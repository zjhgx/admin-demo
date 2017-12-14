package com.cs.lexiao.admin.basesystem.webUtil.action;



import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import com.cs.lexiao.admin.framework.base.BaseAction;
import com.cs.lexiao.admin.framework.base.SessionTool;
import com.cs.lexiao.admin.model.SysStatus;

import net.sf.json.JSONObject;
/**
 * 查询组件的初始化
 * @author cuckoo
 *
 */
public class SysStatusComponentAction extends BaseAction {
	private InputStream   statusStream;
	

	public InputStream getStatusStream() {
		return statusStream;
	}
	public void setStatusStream(InputStream statusStream) {
		this.statusStream = statusStream;
	}
	public String refresh()throws Exception{
		SysStatus  status=SessionTool.getSysStatus();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("sys_status", status);
		JSONObject obj=JSONObject.fromObject(map);
		System.out.println(obj.toString());
		statusStream = new ByteArrayInputStream(obj.toString().getBytes("UTF-8"));
		return "success";
	}
}
