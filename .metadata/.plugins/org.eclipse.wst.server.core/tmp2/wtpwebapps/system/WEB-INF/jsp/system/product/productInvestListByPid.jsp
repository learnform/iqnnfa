<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="drInvestOrderList"  
	class="easyui-datagrid" style="height:99%;"
	data-options="singleSelect:true,
	    fitColumns:true, url: '../invest/productInvestListByPidJSP.do?pid='+${pid},
	    method:'post',rownumbers:true, 	
	    pagination:true,toolbar:'#drProductInvestTools'">
		<thead>
	    <tr>
<!-- 	        <th data-options="field:'uid'" width="4%">用户ID</th> -->
	        <th data-options="field:'investTime'" width="8%">订单时间</th>
	        <th data-options="field:'realname'" width="4%">用户姓名</th>
	        <th data-options="field:'mobilePhone'" width="5%" >手机号码</th>
	        <th data-options="field:'amount'" width="5%" styler="styleColor" formatter="formatAmount">订单金额</th>
	        <th data-options="field:'interest'" width="5%" styler="styleColor" formatter="formatAmount">预计收益</th>
	        <th data-options="field:'faAmount1'" width="5%" styler="styleColor" formatter="formatAmount">红包返现</th>
	        <th data-options="field:'multiple'" width="4%" styler="styleColor">翻倍倍数</th>
	        <th data-options="field:'joinType'" width="4%">投资终端</th>
		    <th data-options="field:'usedTime'" width="8%">活动兑换日期</th>
	        <th data-options="field:'faAmount2'" width="5%">活动金额</th>
	        <th data-options="field:'typeName'" width="4%">活动类型</th>
	        <th data-options="field:'faStatus'" width="4%">活动状态</th>
	        <th data-options="field:'regdate'" width="8%">注册日期</th>
	        <th data-options="field:'chanelName'" width="5%">注册渠道</th>
	    </tr>
	    </thead>
	</table>
	<div id="drProductInvestTools" style="padding:5px;height:750">
	  	<form id="drProductInvestForm">
	  		用户手机:<input id="searchDrProductInvestMobilephone" name="mobilephone" class="easyui-textbox"  size="30" style="width:100px"/>
	  		用户姓名:<input id="searchDrProductInvestRealname" name="realname" class="easyui-textbox"  size="30" style="width:100px"/>
	  		订单日期:<input id="searchDrProductInvestStartDate" name="startDate" class="easyui-datebox" style="width:100px"/>到
	  			  <input id="searchDrProductInvestEndDate" name="endDate" class="easyui-datebox" style="width:100px"/>
	    	<input id="searchDrProductInfoPid" name="pid"  class="easyui-textbox" value="${pid}"  type="hidden"/>
	    	<a id="searchInvestOrder" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	    	<a id="resetDrProductInfo" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
	    </form>
	</div>
<script type="text/javascript">
//重置按钮
$('#resetDrProductInfo').click(function(){
	var pid = $("#drProductInvestForm").val();
	$("#drProductInvestForm").form("reset");
	$("#drProductInvestForm").val(pid);
	$("#drInvestOrderList").datagrid("load", {});
});
	//查询按钮
	$('#searchInvestOrder').click(function(){
 		$('#drInvestOrderList').datagrid({
 			url: '../invest/productInvestListByPidJSP.do',
			queryParams: {
				pid: $('#searchDrProductInfoPid').val(),
				realname:$('#searchDrProductInvestRealname').val(),
				mobilephone:$('#searchDrProductInvestMobilephone').val(),
				startDate:$('#searchDrProductInvestStartDate').combobox('getValue'),
				endDate:$('#searchDrProductInvestEndDate').combobox('getValue')
			}
		}); 
	});
	//导出
	function exportInvestOrder(){
		window.location.href="../invest/exportDrProductInvestListByPid.do?realname="+$('#searchDrProductInvestRealname').val()+
						"&mobilephone="+$('#searchDrProductInvestMobilephone').val()+
						"&startDate="+$('#searchDrProductInvestStartDate').datebox("getValue")+
						"&endDate="+$('#searchDrProductInvestEndDate').datebox("getValue")+
						"&pid="+$('#searchDrProductInfoPid').val(); 
	}

</script>
</body>
</html>