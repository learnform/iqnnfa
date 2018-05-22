<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="drAutoRewardList" title="自投奖励配置" 
	class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:true,
	    fitColumns:true, url: '../autoReward/drAutoRewardList.do',
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#drAutoRewardTools'">
		<thead>
	    <tr>
	    	<th data-options="field:'id'" hidden="true">序号</th>
	    	<th data-options="field:'rewardName'" width="10%">奖励名称</th>
	        <th data-options="field:'startAmount'" width="10%" styler="styleColor" formatter="formatAmount">起投金额(元)</th>
	        <th data-options="field:'rewardRed'" width="10%">奖励红包(元)</th>
	       	<th data-options="field:'rewardStatus'" width="10%" formatter="formatStatus">奖励状态</th>
	       	<th data-options="field:'addUserName'" width="10%">添加人</th>
	        <th data-options="field:'addDate'" width="10%" formatter="formatDateBoxFull">添加时间</th>
	    </tr>
	    </thead>
	</table>
	<div id="drAutoRewardTools" style="padding:5px;height:750">
	  	<form id="drAutoRewardForm">
	  		补标名称:<input id="searchDrAutoRewardName" name="rewardName" class="easyui-textbox"  size="15" style="width:200px"/>
	  		奖励状态: <select  id="searchDrAutoRewardStatus" name="rewardStatus" style="width:100px;" class="easyui-combobox">
				 	<option value=''>全部</option>
					<c:forEach var="map" items="${rewardStatus}">
						<option value='${map.key}'>${map.value}</option>
			        </c:forEach>
	           		</select>
	  		
	    	<a id="searchDrAutoReward" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	    	<a id="resetDrAutoReward" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="addDrAutoRewardBtn()">新增</a>	
	    </form>
	</div>
	
	<div id="addDrAutoRewardDialog" class="easyui-dialog" title="新增自投奖励配置"
		data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:true,maximizable:false,buttons:'#addDrAutoRewardDialogBtn'" style="width:300px;height:200px;padding:5px;">
		<form id="addDrAutoRewardForm">
			<table align="center">
				<tr>
					<td align="left">奖励名称：</td>
					<td>
						<input name="rewardName" type="text" class="easyui-textbox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td align="left">起投金额：</td>
					<td colspan="3">
						<input name="startAmount" type="text" class="easyui-numberbox" data-options="required:true,min:100"/>
					</td>
				</tr>
				<tr>
					<td align="left">奖励红包：</td>
					<td colspan="3">
						<input name="rewardRed" type="text" class="easyui-numberbox" data-options="required:true,min:0"/>
					</td>
				</tr>
			</table>
		</form>
		<div id="addDrAutoRewardDialogBtn">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="addDrAutoReward()">确定</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeAddDrAutoRewardDialog()">取消</a>
		</div>
	</div>
<script type="text/javascript">
	//重置按钮
	$('#resetDrAutoReward').click(function(){
		$("#drAutoRewardForm").form("reset");
		$("#drAutoRewardList").datagrid("load", {});
	});
	
	//查询按钮
	$('#searchDrAutoReward').click(function(){
 		$('#drAutoRewardList').datagrid({
			queryParams: {
				rewardName: $('#searchDrAutoRewardName').val(),
				rewardStatus: $('#searchDrAutoRewardStatus').combobox("getValue")
			}
		}); 
	});
	
	//状态 1-有效 0-失效
	function formatStatus(value,row,index){
		if(row.rewardStatus == "1"){
			return '<a href="#" onclick="updateDrAutoRewardIsStatusBtn('+index+')">有效</a>';
		}else{
			return '失效';
		}
	}
	
	//更改是否有效
	function updateDrAutoRewardIsStatusBtn(index){  
		$('#drAutoRewardList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drAutoRewardList').datagrid('getSelected'); 
		$.messager.confirm('操作提示', '你确定更改吗？', function(r){
			if(r){
				var url = "../autoReward/updateDrAutoRewardIsStatus.do?id="+row.id;
				$.ajax({
					url: url,
					dataType:"json",
					success:function(){
						$('#drAutoRewardList').datagrid('reload');
						$.messager.alert("操作提示", "操作成功");
					}
			  	});
			}
		});
	} 
	
	//打开新增自投奖励配置dialog
	function addDrAutoRewardBtn(index){
		$("#addDrAutoRewardDialog").dialog("open");
	}
	
	//新增自投奖励配置
	function addDrAutoReward(index){
		var validate = $("#addDrAutoRewardForm").form("validate");
		if(!validate){
			return false;
		}
		var url = "../autoReward/addDrAutoReward.do";
		$.ajax({
			url: url,
            type: 'POST',
			data:$("#addDrAutoRewardForm").serialize(),  
			success:function(result){
				if(result.success){
					$("#addDrAutoRewardForm").form("clear");
					$.messager.alert("操作提示", result.msg);
					$('#drAutoRewardList').datagrid('reload');
					$("#addDrAutoRewardDialog").dialog("close");
				}else{
					$.messager.alert("提示信息",result.errorMsg);
					$('#drAutoRewardList').datagrid('reload');
					$("#addDrAutoRewardDialog").dialog("close");
				}
			}
	  	});
	}
	
	//关闭Dialog
	function closeAddDrAutoRewardDialog(){  
		$("#drAutoRewardList").datagrid("reload");
		$("#addDrAutoRewardDialog").dialog("close");
	}
</script>
</body>
</html>

