<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="drProductRepairList" title="补标配置管理" 
	class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:true,
	    fitColumns:true, url: '../repair/drProductRepairList.do',
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#drProductRepairTools'">
		<thead>
	    <tr>
	    	<th data-options="field:'id'" hidden="true">序号</th>
	    	<th data-options="field:'deadline1'" hidden="true">序号</th>
	    	<th data-options="field:'deadline2'" hidden="true">序号</th>
	    	<th data-options="field:'name'" width="10%">补标名称</th>
	        <th data-options="field:'deadline'" width="10%">产品投资期限</th>
	        <th data-options="field:'raiseDeadline'" width="10%">募集期（小时）</th>
	       	<th data-options="field:'amount'" width="5%">补标触发金额</th>
	       	<th data-options="field:'type'" width="5%" formatter="formatType">补标类型</th>
	        <th data-options="field:'content'" width="5%" formatter="formatContent">奖励内容</th>
	        <th data-options="field:'status'" width="5%" formatter="formatStatus">状态</th>
	       	<th data-options="field:'addUserName'" width="10%">添加人</th>
	        <th data-options="field:'addDate'" width="10%" formatter="formatDateBoxFull">添加时间</th>
	        <th data-options="field:'updUserName'" width="10%">修改人</th>
	        <th data-options="field:'updDate'" width="10%" formatter="formatDateBoxFull">修改时间</th>
			<th data-options="field:'_operate',align:'center'" width="8%" formatter="formatOper">基本操作</th>
	    </tr>
	    </thead>
	</table>
	<div id="drProductRepairTools" style="padding:5px;height:750">
	  	<form id="drProductRepairForm">
	  		补标名称:<input id="searchDrProductRepairName" name="name" class="easyui-textbox"  size="15" style="width:200px"/>
	  		产品投资期限≥<input id="searchDrProductRepairDeadline1" name="deadline1" class="easyui-textbox" style="width:100px">
	  		＜<input id="searchDrProductRepairDeadline2" name="deadline2"  class="easyui-textbox" style="width:100px">
	  		
	    	<a id="searchDrProductRepair" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	    	<a id="resetDrProductRepair" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="addDrProductRepairBtn()">新增补标配置</a>	
	    </form>
	</div>
	
	<div id="addDrProductRepairDialog" class="easyui-dialog" title="新增补标配置"
		data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:true,maximizable:false,buttons:'#addDrProductRepairDialogBtn'" style="width:600px;height:300px;padding:5px;">
		<form id="addDrProductRepairForm">
			<table align="center">
				<tr>
					<td align="left">补标名称：</td>
					<td>
						<input name="name" type="text" class="easyui-textbox" data-options="required:true"/>
					</td>
	
					<td align="left">补标触发金额：</td>
					<td>
						<input name="amount" type="text" class="easyui-numberbox" data-options="required:true,min:0"/>元
					</td>
				</tr>
				<tr>
					<td align="left">补标奖励类型：</td>
					<td colspan="3">
						<input name="type" type="radio" checked="checked" value="1" />返现(元)
						<input name="type" type="radio" value="2" />加息(%)
						<!--input name="type" type="radio" value="3" />翻倍(倍)-->
					</td>
				</tr>
				<tr>
					<td align="left">奖励内容：</td>
					<td colspan="3">
						<input name="content" type="text" class="easyui-numberbox" data-options="required:true,min:0"/>
					</td>
				</tr>
				<tr>
					<td align="left">产品投资期限：</td>
					<td colspan="3">
						≥<input name="deadline1" type="text" class="easyui-numberbox" data-options="required:true,min:0"/>
						＜<input name="deadline2" type="text" class="easyui-numberbox" data-options="required:true,min:0"/>
					</td>
				</tr>
				<tr>
					<td align="left">募集期（小时）：</td>
					<td colspan="3">
						≤<input name="raiseDeadline" type="text" class="easyui-numberbox" data-options="required:true,min:0"/>
					</td>
				</tr>
			</table>
		</form>
		<div id="addDrProductRepairDialogBtn">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="addDrProductRepair()">确定</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeAddDrProductRepaiDialog()">取消</a>
		</div>
	</div>
	
	<div id="updDrProductRepairDialog" class="easyui-dialog" title="修改补标配置"
		data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:true,maximizable:false,buttons:'#updDrProductRepairDialogBtn'" style="width:600px;height:300px;padding:5px;">
		<form id="updDrProductRepairForm">
			<input type="hidden" id="drProductRepairId"  name="id"/>
			<table align="center">
				<tr>
					<td align="left">补标名称：</td>
					<td>
						<input id="drProductRepairName" name="name" type="text" class="easyui-textbox" data-options="required:true"/>
					</td>
	
					<td align="left">补标触发金额：</td>
					<td>
						<input id="drProductRepairAmount" name="amount" type="text" class="easyui-numberbox" data-options="required:true,min:0"/>元
					</td>
				</tr>
				<tr>
					<td align="left">补标奖励类型：</td>
					<td colspan="3">
						<input class='drProductRepairType' name="type" type="radio" value="1" />返现(元)
						<input class='drProductRepairType' name="type" type="radio" value="2" />加息(%)
						<!-- input class='drProductRepairType' name="type" type="radio" value="3" />翻倍(倍)-->
					</td>
				</tr>
				<tr>
					<td align="left">奖励内容：</td>
					<td colspan="3">
						<input id="drProductRepairContent" name="content" type="text" class="easyui-numberbox" data-options="required:true,min:0"/>
					</td>
				</tr>
				<tr>
					<td align="left">产品投资期限：</td>
					<td colspan="3">
						≥<input id="drProductRepairDeadline1" name="deadline1" type="text" class="easyui-numberbox" data-options="required:true,min:0"/>
						＜<input id="drProductRepairDeadline2" name="deadline2" type="text" class="easyui-numberbox" data-options="required:true,min:0"/>
					</td>
				</tr>
				<tr>
					<td align="left">募集期（小时）：</td>
					<td colspan="3">
						≤<input id="drProductRepairRaiseDeadline" name="raiseDeadline" type="text" class="easyui-numberbox" data-options="required:true,min:0"/>
					</td>
				</tr>
			</table>
		</form>
		<div id="updDrProductRepairDialogBtn">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="updDrProductRepair()">确定</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeUpdDrProductRepaiDialog()">取消</a>
		</div>
	</div>
