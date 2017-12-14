<html>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<style type="text/css">
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	text-indent:21.0pt;
	font-size:10.5pt;
	font-family:"Calibri","sans-serif";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
</style>
</head>

<body lang=ZH-CN link=blue vlink=purple style='text-justify-trim:punctuation'>

<div>

	<p class=MsoNormal><span style='font-family:宋体'>此信由</span><span lang=EN-US>UBSP</span><span
	style='font-family:宋体'>系统发出，请勿直接回复，谢谢。</span></p>
	
	<p class=MsoNormal><span lang=EN-US>----------------------------------------------------------------------</span></p>
	
	<p class=MsoNormal></p>
	
	<p class=MsoNormal><span style='font-family:宋体'>亲爱的同事：</span><p/>
	 
	<p style="text-indent: 21pt;" class="MsoNormal"><span style="font-family: 宋体;">以下项目下周要开庭，请提前做好相关准备，不要遗忘。</span></p>

	<#if openCourtProjectList?exists>
	<#list openCourtProjectList as openCourtProject>
	<p style="text-indent: 21pt;" class="MsoNormal"><span style="font-family: 宋体;">${openCourtProject_index+1}、项目名称：${openCourtProject.projectName}    保全编号：${openCourtProject.preserveNo}    开庭时间：${openCourtProject.openCourtTime}    法务专员：${openCourtProject.legalSpecialist} </span></p>	
	</#list>
	</#if>

	<p class=MsoNormal><span lang=EN-US>----------------------------------------------------------------------</span></p>
	
	<p class=MsoNormal><span style='font-family:宋体'>立足大杭州，布局全浙江，发展长三角。</span><span
	lang=EN-US></span></p>

</div>


</body>

</html>