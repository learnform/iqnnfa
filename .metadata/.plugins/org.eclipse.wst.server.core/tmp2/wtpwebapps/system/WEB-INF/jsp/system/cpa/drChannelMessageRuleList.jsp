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
	<table id="drChannelMessageRuleList" title="站内信触发" class="easyui-datagrid"
		style="height:99%;width:99.9%"
		data-options="singleSelect:true,
	    fitColumns:true, url: '../channelMessage/drChannelMessageRuleList.do',
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#drChannelMessageRuleTools'">
		<thead>
			<tr>
				<th data-options="field:'id'" hidden="hidden">ID</th>
				<th data-options="field:'message'" hidden="hidden">站内信</th>
				<th data-options="field:'channelCode'" width="8%">渠道号</th>
				<th data-options="field:'channelNames'" width="10%">渠道名称</th>
				<th data-options="field:'deadline'"  width="10%">投资期限(天)</th>
				<th data-options="field:'amount'"  width="10%" formatter="formatAmount">投资金额(元)</th>
				<th data-options="field:'firstCastName'"  width="10%">是否首投</th>				
				<th data-options="field:'startTime'" width="10%" formatter="formatDateBoxFull">开始时间</th>
				<th data-options="field:'endTime'" width="10%" formatter="formatDateBoxFull">结束时间</th>
				<th data-options="field:'status'" width="8%" formatter="formatStatus">状态</th>
				<th data-options="field:'addName'" width="8%">添加人</th>
				<th data-options="field:'addTime'" formatter="formatDateBoxFull" width="10%">添加时间</th>
				<th data-options="field:'_operate',width:200,align:'center',formatter:formatOper">基本操作</th>
			</tr>
		</thead>
	</table>
	<div id="drChannelMessageRuleTools" style="padding:5px;height:750">
		<form id="drChannelMessageRuleForm">
			渠道号:<input id="searchDrChannelMessageRuleCode" name="channelCode" class="easyui-textbox"  size="15" style="width:100px"/>
	  		渠道名称:<input id="searchDrChannelMessageRuleName" name="channelName" class="easyui-textbox"  size="15" style="width:100px"/>
	  		当前状态: <select  id="searchDrChannelMessageRuleStatus" name="status" style="width:100px;" class="easyui-combobox">
				 	<option value=''>全部</option>
					<c:forEach var="map" items="${status}">
						<option value='${map.key}'>${map.value}</option>
			        </c:forEach>
	           		</select>
			<a id="searchDrChannelMessageRuleBtn" href="#" class="easyui-linkbutton" iconCls="icon-search">查询</a> 
			<a id="resetDrChannelMessageRuleBtn" href="#" class="easyui-linkbutton" iconCls="icon-reload">重置</a> 
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="addDrChannelMessageRuleDialog()">新增</a>
		</form>
	</div>
	
	<!-- 新增站内信触发 -->
	<div id="addDrChannelMessageRuleDialog" class="easyui-dialog" title="新增站内信触发"
		data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:true,maximizable:false,buttons:'#addDrChannelMessageRuleBtn'"
		style="width:600px;height:330px;padding:20px;">
		<form id="addDrChannelMessageRuleForm">
			<table align="center">
				<tr>
					<td>渠道名称：</td>
					<td colspan="3">
	  					<select class="easyui-combogrid" name="channelCode" style="height:35px;width:425px;padding-bottom: 3px;" data-options="
							panelWidth: 425,
							multiple: true,
							multiline:true,
							editable:false,
							editable:false,
							required:true,
							idField: 'code',
							textField: 'code',
							url: '../channel/drAllChannelInfoBossList.do',
							method: 'get',
							columns: [[
								{field:'id',checkbox:true},
								{field:'code',title:'渠道号',width:80},
								{field:'name',title:'渠道名称',width:80},
							]],
							fitColumns: true
						">
						</select>
					</td>
				</tr>
				<tr>
					<td>投资期限(天)≥：</td>
					<td>
						<input name="deadline" class="easyui-textbox" style="width:150px" data-options="required:true"/>
					</td>
					<td>投资金额(元)≥：</td>
					<td>
						<input name="amount" class="easyui-numberbox" style="width:150px" data-options="required:true,min:100"/>
					</td>
				</tr>
				<tr>
					<td>开始时间：</td>
    				<td>
    					<input id="drChannelMessageRuleStartTime" name="startTime" class="easyui-datebox" style="width:150px" data-options="prompt:'请选择开始日期',editable:false,required:true"/>
    				</td>
    				<td>结束时间：</td>
    				<td>
    					<input name="endTime" class="easyui-datebox" style="width:150px" data-options="prompt:'请选择结束日期',editable:false,required:true,validType:'equaldDate[\'#drChannelMessageRuleStartTime\']'">
    				</td>
				</tr>
				<tr>
					<td colspan="2">是否仅活动期间第一次满足条件的投资发送：</td>
					<td>
						<select name="firstCast" class="easyui-combobox" style="width:50px;" panelHeight="50px" data-options="required:true">
							<option value='0' >否</option>
							<option value='1' >是</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>站内信：</td>
					<td colspan="3">
						<input class="easyui-textbox" name="message" style="height:100px;width:425px;" data-options="required:true,multiline:true,validType:'maxLength[2000]'"/>
					</td>
				</tr>
			</table>
		</form>
		<div id="#addDrChannelMessageRuleBtn" align="center">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="addChannelMessageRule()">新增</a>
		</div>
	</div>
	
	<!-- 修改站内信触发 -->
	<div id="updDrChannelMessageRuleDialog" class="easyui-dialog" title="修改站内信触发"
		data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:true,maximizable:false,buttons:'#updDrChannelMessageRuleBtn'"
		style="width:600px;height:220px;padding:20px;">
		<form id="updDrChannelMessageRuleForm">
			<input type="hidden" id="updDrChannelMessageRuleId" name="id"> 
			<table align="center">
				<tr>
					<td>站内信：</td>
					<td colspan="3">
						<input class="easyui-textbox" id="updDrChannelMessageRuleMessage" name="message" style="height:100px;width:425px;" data-options="required:true,multiline:true,validType:'maxLength[2000]'"/>
					</td>
				</tr>
			</table>
		</form>
		<div id="#updDrChannelMessageRuleBtn" align="center">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" onclick="updChannelMessageRule()">修改</a>
		</div>
	</div>
