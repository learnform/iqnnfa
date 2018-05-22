<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
<script type="text/javascript" src="../js/common/jquery.form.js"></script>
</head>
<body>
	<table id="drCashRuleList" title="返现红包规则" class="easyui-datagrid"
		style="height:99%;width:99.9%"
		data-options="singleSelect:true,
	    fitColumns:true, url: '../caseRule/drCashRuleList.do',
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#drCashRuleTools'">
		<thead>
			<tr>
				<th data-options="field:'id'" hidden="hidden">规则ID</th>
				<th data-options="field:'deadline'" width="15%">投资期限(天)≥</th>
				<th data-options="field:'amount'" width="15%">投资金额(天)≥</th>
				<th data-options="field:'rate'" width="15%">最大返现利率(%)</th>
				<th data-options="field:'expiryDate'" width="15%">有效期(天)</th>
			</tr>
		</thead>
	</table>
	<div id="drCashRuleTools" style="padding:5px;height:750">
		<form id="drCashRuleForm">
			投资期限：<input id="searchDrCashRuleDeadline" name="deadline" class="easyui-numberbox" style="width:100px"/>
			投资金额：<input id="searchDrCashRuleAmount" name="amount" class="easyui-numberbox" style="width:100px"/>
			<a id="searchDrCashRuleBtn" href="#" class="easyui-linkbutton" iconCls="icon-search">查询</a> 
			<a id="resetDrCashRuleBtn" href="#" class="easyui-linkbutton" iconCls="icon-reload">重置</a> 
			<a id="importDrCashRuleBtn" href="#" class="easyui-linkbutton" iconCls="icon-undo">导入</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-redo" onclick="exportDrCashRuleBtn()">导出</a> 
		</form>
	</div>
	
	<div id="importDrCashRuleDialog" class="easyui-dialog" title="导入临时红包规则"
		data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:true,maximizable:false,buttons:'#importDrCashRuleDialogBtn'" 
		style="width:420px;height:200px;padding:15px;">
		<form id="importDrCashRuleForm" enctype="multipart/form-data">
			<table align="center">
				<tr>
					<td colspan="2">
						<input id="importDrCashRuleFile" type="file" name="file" onchange="verifyFile(this)"/>
					</td>
				</tr>
			</table>
		</form>
		<div id="importDrCashRuleDialogBtn">
			<a id="importDrCashRule" href="javascript:void(0)" class="easyui-linkbutton" >导入</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeDialog()">取消</a>
		</div>
	</div>
		
<script type="text/javascript">

	//重置按钮
	$('#resetDrCashRuleBtn').click(function(){
		$("#drCashRuleForm").form("reset");
		$("#drCashRuleList").datagrid("load", {});
	});
	
	//查询按钮
	$('#searchDrCashRuleBtn').click(function(){
 		$('#drCashRuleList').datagrid({
			queryParams: {
				deadline: $('#searchDrCashRuleDeadline').numberbox('getValue'),
				amount: $('#searchDrCashRuleAmount').numberbox('getValue')
			}
		}); 
	});
	
	//导入文件窗口
	$('#importDrCashRuleBtn').click(function(){
		$("#importDrCashRuleForm").form("reset");
		$("#importDrCashRuleForm").form("clear");		
		$("#importDrCashRuleDialog").dialog("open");
	});
	
	//关闭窗口
	function closeDialog(){  
		$("#drCashRuleList").datagrid("reload");
		$("#importDrCashRuleDialog").dialog("close");
	}
	
	//上传临时红包规则
	$('#importDrCashRule').click(function(){
		$("#importDrCashRuleForm").ajaxSubmit({
			url:"${apppath}/caseRule/addDrCashRule.do",
			type:"POST",
			data:$("#importDrCashRuleForm").serialize(),
			success: function(result){
				if(result.success){
					$.messager.alert("提示信息",result.msg);
						$('#drCashRuleList').datagrid('reload');
						$("#importDrCashRuleDialog").dialog("close");
				}else{
					$.messager.alert("提示信息",result.errorMsg);
				}
			}
		});
	});
	
	//导出
	function exportDrCashRuleBtn(){
		window.location.href="../caseRule/exportDrCashRule.do?deadline="+$('#searchDrCashRuleDeadline').numberbox('getValue')+
						"&amount="+$('#searchDrCashRuleAmount').numberbox('getValue');
	}
	
	//验证文件
	function verifyFile(obj) {
		if (obj.value == "") {  
			$.messager.alert("提示信息","请上传文件");
	        return false;  
	    } 
        if (! /\.(xls|xlsx)$/.test(obj.value)) {  
        	$.messager.alert("提示信息","文件类型必须是.xls");
            obj.value = "";  
            return false;  
        }
    	return true;  
	}
</script>
</body>
</html>