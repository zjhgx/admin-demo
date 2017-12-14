<%@page import="com.cs.lexiao.admin.constant.CodeKey"%>
<%@page import="com.cs.lexiao.admin.util.UtilConstant"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="x" uri="/xcars-tags"%>
<tiles:insertDefinition name="WIN_FORM_BUTTON">
	<tiles:putAttribute name="tool">
	</tiles:putAttribute>
	<tiles:putAttribute name="form">
		<div id="tt" style="align-content:center;width: 260px">
			<form id="editForm" style="align-content: center">
				<input type="hidden" name="sysConfig.id" value="${sysConfig.id}"/>
				<input type="hidden" name="sysConfig.configKey" value="${sysConfig.configKey}"/>
				<input type="hidden" name="sysConfig.configName" value="${sysConfig.configName}"/>
				<input type="hidden" name="sysConfig.configType" value="${sysConfig.configType}"/>
				<table class="busi_form">
					<tr>
						<td class="title">键值代码: </td>
						<td>
							<input type="text" value="${sysConfig.configKey}" disabled="disabled"/>
						</td>
					</tr>
					<tr>
						<td class="title">键值名称: </td>
						<td>
							<input type="text" value="${sysConfig.configName}" disabled="disabled"/>
						</td>
					</tr>
					<tr>
						<td class="title">键&#12288;&#12288;值: </td>
						<td>
							<s:if test="sysConfig.configType == 'int'">
								<input type="text" name="sysConfig.configValue" validType="positive_int_zero" value="${sysConfig.configValue}"
									class="easyui-validatebox" required="true" maxlength="20"/>
							</s:if>
							<s:else>
								<input type="text" name="sysConfig.configValue" value="${sysConfig.configValue}"
									class="easyui-validatebox" required="true" maxlength="20"/>
							</s:else>
						</td>
					</tr>
					<tr>
						<td class="title">是否有效: </td>
						<td>
							<x:combobox name="sysConfig.status" list="statusList" textField="statusName" valueField="statusNo"
								value="${sysConfig.status}" pleaseSelect="false" cssStyle="width:140px;"/>
						</td>
					</tr>
					<tr>
						<td class="title"><font color="red">提&#12288;&#12288;示: </font></td>
						<td>
							<font color="red">“是否有效”请谨慎操作！</font>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</tiles:putAttribute>
	
	<tiles:putAttribute name="button">
		<x:button iconCls="icon-save" text="save" click="doSave" effect="round"/>
		<x:button iconCls="icon-cancel" text="cancel" click="doCancel" effect="round"/>
	</tiles:putAttribute>
	
	<tiles:putAttribute name="end">
		<script type="text/javascript">
			function doCancel(){
				closeWindow("config_edit_win");
			}

			function doSave(){
				if($("#editForm").form("validate")) {
					var url = '<s:url value="/system/config_doEdit.jhtml"/>';
					doPost(url, formToObject("editForm"), function(result) {
						if(!printError(result)){
							info("修改成功！");
							setTimeout("closeWindow('config_edit_win'); dataTable.refresh();", 1000);
						}
					});
				}
			}
		</script>
	</tiles:putAttribute>
</tiles:insertDefinition>