<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="getMonthlyWeightingList" title="抽奖查询" 
	class="easyui-datagrid" style="height:99%;"
	data-options="singleSelect:true,
	    fitColumns:true,url: '../activity/getMonthlyWeightingList.do',
	    method:'post',rownumbers:true,showFooter: true,
	    pagination:true,toolbar:'#prizeTools'">
		<thead>
	    <tr>
	    	<!-- <th data-options="field:'id'" width="100px">记录ID</th> -->
	    	<th data-options="field:'add_time'" width="100px" formatter="formatDateBoxFull">中奖时间</th>
	        <th data-options="field:'realName'" width="100px">用户姓名</th>
	        <th data-options="field:'mobilePhone'" width="100px">手机号码</th>
	        <th data-options="field:'name'" width="100px">中奖内容</th>
	        <th data-options="field:'status'" width="100px" formatter="formatStatus">发奖状态</th>
	         <th data-options="field:'send_time'" width="100px" formatter="formatDateBoxFull">发奖时间</th>
	        <!--  <th data-options="field:'_operate',align:'center'" width="100px" formatter="formatOper">操作</th>  -->
	    </tr>
	    </thead>
	</table>
	<div id="prizeTools" style="padding:5px;height:750">
	  	<form id="prizeRecordForm">
	  		用户姓名:<input id="searchRealName" name="realName" class="easyui-textbox" value="" size="30" style="width:100px"/>
	  		用户号码:<input id="searchMobilePhone" name="mobilePhone" class="easyui-textbox" value="" size="30" style="width:100px"/>
	  		<!--  中奖状态:<select id="searchMonthlyWeightingStatus" class="easyui-combobox" name="status" style="width:200px;">  
	  					<option value="-1">全部</option>
	  					<option value="1">已发奖</option>  
	  					<option value="0">未发奖</option> -->  
	  				</select>  	
	  		中奖时间:<input id="searchLuckDrawStartDate" name="startDate" class="easyui-datebox" style="width:100px"/>到
	  				<input id="searchLuckDrawEndDate" name="endDate" class="easyui-datebox" style="width:100px"/>  
	  				</select> 		
	    	<a id="searchPrizeRecord" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
			<a id="resetPrizeBtn" href="#" class="easyui-linkbutton" iconCls="icon-reload">重置</a> 
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
	$('#getMonthlyWeightingList').datagrid("hideColumn", "id");
});
//查询按钮
$('#searchPrizeRecord').click(function(){
	//alert("111");
	$('#getMonthlyWeightingList').datagrid({
		url: '../activity/getMonthlyWeightingList.do',
		queryParams: {
			realName:$('#searchRealName').val(),
			mobilePhone:$('#searchMobilePhone').val(),
			startDate:$('#searchLuckDrawStartDate').combobox('getValue'),
			endDate:$('#searchLuckDrawEndDate').combobox('getValue'),
			//status:$('#searchstatus').combobox("getValue"),
			//status:$('#searchMonthlyWeightingStatus').combobox("getValue"),
		}
	});
});
//重置按钮
$('#resetPrizeBtn').click(function(){
	$("#prizeRecordForm").form("reset");
	$("#getMonthlyWeightingList").datagrid("load", {});
});

//是否生效
function formatStatus(value,row,index){
	if(value==0){return '未发奖';}
	else if(value == 1){return '已发奖';}
	//else if(value == 3){return '已发奖';}
}
//导出
function monthlyWeightingRecord(){
	location.href="${apppath}/activit/exportMonthlyWeightingRecord.do?realName="+$('#searchRealName').val()+"&mobilePhone="+$('#searchMobilePhone').val()+
		"&name="+$('#searchPrizeName').combo("getValue")+"&status="+$('#status').combo("getValue")+
        "&startTime="+$('#searchLuckDrawStartDate').combobox('getValue')+
        "&endTime="+$('#searchLuckDrawEndDate').combobox('getValue');
      
}
 //操作
  function formatOper(value,row,index){
	if(row.status==0){
		return '<a href="#" class="btn l-btn l-btn-small" onclick="giveawardPrize('+index+')">发奖</a>';
	}
	
} 
	//审核操作
	function giveawardPrize(index){  
		$('#monthlyWeightingRecord').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#monthlyWeightingRecord').datagrid('getSelected'); 
		$.messager.confirm('操作提示', '你确定发奖吗？', function(ensure){
			if(ensure){
				var url = "${apppath}/carry/memberCarryAudit.do?id="+row.id;
				$.ajax({
					url: url,
					dataType:"json",
					success:function(result){
						if(result.success){
							$('#monthlyWeightingRecord').datagrid('reload');
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




 