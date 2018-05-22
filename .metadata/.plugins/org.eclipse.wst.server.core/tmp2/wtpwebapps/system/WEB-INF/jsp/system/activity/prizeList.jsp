<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="prizeList" title="抽奖奖品" 
	class="easyui-datagrid" style="height:99%;"
	data-options="singleSelect:true,
	    fitColumns:true,url: '../luckDraw/prizeList.do',
	    method:'post',rownumbers:true,showFooter: true,
	    pagination:true,
	    iconCls: 'icon-edit'">
		<thead>
	    <tr>
	    	<th data-options="field:'id'" width="100px">奖品编号</th>
	        <th data-options="field:'name'" width="100px">奖品名称</th>
	        <th data-options="field:'givecount'" width="100px">已中奖数量</th>
	        <th data-options="field:'prizecount'" width="100px">剩余数量</th>
	        <th data-options="field:'totalcount',editor:'text'" width="100px">奖品总量</th>
	        <th data-options="field:'_operate',align:'center'" width="80px" formatter="formatOper">基本操作</th>
	    </tr>
	    </thead>
	</table>
	<div id="gift" class="easyui-dialog" title="红包明细" data-options="iconCls:'icon-save',minimizable:false,tools:'#tt',closed:true" style="width:600px;height:400px;padding:10px;">
	</div>
	<div id="update" class="easyui-window" data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:false,maximizable:false"
		style="width:400px;height:400px;padding:10px;">
	</div>
	<div id="insert" class="easyui-window" data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:false,maximizable:false"
		style="width:400px;height:400px;padding:10px;">
	</div>
<script type="text/javascript">
$.extend($.fn.datagrid.methods, {
	editCell: function(jq,param){
		return jq.each(function(){
			var fields = $(this).datagrid('getColumnFields',true).concat($(this).datagrid('getColumnFields'));
			for(var i=0; i<fields.length; i++){
				var col = $(this).datagrid('getColumnOption', fields[i]);
				col.editor1 = col.editor;
				if (fields[i] != param.field){
					col.editor = null;
				}
			}
			$(this).datagrid('beginEdit', param.index);
			for(var i=0; i<fields.length; i++){
				var col = $(this).datagrid('getColumnOption', fields[i]);
				col.editor = col.editor1;
			}
		});
	}
});

var editIndex = undefined;
function endEditing(){
	if (editIndex == undefined){return true}
	if ($('#prizeList').datagrid('validateRow', editIndex)){
		$('#prizeList').datagrid('endEdit', editIndex);
		editIndex = undefined;
		return true;
	} else {
		return false;
	}
}
function onClickCell(index){
	$("#edit"+index).hide();
	$("#save"+index).show();
	if (endEditing()){
		$('#prizeList').datagrid('selectRow', index)
				.datagrid('editCell', {index:index,field:"totalcount"});
		editIndex = index;
	};
}

//保存单元格
function save(index){
	$('#prizeList').datagrid('endEdit', editIndex);
	$('#prizeList').datagrid('selectRow',index);// 关键在这里 
	var row = $('#prizeList').datagrid('getSelected'); 
	var id = row.id;
	var giveCount=row.givecount;
	var total=row.totalcount;
	if(total<giveCount){
		$.messager.alert("提示信息","总量不能小于已中奖数量");
		$('#prizeList').datagrid('beginEdit', editIndex);
		return;
	}
	var parameter={
	    	id:id,
	    	total:total
	    };
	$.ajax({
		url:"${apppath}/luckDraw/savePrize.do",
		type:"POST",
		data:parameter, 
		success:function(result){
			if(result.success){
				$.messager.alert("提示信息",result.msg);
				$("#prizeList").datagrid("reload");
			}else{
				$.messager.alert("提示信息",result.errorMsg);
			}
		}
	});
}

function insert(){
	var flag="add";
	$("#update").window({
		title:"新增奖品",
		href:"../luckDraw/toEditPrize.do?flag="+flag
	});
	$("#update").window("open");
}

//操作
function formatOper(value,row,index){
	return '<a href="#" class="btn l-btn l-btn-small" id="edit'+index+'" onclick="onClickCell('+index+')">编辑</a>'
	+'<a href="#" style="display: none;" class="btn l-btn l-btn-small" id="save'+index+'" onclick="save('+index+')">保存</a>';;
}
//查询按钮
$('#searchPrize').click(function(){
	$('#prizeList').datagrid({
		url: '../luckDraw/prizeList.do',
		queryParams: {
			name:$('#searchPrizeName').val()
		}
	});
});

//奖品类型
function formatFavourable(value,row,index){
	if(value==1){return '实物';}
	if(value==2){return '优惠券';}
	if(value==3){return '积分';}
	if(value==4){return '谢谢惠顾';}
}

//是否生效
function formatStatus(value,row,index){
	if(value==1){return '是';}
	else if(value == 2){return '否';}
}

$(function(){
	$('#prizeList').datagrid("hideColumn", "id");
});	
</script>
</body>
</html>