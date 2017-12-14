package com.cs.lexiao.admin.basesystem.autotask.actions;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import com.cs.lexiao.admin.basesystem.autotask.core.AutoTaskCurrentMonitor;
import com.cs.lexiao.admin.basesystem.autotask.core.AutoTaskInstance;
import com.cs.lexiao.admin.basesystem.autotask.core.AutoTaskServiceFactory;
import com.cs.lexiao.admin.basesystem.autotask.core.IAutoTaskCurrentService;
import com.cs.lexiao.admin.constant.ErrorCodeConst;
import com.cs.lexiao.admin.framework.base.BaseAction;
import com.cs.lexiao.admin.framework.base.ICommonDAO;
import com.cs.lexiao.admin.framework.base.Page;
import com.cs.lexiao.admin.framework.exception.ExceptionManager;
import com.cs.lexiao.admin.framework.exception.SysException;
import com.cs.lexiao.admin.mapping.basesystem.autotask.AutoTask;
import com.cs.lexiao.admin.mapping.basesystem.security.MemberInfo;
import com.cs.lexiao.admin.util.SourceTemplate;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * 任务监控控制器
 * 
 * @author shentuwy
 */
public class AutoTaskActiveAction extends BaseAction {

	/**
	 * 
	 */
	private static final long		serialVersionUID	= 3988646818230983904L;
	private List<AutoTaskInstance>	autoTaskInstances;
	private Long					taskId;
	private String					memberNo;

	// service
	private IAutoTaskCurrentService	autoTaskCurrentService;

	public String main() {
		return MAIN;
	}

	public String list() {
		Page pg = this.getPg();
		autoTaskInstances = AutoTaskServiceFactory.getAutoTaskCurrentService().getAllAutoTasks();

		return setDatagridInputStreamData(autoTaskInstances, pg);

	}

	public String memberMain() {
		return "member_list";
	}

	public String memberList() {
		AutoTask task = AutoTaskServiceFactory.getAutoTaskService().getAutoTask(this.getPKId());

		ICommonDAO dao = SourceTemplate.getBean(ICommonDAO.class, "commonDAO");
		List<MemberInfo> miList = dao.findByOneProperty(MemberInfo.class, "miNo", task.getMemberNoList());
		HashMap<String, String> knMap = new HashMap<String, String>();
		for (MemberInfo memberInfo : miList) {
			knMap.put(memberInfo.getMiNo(), memberInfo.getMiName());
		}

		AutoTaskInstance instance = AutoTaskCurrentMonitor.getInstance().getAutoTaskInstance(this.getPKId());
		autoTaskInstances = instance.getSubTaskList();
		for (AutoTaskInstance ins : autoTaskInstances) {
			ins.setMemberName(knMap.get(ins.getMemberNo()));
		}

		Page pg = this.getPg();
		pg.setPageSize(30);
		return setDatagridInputStreamData(autoTaskInstances, pg);

	}

	public void runTask() {
		autoTaskCurrentService.runTask(this.getPKId());
	}

	public void stopTask() {
		autoTaskCurrentService.stopTask(this.getPKId());
	}

	public String runSubTask() {

		autoTaskCurrentService.runSubTask(this.getPKId(), memberNo);

		return null;
	}

	public String stopSubTask() {

		autoTaskCurrentService.stopSubTask(this.getPKId(), memberNo);

		return null;
	}

	public String setInitStatus() {
		autoTaskCurrentService.setInitStatus(this.getPKId());

		return null;
	}

	public String setFinishStatus() {
		autoTaskCurrentService.setFinishStatus(this.getPKId());

		return null;
	}

	/**
	 * 对象转化成UTF编码流
	 * 
	 * @param obj
	 * @return
	 */
	protected InputStream changeObjctToUTFStream(Object obj) {

		InputStream ret = null;
		if (obj != null) {
			Object retObj = null;

			if (obj instanceof JSONObject || obj instanceof JSONArray) { // do
																			// nothing
				retObj = obj;
			} else if (obj instanceof List<?> || obj.getClass().isArray()) { // 集合
																				// 数组
				retObj = JSONArray.fromObject(obj);
			} else {
				JsonConfig jc = new JsonConfig();
				// 不解析为json
				jc.setIgnoreDefaultExcludes(true); // 设置默认忽略
				jc.setExcludes(new String[] { "parentInstance", "thread", "subTaskMap", "errorSubTaskSet",
						"finishSubTaskSet" });

				retObj = JSONObject.fromObject(obj, jc);
			}
			if (retObj != null) {
				try {
					ret = new ByteArrayInputStream(retObj.toString().getBytes("UTF-8"));
				} catch (Exception e) {
					ExceptionManager.throwException(SysException.class, ErrorCodeConst.RESOURCE_FILE_PARS_ERR);
				}
			}
		}
		return ret;
	}

	public List<AutoTaskInstance> getAutoTaskInstances() {
		return autoTaskInstances;
	}

	public void setAutoTaskInstances(List<AutoTaskInstance> autoTaskInstances) {
		this.autoTaskInstances = autoTaskInstances;
	}

	/**
	 * @return Returns the taskId.
	 */
	public Long getTaskId() {
		return taskId;
	}

	/**
	 * @param taskId
	 *            The taskId to set.
	 */
	public void setTaskId(Long taskId) {
		this.taskId = taskId;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	// spring
	public IAutoTaskCurrentService getAutoTaskCurrentService() {
		return autoTaskCurrentService;
	}

	public void setAutoTaskCurrentService(IAutoTaskCurrentService autoTaskCurrentService) {
		this.autoTaskCurrentService = autoTaskCurrentService;
	}

}
