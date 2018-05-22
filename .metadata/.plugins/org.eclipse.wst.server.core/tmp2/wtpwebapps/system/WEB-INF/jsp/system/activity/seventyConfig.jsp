<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="configList" title="奖池配置60W-70W" 
	class="easyui-datagrid" style="height:99%;"
	data-options="singleSelect:true,
	    fitColumns:true,url: '../luckDraw/luckDrawConfig.do?flag=seventy',
	    method:'post',rownumbers:true,showFooter: true,
	    pagination:true,toolbar:'#prizeTools'">
		<thead>
	    <tr>
	    	<th data-options="field:'luckDrawId'" width="100px">奖品ID</th>
	        <th data-options="field:'name'" width="100px">类型名称</th>
	        <th data-options="field:'prizeCount'" width="100px">库存数量</th>
	        <th data-options="field:'giveCount'" width="100px">已抽取数量</th>
	        <th data-options="field:'totalCount'" width="100px">奖品总量</th>
	        <th data-options="field:'luckDrawIdRateFirst'" width="100px">第一次抽奖几率</th>
	        <th data-options="field:'luckDrawRateSecord'" width="100px">第二次抽奖几率</th>
	        <th data-options="field:'_operate',align:'center'" width="100px" formatter="formatOper">操作</th>
	    </tr>
	    </thead>
	</table>
	<div id="update" class="easyui-window" data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:false,maximizable:false"
		style="width:400px;height:400px;padding:10px;">
	</div>
<script type="text/javascript">
//编辑配置
function editConfig(index){
	$('#configList').datagrid('selectRow',index);// 关键在这里 
	var row = $('#configList').datagrid('getSelected'); 
	var configId = row.id; 
	var luckDrawId = row.luckDrawId;
	$("#update").window({
		title:"奖池配置编辑页面",
		href:"../luckDraw/luckDrawConfigEdit.do?configId="+configId+"&luckDrawId="+luckDrawId+"&flag=seventy"
	});
	$("#update").window("open");
}

//操作
function formatOper(value,row,index){
	return '<a href="#" class="btn l-btn l-btn-small" onclick="editConfig('+index+')"> 编辑</a>';
}
	
</script>
</body>
</html>