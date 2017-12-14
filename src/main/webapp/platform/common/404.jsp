<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<script language="javascript" src="<%=request.getContextPath()%>/platform/themes/simple/js/layout.js"></script>
		<script type="text/javascript" language="javascript">
			function toPreviousPage() {
				var basePath = "<%=request.getContextPath()%>";
				if ("${isLogin}" == "0") { //未登录
					window.location.href = basePath + "/login.jhtml";
				} else if ("${isLogin}" == "1") { //已登录
					window.parent.refreshWorkspace(basePath);
				} else { //default处理(未登录:直接跳转到login页面;已登录:跳转到index页面)
					window.location.href = basePath + "/security/index.jhtml";
				}
			}
			
			setTimeout("toPreviousPage()", 1000);
		</script>
	</head>
	
	<body>
		<div style="text-align: center; margin-top: 200px;">
			<p>Sorry，金币砸飞了这个页面！</p>
			<p>
				<a href="javascript:toPreviousPage()">如果您的浏览器没有自动跳转，请点击此链接“返回”</a>
			</p>
		</div>
	</body>
</html>