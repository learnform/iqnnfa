 <%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="drProductInfoList" 
	class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:true,
	    fitColumns:true, url: '../invest/getProductForStatistics.do',
	    method:'post',rownumbers:true, showFooter: true,
	    pagination:true,toolbar:'#drProductInfoTools'">
		<thead>
	    <tr>
	    	<th data-options="field:'id'" width="10%">id</th>
	        <th data-options="field:'simpleName'" width="10%">产品名称</th>
	       	<th data-options="field:'rate'" width="10%">产品利率</th>
	       	<th data-options="field:'activityRate'" width="10%">加息利率</th>
	       	<th data-options="field:'deadline'" width="10%">期限(天)</th>
	        <th data-options="field:'amount'" width="10%" styler="styleColor" formatter="formatAmount">产品到期本金(元)</th>
	        <th data-options="field:'factInterest'" width="10%" styler="styleColor" formatter="formatAmount">产品到期利息(元)</th>
	        <th data-options="field:'activityAmount'" width="10%" styler="styleColor" formatter="formatAmount">活动返利(元)</th>
	       	<th data-options="field:'startDate'" width="10%" formatter="formatDateBoxFull">上架日期</th>
	       	<th data-options="field:'fullDate'" width="10%" formatter="formatDateBoxFull">满标时间</th>
			<th data-options="field:'_operate',align:'center'" width="10%" formatter="formatOper">基本操作</th> 
	    </tr>
	    </thead>
	</table>
	<div id="drProductInfoTools" style="padding:5px;height:750">
	  	<form id="drProductInfoForm">
	  	<input id="statisticsDate" name="statisticsDate" class="easyui-textbox" value="${statisticsDate}"  type="hidden"/>
	  		产品简称:<input id="searchDrProductInfoSimpleName" name="simpleName" class="easyui-textbox"  size="15" style="width:200px"/>
			上架时间：<input id="dateStart" name="dateStart" class="easyui-datebox" style="width:100px"/>到
			<input id="dateEnd" name="dateEnd" class="easyui-datebox" style="width:100px"/>
			满标时间：<input id="searchStartDate" name="searchStartDate" class="easyui-datebox" style="width:100px"/>到
			<input id="searchEndDate" name="searchEndDate" class="easyui-datebox" style="width:100px"/>
	    	<a id="searchDrProductInfo" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
			<a id="resetDrProductInfo" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
	    	<a id="exportDrProductInfo" href="javascript:exportDrProductInfo();" class="easyui-linkbutton" iconCls="icon-redo">导出</a>
	    </form>
	</div>
	
	
	
<script type="text/javascript">
	$(document).ready(function () {
		$('#drProductInfoList').datagrid({
			queryParams: {
				statisticsDate: $('#statisticsDate').val(),
				simpleName: $('#searchDrProductInfoSimpleName').val(),
				dateStart: $('#dateStart').datebox('getValue'),
				dateEnd:$('#dateEnd').datebox('getValue'),
				searchEndDate:$('#searchEndDate').datebox('getValue'),
	            searchStartDate:$('#searchStartDate').datebox('getValue')
			}
		}); 
	});
	
	//重置按钮
	$('#resetDrProductInfo').click(function(){
		$("#drProductInfoForm").form("reset");
		$("#drProductInfoList").datagrid("load", {});
	});
	
	//查询按钮
	$('#searchDrProductInfo').click(function(){
 		$('#drProductInfoList').datagrid({
			queryParams: {
				statisticsDate: $('#statisticsDate').val(),
				simpleName: $('#searchDrProductInfoSimpleName').val(),
				dateStart: $('#dateStart').datebox('getValue'),
				dateEnd:$('#dateEnd').datebox('getValue'),
				searchEndDate:$('#searchEndDate').datebox('getValue'),
                searchStartDate:$('#searchStartDate').datebox('getValue')
			}
		}); 
	});
	
	//添加基本操作链接
	function formatOper(val,row,index){
		if(row.rate == '本页统计' || row.rate == '总计'){
			return "";
		}
		return	'<a href="#" class="btn l-btn l-btn-small" onclick="toShowProductInfoBtn('+index+')">查看</a>'
	}
	//跳转到产品显示页面
	function toShowProductInfoBtn(index){
		$('#drProductInfoList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drProductInfoList').datagrid('getSelected'); 
		var mainTab = parent.$('#main-center');
		var detailTab = {
				title : "产品显示",
				content:"<iframe width='100%' height='100%' frameborder='0' src='${apppath}/product/toShowDrProductInfo.do?id="+row.id+"'></iframe>",
				closable : true
		};
		mainTab.tabs("add",detailTab);
	}
	
	//导出
	function exportDrProductInfo(){
		window.location.href="../invest//export.do?simpleName="+encodeURIComponent(encodeURIComponent($('#searchDrProductInfoSimpleName').val()))
						+"&statisticsDate="+$('#statisticsDate').val()
						+"&dateStart="+$('#dateStart').datebox('getValue')
						+"&dateEnd="+$('#dateEnd').datebox('getValue')
						+"&searchEndDate="+$('#searchEndDate').datebox('getValue')
						+"&searchStartDate="+$('#searchStartDate').datebox('getValue')
						;
	} 

</script>
</body>
</html>

