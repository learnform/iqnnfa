<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="redDetailList" title="红包明细" 
	class="easyui-datagrid" style="height:80%;"
	data-options="checkbox:true,
	    fitColumns:true,url:'../luckDraw/redDetail.do',
	    method:'post',rownumbers:true,showFooter: true,
	    pagination:true,singleSelect:false">
		<thead>
	    <tr>
	    	<th data-options="field:'id',checkbox:true,idField:'id'"></th>
	        <th data-options="field:'code'" width="100px">红包编号</th>
	        <th data-options="field:'name'" width="100px" >红包名称</th>
	        <th data-options="field:'amount'" width="100px" >红包金额</th>
	    </tr>
	    </thead>
	</table>
	<table id="redDetail" title="奖品关联红包" 
	class="easyui-datagrid" style="height:80%;"
	data-options="checkbox:true,
	    fitColumns:true,url:'../luckDraw/redRecord.do?prizeId='+${prizeId},
	    method:'post',rownumbers:true,showFooter: true,
	    pagination:true,singleSelect:false">
		<thead>
	    <tr>
	        <th data-options="field:'favourableCode'" width="100px">红包编号</th>
	        <th data-options="field:'name'" width="100px" >红包名称</th>
	        <th data-options="field:'amount'" width="100px" >红包金额</th>
	    </tr>
	    </thead>
	</table>
	<div align="center">
		<input type="hidden" value="${prizeId}" id="prizeId">
		<input type="hidden" value="${index}" id="index">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeDialog()">取消</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#" class="btn l-btn l-btn-small"  onclick="addRed()">确定</a>
	</div>
<script type="text/javascript">
function addRed(){
	var prizeId=$("#prizeId").val();
	var checkedItems = $('#redDetailList').datagrid('getChecked');
	if(checkedItems == ""){
		$.messager.alert("操作提示", "请选择要添加的红包！");
	 	return;
	}
	var ids=[];
	$.each(checkedItems, function(index, item){
		ids.push(item.code);
	}); 
	$.ajax({
		url:"${pageContext.servletContext.contextPath}/luckDraw/addRedGift.do?favourableId="+ids+"&prizeId="+prizeId,
		type:"POST",
		success:function(status){
			if(status == 0){
				$.messager.alert("提示信息","添加成功！","",function(){
					$("#gift").dialog("close");
				});
           	}else{
           		$.messager.alert("提示信息","添加失败！");
            }
		}
	});
}

//关闭添加红包窗口
function closeDialog(){  
	$("#redDetailList").datagrid("reload");
	$("#gift").dialog("close");
}
</script>
</body>
</html>