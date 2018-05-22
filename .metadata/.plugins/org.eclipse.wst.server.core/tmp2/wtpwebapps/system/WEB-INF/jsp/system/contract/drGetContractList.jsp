<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="drContractList" title="查看合同" 
	class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:true,
	    fitColumns:true,
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#drContractInfoTools'">
		<thead>
	    <tr>
	    	<th data-options="field:'mobilePhone'" width="10%" >手机号</th>
	        <th data-options="field:'realname'" width="5%">姓名</th>
	       	<th data-options="field:'investTime'" width="10%" formatter="formatDateBoxFull">投资时间</th>
	        <th data-options="field:'amount'" width="10%" formatter="formatAmount">投资金额</th>
	        <th data-options="field:'fullName'" width="10%">产品名称</th>
	        <th data-options="field:'deadline'" width="10%">产品期限</th>
	        <th data-options="field:'_operate',align:'center'" width="10%" formatter="formatOper">基本操作</th>
	    </tr>
	    </thead>
	</table>
		<div id="drContractInfoTools" style="padding:5px;height:750">
	  	<form id="drContractInfoForm">
	  		手机号:<input id="searchDrContractMobilePhone" name="mobilePhone" class="easyui-textbox"  size="15" style="width:100px"/>
	  		姓名:<input id="searchDrContractRealName" name="realname" class="easyui-textbox"  size="15" style="width:80px"/>
	  		 投资时间:<input id="searchDrContractInvestTime" name="investTime" class="easyui-datebox"/>至
	  		 	<input id="searchDrContractInvestTimeEnd" name="endDate" class="easyui-datebox"/>
	    	<a id="searchDrContractInfo" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	    </form>
	</div>
<script type="text/javascript">	
	//查询按钮
	$('#searchDrContractInfo').click(function(){
			$('#drContractList').datagrid({
			url: '../contract/getInvestLogList.do',
			queryParams: {
				mobilePhone: $('#searchDrContractMobilePhone').val(),
				realname: $('#searchDrContractRealName').val(),
				investTime: $('#searchDrContractInvestTime').datebox('getValue'),
				endDate: $('#searchDrContractInvestTimeEnd').datebox('getValue'),
			}
		}); 
	});
	//添加基本操作链接
	function formatOper(val,row,index){  
		return	'<a href="#" class="btn l-btn l-btn-small" onclick="selectDrthisContractList('+index+')">查看</a>'+
				'<a href="#" class="btn l-btn l-btn-small" onclick="downloadDrthisContractList('+index+')">下载</a>';
	}
	//查看
	function selectDrthisContractList(){
		$('#drContractList').datagrid('selectRow',index);// 关键在这里 
		var row = $('#drContractList').datagrid('getSelected');
		var url = "${apppath}/contract/selectPushResult.do?m_id="+row.m_id;
	}
</script>
</body>
</html>