<%@page import="com.cs.lexiao.admin.constant.CodeKey"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.cs.lexiao.admin.constant.CodeKeyConstant"%>
<%@page import="net.easytodo.keel.util.SecurityUtils"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="x" uri="/xcars-tags"%>
<tiles:insertDefinition name="FUNC_TOOL_QUERY_DATA">
	
	<tiles:putAttribute name="tool">
		<x:button iconCls="icon-view" text="edit" click="doEdit" />
	</tiles:putAttribute>
	
	<tiles:putAttribute name="query">
		<form id="mainQueryForm" class="query_form">
			<table>
				<tr>
					<td class="title">键值代码:</td>
					<td>
						<input name="searchBean.configKey" value="<s:property value="searchBean.configKey"/>" />
					</td>
					<td class="title">键值名称:</td>
					<td>
						<input name="searchBean.configName" value="<s:property value="searchBean.configName"/>" />
					</td>
					<td class="title">是否有效:</td>
					<td>
						<x:combobox id="status" name="searchBean.status" list="statusList" textField="statusName" valueField="statusNo"/>
					</td>
					<td>
						<x:button iconCls="icon-search" text="query" click="doQuery" />
					</td>
				</tr>
			</table>
		</form>
	</tiles:putAttribute>
	<tiles:putAttribute name="data">
		<x:datagrid id="dataTable" url="/system/config_list.jhtml" singleSelect="true" autoload="true" form="mainQueryForm">
			<x:columns>
				<x:column title="序号" field="ID" checkbox="true" align="center" width="30" />
				<x:column title="键值代码" field="configKey" align="center" width="200"/>
				<x:column title="键值名称" field="configName" align="center" width="200" />
				<x:column title="键值" field="configValue" align="center" width="200" />
				<x:column title="数据类型" field="configType" align="center" width="200"/>
				<x:column title="是否有效" field="status" align="center" width="200" formatter="formatStatus"/>
			</x:columns>
		</x:datagrid>
	</tiles:putAttribute>
	
	<!-- 弹出窗口定义开始 -->
	<tiles:putAttribute name="window">
		<div id="config_edit_win" style="width: 300px; height: 250px; display: none;"></div>
	</tiles:putAttribute>

	<tiles:putAttribute name="end">
		<script type="text/javascript">
			function doQuery() {
				dataTable.load();
			}
			
			function formatStatus(value) {
				if ("0" == value) {
					return "是";
				} else if ("1" == value)  {
					return "否";
				}
				return value;
			}

			function doEdit() {
				if(isSingleSelected(dataTable)) {
					var id = dataTable.getSelectedField("id");
					var url = '<s:url value="/system/config_edit.jhtml"/>?id='+id;
					requestAtWindow(url, "config_edit_win","<s:text name='edit'/>");
				}
			}
		</script>
	</tiles:putAttribute>
</tiles:insertDefinition>