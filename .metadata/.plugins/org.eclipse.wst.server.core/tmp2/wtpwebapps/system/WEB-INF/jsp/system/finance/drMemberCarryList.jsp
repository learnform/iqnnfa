<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="memberCarryList" title="提现记录   
	<span style='color: #0015FF;'>提现金额合计</span>：<span id='memberCarrySum' style='color: red;'></span>
	<span style='color: #0015FF;'>富友代付总额</span>：<span id='JYTCarryBalance' style='color: red;'></span>
	<span style='color: #0015FF;'>用户余额总额</span>：<span id='memberBalanceSum' style='color: red;'></span>
	<span style='color: #0015FF;'>明日产品到期总额</span>：<span id='memberExpireSum' style='color: red;'></span>" 
	class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:true,
	    fitColumns:true, url: '../carry/memberCarryList.do',
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#memberCarryTools'">
		<thead>
	    <tr>
	    	<th data-options="field:'uid'" hidden="true">uid</th>
	    	<th data-options="field:'paymentNum'" width="12%">商户订单号</th>
	        <th data-options="field:'realName'" width="6%">用户姓名</th>
	        <th data-options="field:'phone'" width="6%">用户手机号</th>
	       	<th data-options="field:'amount'" width="7%" styler="styleColor" formatter="formatAmount">提现金额</th>
	       	<th data-options="field:'poundage'" width="5%">提现手续费</th>	     
	       	<th data-options="field:'bankName'" width="8%">银行卡名称</th>
	       	<th data-options="field:'bankNum'" width="7%">银行账号</th>	      	
	        <th data-options="field:'status'" hidden="true">提现状态</th>
	       	<th data-options="field:'statusName'" width="4%">提现状态</th>
			<th data-options="field:'addTime'" width="8%" formatter="formatDateBoxFull">提现时间</th>
			<th data-options="field:'channel'" hidden="true">提现渠道</th>
			<th data-options="field:'channelName'" width="4%">提现渠道</th>			
			<th data-options="field:'reason'" width="20%">失败原因</th>
			<th data-options="field:'_operate',align:'center'" width="10%" formatter="formatOper">基本操作</th>
	    </tr>
	    </thead>
	</table>
	<div id="memberCarryTools" style="padding:5px;height:750">
	  	<form id="memberCarryForm">
	  		提现时间:<input id="searchMemberCarryStartDate" name="startDate" class="easyui-datebox" style="width:100px"/>
	  		至<input id="searchMemberCarryEndDate" name="endDate" class="easyui-datebox" style="width:100px"/>
	  		审核时间:<input id="searchMemberCarryAudStartDate" name="audStartDate" class="easyui-datebox" style="width:100px"/>
	  		至<input id="searchMemberCarryAudEndDate" name="audEndDate" class="easyui-datebox" style="width:100px"/>
	  		用户姓名:<input id="searchMemberCarryRealName" name="realName" class="easyui-textbox"  size="15" style="width:100px"/>
	  		用户手机号:<input id="searchMemberCarryPhone" name="phone" class="easyui-textbox"  size="15" style="width:100px"/>
	  		提现金额:<input id="searchMemberCarryMinAmount" name="minAmount" class="easyui-numberbox" style="width:100px"/>
	  		至<input id="searchMemberCarryMaxAmount" name="maxAmount" class="easyui-numberbox" style="width:100px"/>
	  		提现状态: <select  id="searchMemberCarryStatus" name="status" style="width:100px;" class="easyui-combobox">
				 	<option value=''>全部</option>
					<c:forEach items="${status }" var="map">
						<option value='${map.key }'>${map.value }</option>
					</c:forEach>
	           </select>
	    	<a id="searchMemberCarryBtn" href="#" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	    	<a id=resetMemberCarryBtn href="#" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
	    	<a href="#" class="easyui-linkbutton" iconCls="icon-redo" onclick="exportMemberCarryBtn()">导出</a>
	    </form>
	</div>
