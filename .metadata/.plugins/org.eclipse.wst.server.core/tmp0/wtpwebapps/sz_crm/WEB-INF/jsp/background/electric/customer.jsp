<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	<table id="customerList" title="分配客户" 
	class="easyui-datagrid" style="height:80%;" remoteSort="true"
	data-options="singleSelect:true,
	    fitColumns:true, url: '${pageContext.servletContext.contextPath}/background/electric/customer.html',
	    method:'post',rownumbers:true, 
	    pagination:true">
		<thead>
	    <tr>
	    	<th data-options="field:'userId',checkbox:true"></th>
	        <th data-options="field:'userName'"  width="150px">电销专员</th>
	        <th data-options="field:'userRealname'"  width="100px">姓名</th>
	    </tr>
	    </thead>
	</table>
	<div align="center">
	<input type="hidden" value="${ids}" id="ids">
	<a href="#" class="btn l-btn l-btn-small"  onclick="updateDrChannelInfoBtn('+index+')">取消</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="#" class="btn l-btn l-btn-small"  onclick="allotStaff()">确定</a>
	</div>
	<script type="text/javascript">
		function allotStaff(){
			var ids = $("#ids").val();
			var checkedItems = $('#customerList').datagrid('getChecked');
			var userId;			
			$.each(checkedItems, function(index, item){
				userId=item.userId;
			});
			$.ajax({
				url:"${pageContext.servletContext.contextPath}/background/electric/allotCustomer.html?userId="+userId+"&ids="+ids,
				type:"POST",
				success:function(status){
					if(status == 0){
						$.messager.alert("提示信息","分配成功！","",function(){
							location.href ="${pageContext.servletContext.contextPath}/background/electric/toLeaderList.html";
						});
                   	}else{
                   		$.messager.alert("提示信息","分配失败！");
                    }
				}
			});
		}
	</script>
</body>
</html>