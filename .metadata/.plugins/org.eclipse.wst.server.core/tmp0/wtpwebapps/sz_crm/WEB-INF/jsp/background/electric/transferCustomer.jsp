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
	<form id="staffListForm" method="post">
	<div align="center">
		<table>
			<tr>
				<td align="right"><span style="font-size: 16px;">客户数量：</span></td>
				<td align="left">
					<span style="color: red;font-size: 18px;font-weight: 600;font-family:cursive;">${allotCount}</span>
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td align="right"><span style="font-size: 16px;">客户所属员工：</span></td>
				<td align="left">
					<span style="color: red;font-size: 18px;font-weight:  600;font-family:cursive;">${userRealname}</span>
					<input type="hidden" id="sysUser" value="${userId}"/>
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td align="right"><span style="font-size: 16px;">转交给员工：</span></td>
				<td align="left">
					<select id="userId" name="userId" class="easyui-combobox"  required="true" style="width: 80px;">
						<option selected="selected" value="请选择"></option>
					 </select>
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="　提 交　" class="input_btn_style1" onclick="transferCustomer()" />
				</td>
			</tr>
		</table>
	</div>	
	</form>
	<script type="text/javascript">
	function transferCustomer(){
		var userId = $('#userId').combobox('getValue');
		var sysUser = $('#sysUser').val();
		if(userId=="请选择"||userId==""||userId=="undefined"){
			$.messager.alert("提示信息","请选择你要转交客户的员工");
			return false;
		}
		$.ajax({
			url:"${pageContext.servletContext.contextPath}/background/electric/transferCoutomer.html?userId="+userId+'&sysUser='+sysUser,
			type:"POST",
			success:function(status){
				if(status == 0){
					$.messager.alert("提示信息","转接客户成功！","",function(){
						location.href ="${pageContext.servletContext.contextPath}/background/electric/toMyStaffList.html";
					});
               	}else{
               		$.messager.alert("提示信息","转接客户失败！");
                }
			}
		});
	}
	$.ajax({  
        url: "${pageContext.servletContext.contextPath}/background/electric/employeeList.html",    
        cache: false,  
        dataType:"json",  
        success: function(json){  
            $("#userId").combobox({  
                data:json,    
                valueField:'userId',  
                textField:'userRealname',  
                editable:false  
            });  
        }  
    });  
	
	
// 		function allotStaff(){
// 			var ids = $("#ids").val();
// 			var checkedItems = $('#customerList').datagrid('getChecked');
// 			var userId;			
// 			$.each(checkedItems, function(index, item){
// 				userId=item.userId;
// 			});
// 			$.ajax({
// 				url:"${pageContext.servletContext.contextPath}/background/electric/allotCustomer.html?userId="+userId+"&ids="+ids,
// 				type:"POST",
// 				success:function(status){
// 					if(status == 0){
// 						$.messager.alert("提示信息","分配成功！","",function(){
// 							location.href ="${pageContext.servletContext.contextPath}/background/electric/toLeaderList.html";
// 						});
//                    	}else{
//                    		$.messager.alert("提示信息","分配失败！");
//                     }
// 				}
// 			});
// 		}
	</script>
</body>
</html>