<script type="text/javascript">

	//重置按钮
	$('#resetDrChannelMessageRuleBtn').click(function(){
		$("#drChannelMessageRuleForm").form("reset");
		$("#drChannelMessageRuleList").datagrid("load", {});
	});
	
	//查询按钮
	$('#searchDrChannelMessageRuleBtn').click(function(){
 		$('#drChannelMessageRuleList').datagrid({
			queryParams: {
				channelCode: $('#searchDrChannelMessageRuleCode').val(),
				channelName: $('#searchDrChannelMessageRuleName').val(),
				status: $('#searchDrChannelMessageRuleStatus').combobox("getValue")
			}
		}); 
	});
	
	//打开添加dialog
	function addDrChannelMessageRuleDialog(){  
		$("#addDrChannelMessageRuleForm").form("reset");
		$("#addDrChannelMessageRuleDialog").dialog("open");
	}
	
	//添加
	function addChannelMessageRule(){
		var validate = $("#addDrChannelMessageRuleForm").form("validate");
		if(!validate){
			return false;
		}
		$.ajax({
          	url: "${apppath}/channelMessage/addDrChannelMessageRule.do",
            type: 'POST',
            data:$("#addDrChannelMessageRuleForm").serialize(),  
            success:function(result){
				if(result.success){
					$.messager.alert("提示信息",result.msg);
					$("#drChannelMessageRuleList").datagrid("reload");
					$("#addDrChannelMessageRuleDialog").dialog("close");
				}else{
					$.messager.alert("提示信息",result.errorMsg);
				}
			}	
        });
        return false; // 阻止表单自动提交事件
	}
	
	//添加基本操作链接
	function formatOper(val,row,index){  
		return	'<a href="#" class="btn l-btn l-btn-small" onclick="updateDrChannelMessageRuleBtn('+index+')">修改</a>';
	}
	
	//打开修改dialog
	function updateDrChannelMessageRuleBtn(index){  
		$('#drChannelMessageRuleList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drChannelMessageRuleList').datagrid('getSelected'); 
	    $("#updDrChannelMessageRuleId").val(row.id);
		$("#updDrChannelMessageRuleMessage").textbox('setValue',row.message);
		$("#updDrChannelMessageRuleDialog").dialog("open");
	} 
	
	//修改
	function updChannelMessageRule(){
		var validate = $("#updDrChannelMessageRuleForm").form("validate");
		if(!validate){
			return false;
		}
		$.ajax({
          	url: "${apppath}/channelMessage/updateDrChannelMessageRule.do",
            type: 'POST',
            data:$("#updDrChannelMessageRuleForm").serialize(),  
            success:function(result){
				if(result.success){
					$.messager.alert("提示信息",result.msg);
					$("#drChannelMessageRuleList").datagrid("reload");
					$("#updDrChannelMessageRuleDialog").dialog("close");
				}else{
					$.messager.alert("提示信息",result.errorMsg);
				}
			}	
        });
        return false; // 阻止表单自动提交事件
	}
	
	function formatStatus(value,row,index){
		if(value == "1"){
			return '<a href="#" onclick="updateDrChannelMessageRuleStatusBtn('+index+')">有效</a>';
		}else{
			return '<a href="#" onclick="updateDrChannelMessageRuleStatusBtn('+index+')">无效</a>';
		}
	} 
	
	//更改是否有效
	function updateDrChannelMessageRuleStatusBtn(index){  
		$('#drChannelMessageRuleList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drChannelMessageRuleList').datagrid('getSelected'); 
		$.messager.confirm('操作提示', '你确定更改吗？', function(r){
			if(r){
				var url = "../channelMessage/updateDrChannelMessageRuleStatus.do?id="+row.id+"&status="+row.status;
				$.ajax({
					url: url,
					dataType:"json",
					success:function(result){
						if(result.success){
							$('#drChannelMessageRuleList').datagrid('reload');
							$.messager.alert("操作提示", result.msg);
						}else{
							$.messager.alert("提示信息",result.errorMsg);
						}
					}
			  	});
			}
		});
	} 
</script>
</body>
</html>