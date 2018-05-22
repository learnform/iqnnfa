<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="drCarryParamList" title="提现设置" class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:true,
	    fitColumns:true, url: '../carryParam/drCarryParamList.do',
	    method:'post',rownumbers:true, showFooter:true,
	    pagination:true">
		<thead>
	    <tr>
	        <th data-options="field:'id'" hidden="true"></th>
	       	<th data-options="field:'amount'" width="20%" styler="styleColor" formatter="formatAmount">提现免审核金额</th>
	       	<th data-options="field:'dayCounts'" width="10%">每天免费提现次数</th>
	       	<th data-options="field:'monthCounts'" width="10%">每月免费提现次数</th>
	       	<th data-options="field:'fourElementCount'" width="20%">每人免费四要素验证次数</th>
	        <th data-options="field:'name'" width="10%">修改人</th>
			<th data-options="field:'addDate'" width="10%" formatter="formatDateBoxFull">修改时间</th>
	       	<th data-options="field:'_operate',width:80,align:'center',formatter:formatOper" width="10%">基本操作</th>
	    </tr>
	    </thead>
	</table>
	<div id="queryDrCarryParamDialog" class="easyui-dialog" title="提现设置"
		data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:true,maximizable:false,buttons:'#queryDrCrushParamBtn'" style="width:400px;height:240px;padding:5px;">
		<form id="updateDrCarryParamForm">
			<input type="hidden" id="carryParamId"  name="id"/>
			<table align="center">
				<tr>
					<td>
						提现金额小于(无需审核)：
					</td>
					<td>
						<input id="carryParamAmount" type="text" name="amount" class="easyui-numberbox" data-options="required:true,min:0" />元
					</td>
				</tr>
				<tr>
					<td>
						每天免费提现次数：
					</td>
					<td>		
						<input id="carryParamDayCounts" class="easyui-numberbox" name="dayCounts" data-options="required:true,min:0"/>次
					</td>
				</tr>
				<tr>
					<td>
						每月免费提现次数：
					</td>
					<td>		
						<input id="carryParamMonthCounts" class="easyui-numberbox" name="monthCounts" data-options="required:true,min:0"/>次
					</td>
				</tr>
				<tr>
					<td>
						每人免费四要素验证次数：
					</td>
					<td>		
						<input id="carryParamFourElementCount" class="easyui-numberbox" name="fourElementCount" data-options="required:true,min:0"/>次
					</td>
				</tr>
			</table>
		</form>
		<div id="queryDrCrushParamBtn">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateDrCarryParam()">确认修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeDrCarryParamBtn()">取消</a>
		</div>
	</div>
<script type="text/javascript">

	//添加基本操作链接
	function formatOper(val,row,index){  
		return '<a href="#" class="btn l-btn l-btn-small" onclick="updDrCarryParamBtn('+index+')">修改</a>';
	} 
	
	//打开提现设置dialog
	function updDrCarryParamBtn(index){  
		$('#drCarryParamList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drCarryParamList').datagrid('getSelected'); 
		var url = "${apppath}/carryParam/queryDrCarryParam.do?id="+row.id;
		$.ajax({
			url: url,
			dataType:"json",
			success:function(result){
				if(result.success){
					$("#carryParamId").val(result.map.drCarryParam.id);
					$("#carryParamAmount").numberbox('setValue',result.map.drCarryParam.amount);
					$("#carryParamDayCounts").numberbox('setValue',result.map.drCarryParam.dayCounts);
					$("#carryParamMonthCounts").numberbox('setValue',result.map.drCarryParam.monthCounts);
					$("#carryParamFourElementCount").numberbox('setValue',result.map.drCarryParam.fourElementCount);
					$("#queryDrCarryParamDialog").dialog("open");
				}else{
					$.messager.alert("提示信息",result.errorMsg);
				}
			}
	  	});
	}
	
	//修改提现设置
	function updateDrCarryParam(){  
		var validate = $("#updateDrCarryParamForm").form("validate");
		if(!validate){
			return false;
		}
   		$.ajax({
          	url: "${apppath}/carryParam/updateDrCarryParam.do",
            type: 'POST',
            data:$("#updateDrCarryParamForm").serialize(),  
            success:function(result){
				if(result.success){
					$.messager.alert("提示信息",result.msg);
					$("#drCarryParamList").datagrid("reload");
					$("#queryDrCarryParamDialog").dialog("close");
				}else{
					$.messager.alert("提示信息",result.errorMsg);
				}
			}
        });
	}
	
	//关闭窗口
	function closeDrCarryParamBtn(){  
		$("#drCarryParamList").datagrid("reload");
		$("#queryDrCarryParamDialog").dialog("close");
	}
	
</script>
</body>
</html>

