<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="drCpaInfoList" title="CPA管理" 
	class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:true,
	    fitColumns:true, url: '../cpa/drCpaInfoList.do',
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#drCpaInfoTools'">
		<thead>
	    <tr>
	    	<th data-options="field:'code'" width="8%">渠道号</th>
	        <th data-options="field:'name'" width="8%">渠道名称</th>
	       	<th data-options="field:'activityCode'" width="8%">活动号</th>
	        <th data-options="field:'activityName'" width="10%">活动名称</th>
	        <th data-options="field:'parameters'" width="15%">其他参数</th>
	       	<th data-options="field:'url'" width="30%">链接地址</th>
	        <th data-options="field:'remark'" width="10%">备注</th>	        
	        <th data-options="field:'status'" width="5%" formatter="formatStatus">状态</th>
	       	<th data-options="field:'userName'" width="10%">添加人</th>
	        <th data-options="field:'addDate'" width="12%" formatter="formatDateBoxFull">添加时间</th>
	        <th data-options="field:'_operate'" width="10%" formatter="downLoandExcel">操作</th>
	    </tr>
	    </thead>
	</table>
	<div id="drCpaInfoTools" style="padding:5px;height:750">
	  	<form id="drCpaInfoForm">
	  		渠道号:<input id="searchDrCpaInfoCode" name="code" class="easyui-textbox"  size="15" style="width:100px"/>
	  		活动号:<input id="searchDrCpaInfoActivityCode" name="activityCode" class="easyui-textbox"  size="15" style="width:100px"/>
	  		链接地址:<input id="searchDrCpaInfoUrl" name="url" class="easyui-textbox"  size="15" style="width:300px"/>	  		
	    	<a id="searchDrCpaInfo" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	    	<a id="resetDrCpaInfo" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="addDrCpaInfoBtn()">生成链接</a>	
	    </form>
	</div>
	<div id="addDrCpaInfoDialog" class="easyui-dialog" title="生成链接"
		data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:true,maximizable:false,buttons:'#addDrCpaInfoBtn'" style="width:400px;height:240px;padding:5px;">
		<form id="addDrCpaInfoForm">
			<table align="center">
				<tr>
					<td>
						渠道名称：
					</td>
					<td>
						<select class="easyui-combogrid" name="cid" style="width:240px;height:50px" data-options="
							panelWidth: 240,
							multiple: true,
							multiline:true,
							editable:false,
							idField: 'id',
							textField: 'name',
							url: '../channel/drAllChannelInfoList.do',
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
					<td>
						活动号：
					</td>
					<td>
						<input type="text" name="activityCode" class="easyui-textbox" data-options="required:true,validType:'noChinese'" style="width:240px"/>
					</td>
				</tr>
				<tr>
					<td>
						活动名称：
					</td>
					<td>		
						<input class="easyui-textbox" name="activityName" data-options="required:true" style="width:240px"/>
					</td>
				</tr>
				<tr>
					<td>
						其它参数：
					</td>
					<td>		
						<input class="easyui-textbox" name="parameters" style="width:240px"/>
					</td>
				</tr>
				<tr>
					<td>
						页面地址：
					</td>
					<td>		
						<input class="easyui-textbox" name="pageUrl" data-options="required:true" style="width:240px"/>
					</td>
				</tr>	
				<tr>
					<td>
						备注：
					</td>
					<td>		
						<input class="easyui-textbox" name="remark" data-options="required:true" style="width:240px"/>
					</td>
				</tr>			
			</table>
		</form>
		<div id="addDrCpaInfoBtn">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="addDrCpaInfo()">添加</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeAddDrCpaInfo()">取消</a>
		</div>
	</div>
<script type="text/javascript">
	//重置按钮
	$('#resetDrCpaInfo').click(function(){
		$("#drCpaInfoForm").form("reset");
		$("#drCpaInfoList").datagrid("load", {});
	});
	
	//查询按钮
	$('#searchDrCpaInfo').click(function(){
 		$('#drCpaInfoList').datagrid({
			queryParams: {
				code: $('#searchDrCpaInfoCode').val(),
				activityCode: $('#searchDrCpaInfoActivityCode').val(),				
				url: $('#searchDrCpaInfoUrl').val(),
			}
		}); 
	});
	
	//导出关键词链接
	function downLoandExcel(val,row,index){  
		return	'<a href="#" class="btn l-btn l-btn-small" onclick="exportChannelKeyWordLinkBtn('+row.id+')">生成关键字链接</a>';
	} 
	function exportChannelKeyWordLinkBtn(index){  
		window.location.href = "${apppath}/cpa/exportChannelKeyWord.do?id="+index;
	}
	
	//添加页面
	function addDrCpaInfoBtn(){  
		$("#addDrCpaInfoForm").form("reset");
		$("#addDrCpaInfoDialog").dialog("open");
	}
	
	//添加CPA
	function addDrCpaInfo(){  
		var validate = $("#addDrCpaInfoForm").form("validate");
		if(!validate){
			return false;
		}
   		$.ajax({
          	url: "${apppath}/cpa/addDrCpaInfo.do",
            type: 'POST',
            data:$("#addDrCpaInfoForm").serialize(),  
            success:function(result){
				if(result.success){
					$.messager.alert("提示信息",result.msg);
					$("#drCpaInfoList").datagrid("reload");
					$("#addDrCpaInfoDialog").dialog("close");
				}else{
					$.messager.alert("提示信息",result.errorMsg);
				}
			}
        });
	}
	
	//关闭添加CPA窗口
	function closeAddDrCpaInfo(){  
		$("#drCpaInfoList").datagrid("reload");
		$("#addDrCpaInfoDialog").dialog("close");
	}
			//添加状态链接
	function formatStatus(value,row,index){
		if(row.status == "1"){
			return '已生效';
		}else{
			return '已失效';
		}
	}
	$.extend(
			$.fn.validatebox.defaults.rules,
			{
				noChinese : {
					validator : function(value) {
						return /^[^\u4e00-\u9fa5]{0,}$/.test(value);
					},
					message : '不能输入汉字！'
				}
				
			});		
</script>
</body>
</html>

