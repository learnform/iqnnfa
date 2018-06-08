<%@include file="/WEB-INF/jsp/common/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../../common/util.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/js/easyUI/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/js/easyUI/themes/icon.css">
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/jquery.form.js"></script>
</head>
<body>
	<table id="drChannelInfoAnalysisList" title="电销概览" 
	class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:true,
	    fitColumns:true, url: '${pageContext.servletContext.contextPath}/background/electric/overviewList.html',
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#drChannelInfoAnalysisTools'">
		<thead>
	    <tr>
<!-- 	    	<th data-options="checkbox:true"></th> -->
	    	<th data-options="field:'userName'" width="50px">账号</th> 
	        <th data-options="field:'userRealname'"  width="50px">姓名</th>
	        <th data-options="field:'allotCount'"  width="100px">已分配人数</th>
	        <th data-options="field:'followCount'"  width="100px">跟进人数</th>
	        <th data-options="field:'followInvestCount'"  width="100px">跟进后投资人数</th>
	        <th data-options="field:'followInvestAmount'"  width="100px">跟进后投资金额</th>
	        <th data-options="field:'investAmount'"  width="100px">客户投资金额</th>
	        <th data-options="field:'notInvestCount'"  width="100px">未投资客户数</th>
	    </tr>
	    </thead>
	</table>
</body>
</html>