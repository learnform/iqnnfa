<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ResourceBundle res = ResourceBundle.getBundle("env");
%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../../common/util.jsp" %>
<%-- <%@include file="../../common/common-css.jsp"%> --%>
<%-- <%@include file="../../common/common-js.jsp" %> --%>
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/js/easyUI/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/js/easyUI/themes/icon.css">
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/jquery.form.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<table id="mystaffList" title="我的下属" 
	class="easyui-datagrid" style="height:99%;" remoteSort="true"
	data-options="singleSelect:true,
	    fitColumns:true,url: '${pageContext.servletContext.contextPath}/background/electric/overviewList.html?flag=staff',
	    method:'post',rownumbers:true, 
	    pagination:true">
		<thead>
	    <tr>
<!-- 	    	<th data-options="checkbox:true"></th> -->
			<th data-options="field:'userId'" width="50px"></th> 
	    	<th data-options="field:'userName'" width="50px">账号</th> 
	        <th data-options="field:'userRealname'"  width="50px">姓名</th>
	        <th data-options="field:'allotCount'"  width="100px">已分配人数</th>
	        <th data-options="field:'followCount'"  width="100px">跟进人数</th>
	        <th data-options="field:'followInvestCount'"  width="100px">跟进后投资人数</th>
	        <th data-options="field:'followInvestAmount'"  styler="styleColor" width="100px">跟进后投资金额</th>
	        <th data-options="field:'investAmount'"  styler="styleColor" width="100px">客户投资金额</th>
	        <th data-options="field:'notInvestCount'"  width="100px"><span style="color: red;">未投资客户数</span></th>
	        <th data-options="field:'_operate',align:'center'" width="50px" formatter="formatOper">操作</th>
	    </tr>
	    </thead>
	</table>
	<div id="add" class="easyui-dialog" title="客户转交" data-options="iconCls:'icon-save',minimizable:false,tools:'#tt',closed:true" style="width:400px;height:200px;padding:10px;">
	</div>
<script>
// 	$("#mystaffList").datagrid('hideColumn', 'userId');
	function clickCustomer(index){
		$('#mystaffList').datagrid('selectRow',index);
		var row = $('#mystaffList').datagrid('getSelected'); 
		var userRealname =row.userRealname;
		var allotCount =row.allotCount;
		var userId =row.userId;
		console.log(userId)
		$("#add").window({
			title:"客户转交",
			width:$(this).width()*0.2,
			height:$(this).height()*0.3,
			href:'../electric/toTransferCustomer.html?userRealname='+userRealname+'&allotCount='+allotCount+'&userId='+userId,
		});
		$("#add").window("open").window("center");
	}
	//添加基本操作链接
	function formatOper(val,row,index){  
		return	'<a href="#" class="btn l-btn l-btn-small"  onclick="clickCustomer('+index+')">转交客户</a>&nbsp;&nbsp;&nbsp;';
	} 
</script>
</body>
</html>