<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<tiles:insertAttribute name="head"/>
<link rel="stylesheet" type="text/css" href="<s:url value='/platform/themes/default/css/funcmain.css'/>" />

<!-- 由此开始页面布局 -->
<div id="work_page"  class="easyui-layout" fit="true"  border="false">	
	<!-- 工具栏区域-->

	<div style="padding:0px;padding-top:1px;padding-left:2px;margin:0px;border:0px;border-bottom:1px solid #ccc;background:#efefef;width:100%;height:28px;" border="false" region="north">
		<tiles:insertAttribute name="tool"/>
	</div>
	<!-- 数据显示区域 -->
	<div region="center"  border="false" style="padding:10px;margin:0px;border:0px;border-top:#99bbe8 1px solid;overflow:hidden;">
		<tiles:insertAttribute name="form"/>
	</div>
	<!-- 弹出窗口定义开始 -->
	<tiles:insertAttribute name="window"/>
	
	<!-- 右键菜单定义开始 -->
	<tiles:insertAttribute name="menu"/>
</div>

<tiles:insertAttribute name="end"/>
