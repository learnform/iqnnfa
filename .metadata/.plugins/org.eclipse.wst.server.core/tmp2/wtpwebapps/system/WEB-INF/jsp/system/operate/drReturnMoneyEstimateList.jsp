<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="drReturnMoneyEstimateList" title="回款预估" 
	class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:true,
	    fitColumns:true,
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#drReturnMoneyEstimatTools'">
		<thead>
	    <tr>
	    	<th data-options="field:'shouldTime'" width="15%" formatter="formatDateBoxFull">时间</th>
	        <th data-options="field:'expireLabel'" width="10%" styler="styleColor" formatter="formatAmount">回款-满期标</th>
	       	<th data-options="field:'transferLabel'" width="10%" styler="styleColor" formatter="formatAmount">回款-转让标</th>
	        <th data-options="field:'sumReturnMoney'" width="10%" styler="styleColor" formatter="formatAmount">总回款</th>
	    </tr>
	    </thead>
	</table>
	<div id="drReturnMoneyEstimatTools" style="padding:5px;height:750">
	  	<form id="drReturnMoneyEstimateForm">
	  		查询时间段:<input id="searchDrEstimatStartDate" name="startTime" class="easyui-datebox" style="width:100px"/>
	  		至<input id="searchDrEstimatEndDate" name="endTime" class="easyui-datebox" style="width:100px"/>
	  		<a id="searchReturnList" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	    	<a id="exportDrMoneyEstimateConf" href="javascript:exportDrMoneyEstimateConf();" class="easyui-linkbutton" iconCls="icon-redo">导出</a>
	    	<a id="testMoneyEstimate" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="testMoneyEstimate()">发标预估</a>
	    </form>
	</div>
	
	<div id="drReturnEstimateInfo" class="easyui-dialog" title="发标预估" 
		data-options="iconCls:'icon-add',closed:true,minimizable:false,resizable:false,maximizable:false,buttons:'#drReturnEstimateInfoDialogBtn'" style="width:580px;height:300px;padding:10px;">
		<form id="drReturnEstimate">
		<div class="onediv">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>募集期(天)为:</td>
	    			<td><input id="raiseDays" class="easyui-textbox" type="text" name="raiseDays" data-options="required:true" style="width:150px;"></input></td>
	    			<td>若今日上架该产品：将于<span id="returnDay" style="color:red;">XX月XX日</span>回款</td>
	    		</tr>
	    		<tr>
	    			<td>产品期限(天)为::</td>
	    			<td><input id="productDays" class="easyui-textbox" type="text" name="productDays" data-options="required:true" style="width:150px;"></input></td>
	    			<td>当日总回款为:<span id="ReturnMoney" style="color:red;">XX,XXX</span></td>
	    		</tr>
	    		<tr>
	    			<td>产品总额(元)为:</td>
	    			<td><input id="sumReturnMoney" class="easyui-textbox" type="text" name="sumReturnMoney" data-options="required:true" style="width:150px;"></input>
	    			</td>
	    			<td>其中满期标为:<span id="expireMoney" style="color:red;">XX,XXX</span></td>
	    		</tr>
	    		<tr>
	    			<td>是否为满期标:</td>
	    			<td><input   type="radio" name="fid" value="0" checked="checked"/>是
	    			<input   type="radio" name="fid" value="1"/>否</td>
	    			<td>其中续发标为:<span id="transferMoney" style="color:red;">XX,XXX</span></td>
	    		</tr>
			</table>
		<div id="drReturnEstimateInfoDialogBtn">
	    	<a id="estimate" href="javascript:void(0)" onclick="estimate()" class="easyui-linkbutton">预估</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeDrReturnEstimateInfoDialog()">关闭</a>
    	</div>
		</div>	
		</form>
	</div>
<script type="text/javascript">	
	//查询按钮
	$('#searchReturnList').click(function(){
 		$('#drReturnMoneyEstimateList').datagrid({
 			url: '../product/drReturnMoneyEstimateList.do',
			queryParams: {
				startTime: $('#searchDrEstimatStartDate').datebox('getValue'),
				endTime: $('#searchDrEstimatEndDate').datebox('getValue'),
			}
		}); 
	});	
	//导出按钮
	function exportDrMoneyEstimateConf(){
		window.location.href="../product/exportDrMoneyEstimateConf.do?startTime="+$('#searchDrEstimatStartDate').datebox('getValue')+
						"&endTime="+$('#searchDrEstimatEndDate').datebox('getValue');
	}
	//发标预估按钮
	function testMoneyEstimate(){
		$("#drReturnEstimate").form("reset");
		$("#drReturnEstimateInfo").window("open");
		$("#returnDay").html('XX月XX日');
		$('#ReturnMoney').html('XX,XXX');
		$('#expireMoney').html('XX,XXX');
		$('#transferMoney').html('XX,XXX');
	}
	//预估按钮
	function estimate(){
		$.ajax({
			url: "${apppath}/product/Estimate.do",
			type: 'POST',
			data:$("#drReturnEstimate").serialize(),  
			success:function(result){
				if(result.success){
					$("#returnDay").html(result.map.shouldTime);
					$("#ReturnMoney").html(result.map.sumReturnMoney);
					$("#expireMoney").html(result.map.expireLabel);
					$("#transferMoney").html(result.map.transferLabel); 
				}
			}
	  	});				
	}
	//关闭Dialog
	function closeDrReturnEstimateInfoDialog(){  
		$("#drReturnEstimate").form("reset");
		$("#drReturnEstimateInfo").dialog("close");
	}
</script>
</body>
</html>