<script type="text/javascript">
	$(document).ready(function () {
		$('#memberCarryList').datagrid({ 
		    onBeforeLoad: function (d) {
			    $.ajax({
				url:"${apppath}/carry/memberCarrySum.do",
				type:"POST",
				data:$("#memberCarryForm").serialize(),  
				success:function(result){
					$("#memberCarrySum").text(fmoney(result.memberCarrySum,2));
					$("#JYTCarryBalance").text(fmoney(result.JYTCarryBalance,2));
					$("#memberBalanceSum").text(fmoney(result.memberBalanceSum,2));
					$("#memberExpireSum").text(fmoney(result.memberExpireSum,2));
				}
				});
			} 
    	});
	});
	//重置按钮
	$('#resetMemberCarryBtn').click(function(){
		$("#memberCarryForm").form("reset");
		$("#memberCarryList").datagrid("load", {});
	});
	//查询按钮
	$('#searchMemberCarryBtn').click(function(){
 		$('#memberCarryList').datagrid({
			queryParams: {
				startDate: $('#searchMemberCarryStartDate').datebox('getValue'),
				endDate: $('#searchMemberCarryEndDate').datebox('getValue'),
				audStartDate: $('#searchMemberCarryAudStartDate').datebox('getValue'),
				audEndDate: $('#searchMemberCarryAudEndDate').datebox('getValue'),
				maxAmount: $('#searchMemberCarryMaxAmount').numberbox('getValue'),
				minAmount: $('#searchMemberCarryMinAmount').numberbox('getValue'),
				realName: $('#searchMemberCarryRealName').val(),
				phone: $('#searchMemberCarryPhone').val(),
				status: $('#searchMemberCarryStatus').combobox('getValue')
			}
		}); 
	});
		//添加基本操作链接
	function formatOper(val,row,index){
	    if (row.status=="0" && row.unInvest=="1"){
            '<a href="#" class="btn l-btn l-btn-small" onclick="memberCarryRefuse('+index+')">拒绝</a>';
		}else if(row.status=="0"){
			return '<a href="#" class="btn l-btn l-btn-small" onclick="memberCarryAudit('+index+')">审核</a>'+"   "+
            '<a href="#" class="btn l-btn l-btn-small" onclick="memberCarryRefuse('+index+')">拒绝</a>';
   		 }
	} 
	
		//拒绝操作
	function memberCarryRefuse(index){  
		$('#memberCarryList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#memberCarryList').datagrid('getSelected'); 
		$.messager.confirm('操作提示', '你确定拒绝吗？', function(ensure){
			if(ensure){
				var url = "${apppath}/carry/memberCarryRefuse.do?id="+row.id;
				$.ajax({
					url: url,
					dataType:"json",
					success:function(result){
						if(result.success){
							$('#memberCarryList').datagrid('reload');
							$.messager.alert("操作提示", result.msg);
						}else{
							$.messager.alert("提示信息",result.errorMsg);
						}
					}
			  	});
			}
		});
	} 
	
	//审核操作
	function memberCarryAudit(index){  
		$('#memberCarryList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#memberCarryList').datagrid('getSelected'); 
		$.messager.confirm('操作提示', '你确定审核通过吗？', function(ensure){
			if(ensure){
				var url = "${apppath}/carry/memberCarryAudit.do?id="+row.id;
				$.ajax({
					url: url,
					dataType:"json",
					success:function(result){
						if(result.success){
							$('#memberCarryList').datagrid('reload');
							$.messager.alert("操作提示", result.msg);
						}else{
							$.messager.alert("提示信息",result.errorMsg);
						}
					}
			  	});
			}
		});
	} 

	function exportMemberCarryBtn(){
		window.location.href="../carry/exportMemberCarry.do?startDate="+$('#searchMemberCarryStartDate').datebox('getValue')+
						"&endDate="+$('#searchMemberCarryEndDate').datebox('getValue')+
						"&audStartDate="+$('#searchMemberCarryAudStartDate').datebox('getValue')+
						"&audEndDate="+$('#searchMemberCarryAudEndDate').datebox('getValue')+
						"&realName="+encodeURIComponent(encodeURIComponent($('#searchMemberCarryRealName').val()))+
						"&phone="+$('#searchMemberCarryPhone').val()+
						"&status="+$('#searchMemberCarryStatus').combobox('getValue');
	}
</script>
</body>
</html>