<script type="text/javascript">
	//重置按钮
	$('#resetDrProductRepair').click(function(){
		$("#drProductRepairForm").form("reset");
		$("#drProductRepairList").datagrid("load", {});
	});
	
	//查询按钮
	$('#searchDrProductRepair').click(function(){
 		$('#drProductRepairList').datagrid({
			queryParams: {
				name: $('#searchDrProductRepairName').val(),
				deadline1: $('#searchDrProductRepairDeadline1').val(),
				deadline2: $('#searchDrProductRepairDeadline2').val(),
			}
		}); 
	});
	
	//添加基本操作链接
	function formatOper(val,row,index){  
		return	'<a href="#" class="btn l-btn l-btn-small" onclick="updDrProductRepairBtn('+index+')">修改</a>';
	} 
		
	//补标类型 1-返现 2-加息 3-翻倍
	function formatType(val,row,index){  
		if(row.type == 1){
			return	'返现';
		}
		if(row.type == 2){
			return	'加息';
		}
		if(row.type == 3){
			return	'翻倍';
		}

	} 
	
	//奖励内容
	function formatContent(val,row,index){  
		if(row.type == 1){
			return	row.content+'元';
		}
		if(row.type == 2){
			return	row.content+'%';
		}
		if(row.type == 3){
			return	row.content+'倍';
		}
	} 
	
	//状态 1-有效 0-失效
	function formatStatus(value,row,index){
		if(row.status == "1"){
			return '<a href="#" onclick="updateDrProductRepairIsStatusBtn('+index+')">有效</a>';
		}else{
			return '<a href="#" onclick="updateDrProductRepairIsStatusBtn('+index+')">失效</a>';
		}
	}
	
	//更改是否有效
	function updateDrProductRepairIsStatusBtn(index){  
		$('#drProductRepairList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drProductRepairList').datagrid('getSelected'); 
		$.messager.confirm('操作提示', '你确定更改吗？', function(r){
			if(r){
				var url = "../repair/updateDrProductRepairIsStatus.do?id="+row.id+"&status="+row.status;
				$.ajax({
					url: url,
					dataType:"json",
					success:function(){
						$('#drProductRepairList').datagrid('reload');
						$.messager.alert("操作提示", "操作成功");
					}
			  	});
			}
		});
	} 
	
	//打开新增补标配置dialog
	function addDrProductRepairBtn(index){
		$("#addDrProductRepairDialog").dialog("open");
	}
	
	//新增补标配置
	function addDrProductRepair(index){
		var validate = $("#addDrProductRepairForm").form("validate");
		if(!validate){
			return false;
		}
		var url = "${apppath}/repair/addDrProductRepair.do";
		$.ajax({
			url: url,
            type: 'POST',
			data:$("#addDrProductRepairForm").serialize(),  
			success:function(result){
				if(result.success){
					$("#addDrProductRepairForm").form("clear");
					$.messager.alert("操作提示", result.msg);
					$('#drProductRepairList').datagrid('reload');
					$("#addDrProductRepairDialog").dialog("close");
				}else{
					$.messager.alert("提示信息",result.errorMsg);
					$('#drProductRepairList').datagrid('reload');
					$("#addDrProductRepairDialog").dialog("close");
				}
			}
	  	});
	}
	
	//打开修改补标配置dialog
	function updDrProductRepairBtn(index){
		$('#drProductRepairList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drProductRepairList').datagrid('getSelected'); 
	    $("#drProductRepairId").val(row.id);
		$("#drProductRepairName").textbox('setValue',row.name);
		$("#drProductRepairAmount").numberbox('setValue',row.amount);	
		$('.drProductRepairType[value="'+row.type+'"]').prop('checked',true);
		$("#drProductRepairContent").numberbox('setValue',row.content);	
		$("#drProductRepairDeadline1").numberbox('setValue',row.deadline1);	
		$("#drProductRepairDeadline2").numberbox('setValue',row.deadline2);		
		$("#drProductRepairRaiseDeadline").numberbox('setValue',row.raiseDeadline);
				
		$("#updDrProductRepairDialog").dialog("open",row);
	}
	
	//修改补标配置
	function updDrProductRepair(index){
		var validate = $("#updDrProductRepairForm").form("validate");
		if(!validate){
			return false;
		}
		var url = "${apppath}/repair/updDrProductRepair.do";
		$.ajax({
			url: url,
            type: 'POST',
			data:$("#updDrProductRepairForm").serialize(),  
			success:function(result){
				if(result.success){
					$.messager.alert("操作提示", result.msg);
					$('#drProductRepairList').datagrid('reload');
					$("#updDrProductRepairDialog").dialog("close");
				}else{
					$.messager.alert("提示信息",result.errorMsg);
					$('#drProductRepairList').datagrid('reload');
					$("#updDrProductRepairDialog").dialog("close");
				}
			}
	  	});
	}
	
	//关闭Dialog
	function closeAddDrProductRepaiDialog(){  
		$("#drProductRepairList").datagrid("reload");
		$("#addDrProductRepairDialog").dialog("close");
	}
	
	//关闭Dialog
	function closeUpdDrProductRepaiDialog(){  
		$("#drProductRepairList").datagrid("reload");
		$("#updDrProductRepairDialog").dialog("close");
	}
</script>
</body>
</html>

