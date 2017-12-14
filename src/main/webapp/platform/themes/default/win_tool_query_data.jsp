<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<tiles:insertAttribute name="head"/>
	<div class="win_tool_area">
		<tiles:insertAttribute name="tool"/>
	</div>
	<div class="win_query_area">
		<tiles:insertAttribute name="query"/>
	</div>

	<div class="win_data_area">
		<tiles:insertAttribute name="data"/>
	</div>
	<!-- 弹出窗口定义开始 -->
	<tiles:insertAttribute name="window"/>

<tiles:insertAttribute name="end"/>
