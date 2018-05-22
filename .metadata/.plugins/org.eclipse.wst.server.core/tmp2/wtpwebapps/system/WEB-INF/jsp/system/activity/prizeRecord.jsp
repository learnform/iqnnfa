<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="prizeRecord" title="抽奖查询" 
	class="easyui-datagrid" style="height:99%;"
	data-options="singleSelect:true,
	    fitColumns:true,url: '../luckDraw/prizeRecord.do',
	    method:'post',rownumbers:true,showFooter: true,
	    pagination:true,toolbar:'#prizeTools'">
		<thead>
	    <tr>
	    	<th data-options="field:'id'" width="100px">记录ID</th>
	    	<th data-options="field:'addTime'" width="100px" formatter="formatDateBoxFull">抽奖时间</th>
	        <th data-options="field:'realName'" width="100px">用户姓名</th>
	        <th data-options="field:'mobilePhone'" width="100px">手机号码</th>
	        <th data-options="field:'investAmount'" width="100px">累计投资额</th>
<!-- 	        <th data-options="field:'status'" width="100px">消耗积分</th> -->
	        <th data-options="field:'name'" width="100px">中奖内容</th>
	        <th data-options="field:'status'" width="100px" formatter="formatStatus">发奖状态</th>
	        <th data-options="field:'updateTime'" width="100px" formatter="formatDateBoxFull">发奖时间</th>
	        <th data-options="field:'_operate',align:'center'" width="100px" formatter="formatOper">操作</th>
	    </tr>
	    </thead>
	</table>
	<div id="prizeTools" style="padding:5px;height:750">
	  	<form id="prizeRecordForm">
	  		用户姓名:<input id="searchRealName" name="realName" class="easyui-textbox" value="" size="30" style="width:100px"/>
	  		用户号码:<input id="searchMobilePhone" name="mobilePhone" class="easyui-textbox" value="" size="30" style="width:100px"/>
<!-- 	  		奖品名称:<input id="searchPrizeName" name="prizeName" class="easyui-textbox" value="" size="30" style="width:100px"/> -->
			奖品名称:<select  id="searchPrizeName" name="code" style="width:100px;" class="easyui-combobox">
						<option value=''>全部</option>
						<c:forEach items="${prize }" var="map">
							<option value='${map.id }'>${map.name }</option>
						</c:forEach>
					</select>
	  		抽奖时间:<input id="searchLuckDrawStartDate" name="startDate" class="easyui-datebox" style="width:100px"/>到
	  				<input id="searchLuckDrawEndDate" name="endDate" class="easyui-datebox" style="width:100px"/>  
	  		发奖时间:<input id="searchUpdateStartDate" name="startTime" class="easyui-datebox" style="width:100px"/>到
	  				<input id="searchUpdateEndDate" name="endTime" class="easyui-datebox" style="width:100px"/>  		
	  		中奖状态:<select id="status" class="easyui-combobox" name="status" style="width:200px;">  
	  					<option value="0">全部</option>
	  					<option value="1">未中奖</option>  
	  					<option value="2">中奖待发放</option>  
	  					<option value="3">已发奖</option>
	  				</select> 		
	  		累计投资额:<input id="searchInvestAmountS" name="minInvestAmount" class="easyui-textbox" value="" size="30" style="width:100px"/>&nbsp;至
					<input id="searchInvestAmountE" name="maxInvestAmount" class="easyui-textbox" value="" size="30" style="width:100px"/>				
	    	<a id="searchPrizeRecord" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
			<a id="resetPrizeBtn" href="#" class="easyui-linkbutton" iconCls="icon-reload">重置</a> 
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-redo" onclick="prizeRecordExport()">导出</a>
	    </form>
	</div>
	<div id="award" class="easyui-window" data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:false,maximizable:false"
		style="width:400px;height:400px;padding:10px;">
	</div>
	<div id="view" class="easyui-window" data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:false,maximizable:false"
		style="width:400px;height:400px;padding:10px;">
	</div>
<script type="text/javascript">
$(function(){
	$('#prizeRecord').datagrid("hideColumn", "id");
});
//查询按钮
$('#searchPrizeRecord').click(function(){
	$('#prizeRecord').datagrid({
		url: '../luckDraw/prizeRecord.do',
		queryParams: {
			minInvestAmount:$('#searchInvestAmountS').val(),
			maxInvestAmount:$('#searchInvestAmountE').val(),
			realName:$('#searchRealName').val(),
			mobilePhone:$('#searchMobilePhone').val(),
			prizeId:$('#searchPrizeName').combo("getValue")+"",
			startDate:$('#searchLuckDrawStartDate').combobox('getValue'),
			endDate:$('#searchLuckDrawEndDate').combobox('getValue'),
			startTime:$('#searchUpdateStartDate').combobox('getValue'),
			endTime:$('#searchUpdateEndDate').combobox('getValue'),
			status:$('#status').combo("getValue")+""
		}
	});
});

//重置按钮
$('#resetPrizeBtn').click(function(){
	$("#prizeRecordForm").form("reset");
	$("#prizeRecord").datagrid("load", {});
});

//是否生效
function formatStatus(value,row,index){
	if(value==1){return '未中奖';}
	else if(value == 2){return '中奖待发放';}
	else if(value == 3){return '已发奖';}
}

//发奖
function awardPrize(index){
	$('#prizeRecord').datagrid('selectRow',index);// 关键在这里 
	var row = $('#prizeRecord').datagrid('getSelected'); 
	var id = row.id;//抽奖记录ID
	$("#award").window({
		title:"红包奖品管理",
		maximizable:true,
		href:'../luckDraw/awardPrize.do?prizeId='+id
	});
	$("#award").window("open").window("center");
}

//查看
function viewPrize(index){
	$('#prizeRecord').datagrid('selectRow',index);// 关键在这里 
	var row = $('#prizeRecord').datagrid('getSelected'); 
	var id = row.id;//抽奖记录ID
	$("#view").window({
		title:"红包奖品管理",
		maximizable:true,
		href:'../luckDraw/viewPrize.do?prizeId='+id
	});
	$("#view").window("open").window("center");
}

//导出
function prizeRecordExport(){
	location.href="${apppath}/luckDraw/exportRecord.do?realName="+$('#searchRealName').val()+"&mobilePhone="+$('#searchMobilePhone').val()+
		"&prizeId="+$('#searchPrizeName').combo("getValue")+"&status="+$('#status').combo("getValue")+
		"&startDate="+$('#searchLuckDrawStartDate').combobox('getValue')+
		"&endDate="+$('#searchLuckDrawEndDate').combobox('getValue')+
        "&minInvestAmount="+$('#searchInvestAmountS').val()+
        "&maxInvestAmount="+$('#searchInvestAmountE').val()+
        "&startTime="+$('#searchUpdateStartDate').combobox('getValue')+
        "&endTime="+$('#searchUpdateEndDate').combobox('getValue');
}

//操作
function formatOper(value,row,index){
	if(row.status==2){
		return '<a href="#" class="btn l-btn l-btn-small" onclick="awardPrize('+index+')">发奖</a>';
	}
	if(row.status==3){
		return '<a href="#" class="btn l-btn l-btn-small" onclick="viewPrize('+index+')">查看</a>';
	}
}
	
</script>
</body>
</html>