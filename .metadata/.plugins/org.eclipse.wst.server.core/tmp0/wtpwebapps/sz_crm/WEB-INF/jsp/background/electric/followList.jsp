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
	<div id="ztth_load"></div>
	<div align="center">用户姓名：<span id="userName"></span>
	&nbsp;&nbsp;&nbsp;手机号：<input type="text" id="field" style="width: 40px;" onchange="fieldPhone()"/><span id="mobilePhone"></span>
	<input type="hidden" value="${mobilePhone}" id = "phone"/>
	<input type="hidden" id="huid" name="uid" value="${uid}"/>
	<input type="hidden" id = "callerId"/>
	</div><br>
	<table id="crmstaffList" title="电销专员" 
	class="easyui-datagrid" style="height:60%;" remoteSort="true"
	data-options="singleSelect:true,
	    fitColumns:true, url: '${pageContext.servletContext.contextPath}/background/electric/followList.html?uid=${uid}',
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#followTools'">
		<thead>
	    <tr>
<!-- 	    	<th data-options="checkbox:true"></th> -->
	    	<th data-options="field:'uid'" width="50px">序号</th> 
	        <th data-options="field:'note'"  width="150px">沟通记录</th>
	        <th data-options="field:'statusTo'"  width="100px">跟进状态</th>
	        <th data-options="field:'userRealname'"  width="100px">责任人</th>
	        <th data-options="field:'advanceDate'"  width="100px" formatter="formatDateBox">预约时间</th>
	        <th data-options="field:'addTime'"  width="100px"  formatter="formatDateBoxFull">记录时间</th>
	    </tr>
	    </thead>
	</table>
	<div id="add" class="easyui-dialog" title="新增沟通记录" data-options="iconCls:'icon-save',minimizable:false,tools:'#tt',closed:true" style="width:400px;height:200px;padding:10px;">
		<form id="staffListForm" method="post">
			<table>
				<tr>
					<td align="right">跟进流程状态：</td>
					<td align="left">
						<select id="sta" name="status">
							<option value="0">未接听</option>
							<option value="1">待联系</option>
							<option value="2">持续跟进</option>
							<option value="3">高意向</option>
							<option value="4">成功</option>
							<option value="5">失败</option>
						 </select>
					</td>
				</tr>
				<tr>
					<td align="right">预约时间：</td>
						<td align="left"><input id="advanceDate" name="advanceDate" class="easyui-datebox" style="width:100px"/>
					</td>
				</tr>
				<tr>
					<td align="right">记录：</td>
					<td align="left"><textarea id="note" name="note" style="width: 200px;height: 50px;"></textarea>
					<input type="hidden" name="uid" id="uid"/>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveFollow()">保存</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="followTools" style="padding:5px;">
				<a id="search" href="javascript:void(0)" class="easyui-linkbutton" onclick="clickAdd()" iconCls="icon-add">新增</a>
		</div>
<script>
function formatDateBox(value) {  
    if (value == null || value == '') {  
        return '';  
    }  
    var dt = parseToDate(value);  
    return dt.format("yyyy-MM-dd");  
}  
		
		function saveFollow(){
			var uid = $("#huid").val();
			var note = $("#note").val();
			var status=   $("#sta option:selected").val();
			var advanceDate = $('#advanceDate').combobox('getValue');
			var parameter={
					uid:uid,
					note:note,
					advanceDate:advanceDate,
					status:status
	    	    };
			$.ajax({
				url:"${pageContext.servletContext.contextPath}/background/electric/add.html?",
				type:"POST",
				data:parameter,
				success:function(isFlag){
					if(isFlag==0){
						$.messager.alert("提示信息","新增跟进记录成功！","",function(){
							$("#add").dialog("close");
							$("#w").dialog("close");
						});
					}else{
						$.messager.alert("提示信息","新增跟进记录失败！");
					}
				}
			});
		}
		
		$(function(){
			var userName="${userName}";
			if(userName==null||userName=="undefined"||userName=="null"){
				userName="未知";
			}
			$("#userName").text(userName);
	 		$("#mobilePhone").text('${mobile}');
		});
		
		function clickAdd(){
			$("#uid").val($("#huid").val());
			$('#add').dialog('open');
		}
		
		function fieldPhone(){
			$("#phone").val($("#field").val()+$("#phone").val());
			 $('#ztth_load').load('${pageContext.servletContext.contextPath}/ztth_wincall.jsp');
		}
		var userId="${userId}";
		//角色key
		var roleKey="${roleKey}";
		//上级
		var leaderId="${leaderUid}";
		var callerID;
// 		if(userId == 1){
<%-- 			callerID= <%=res.getString("system.leader.callerID0")%>; --%>
// 		}
		if(userId == 6 || leaderId == 6){
			callerID= <%=res.getString("system.leader.callerID1")%>;
		}
		if(userId == 7 || leaderId == 7){
			callerID= <%=res.getString("system.leader.callerID2")%>;
		}
		$("#callerId").val(callerID);
	    var ag_num_value = "${agNum}"; //动态设置变量ag_num_value(坐席工号);
	    var ag_phone_value = "${agentPhone}"; //动态设置变量ag_phone_value(分机号码)
	    $('#ztth_load').load('${pageContext.servletContext.contextPath}/ztth_wincall.jsp');
	</script>
</body>
</html>