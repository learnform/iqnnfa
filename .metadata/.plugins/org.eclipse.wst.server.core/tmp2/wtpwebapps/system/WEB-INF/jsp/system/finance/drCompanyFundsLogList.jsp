<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="companyFundsLogList" title="平台收支记录 <span style='color: #0015FF;'>收入合计</span>：<span id='companyFundsLogIncome' style='color: red;'></span>
		<span style='color: #0015FF;'>支出合计</span>：<span id='companyFundsLogPay' style='color: red;'></span> 
		<span style='color: #0015FF;'>剩余合计</span>：<span id='companyFundsLogSum' style='color: red;'></span>" 
	class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:true,
	    fitColumns:true, url: '../companyFundsLog/companyFundsLogList.do',
	    method:'post',rownumbers:true,
	    pagination:true,toolbar:'#companyFundsLogTools'">
		<thead>
	    <tr>
	        <th data-options="field:'pcode'" width="10%">产品编号</th>
	        <th data-options="field:'fundTypeName'" width="10%" >交易类型</th>	     
	       	<th data-options="field:'typeName'" >收入/支出</th>
	       	<th data-options="field:'amount'" width="10%" styler="styleColor" formatter="formatAmount">金额</th>	      	
	        <th data-options="field:'realName'" width="8%">用户姓名</th>
	       	<th data-options="field:'phone'" width="10%">用户手机号</th>
	        <th data-options="field:'remark'" width="25%">备注</th>
			<th data-options="field:'addTime'"  width="15%" formatter="formatDateBoxFull">交易时间</th>
	    </tr>
	    </thead>
	</table>
	<div id="companyFundsLogTools" style="padding:5px;height:750">
	  	<form id="companyFundsLogForm">
	  		产品编号:<input id="searchCompanyFundsLogLcoding" name="pcode" class="easyui-textbox"  size="15" style="width:200px"/>
	  		交易时间:<input id="searchCompanyFundsLogStartDate" name="startDate" class="easyui-datebox" style="width:100px"/>
	  		至<input id="searchCompanyFundsLogEndDate" name="endDate" class="easyui-datebox" style="width:100px"/>
	  		收支类型: <select  id="searchCompanyFundsLogType" name="type" style="width:100px;" class="easyui-combobox">
				 	<option value=''>全部</option>
					<c:forEach var="map" items="${fundtype}">
						<option value='${map.key}'>${map.value}</option>
			        </c:forEach>
	           </select> 	
	    	<a id="searchCompanyFundsLogBtn" href="#" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	    	<a id=resetCompanyFundsLogBtn href="#" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
			<a id=exportCompanyFundsLogBtn href="#" class="easyui-linkbutton" iconCls="icon-reload">导出</a>
	    	<br>
	    	<label><input type="checkbox" value=""/> 全部 </label>
	  		<c:forEach var="map" items="${companyFundsType}">
				<label>
				<input type="checkbox" name="fundTypes" value="${map.key}" id="${map.key}" />${map.value}
				</label>
		    </c:forEach>		    
	    </form>
	</div>
<script type="text/javascript">
	//统计:平台收支合计,支出合计,剩余合计 
 	$(document).ready(function () {
		$('#companyFundsLogList').datagrid({ 
		    onBeforeLoad: function (d) {
			    $.ajax({
				url:"${apppath}/companyFundsLog/companyFundsLogSum.do",
				type:"POST",
				data:$("#companyFundsLogForm").serialize(),  
				success:function(result){
					$("#companyFundsLogIncome").text(result.companyFundsLogIncome);
					$("#companyFundsLogPay").text(result.companyFundsLogPay);
					$("#companyFundsLogSum").text(accSub(result.companyFundsLogIncome,result.companyFundsLogPay));
				}
				});
			} 
    	});
	}); 
	//重置按钮
	$('#resetCompanyFundsLogBtn').click(function(){
		$("#companyFundsLogForm").form("reset");
		$("#companyFundsLogList").datagrid("load", {});
	});

    //导出按钮
    $('#exportCompanyFundsLogBtn').click(function(){
        location.href="${apppath}/companyFundsLog/exportCompanyFundsLog.do?pcode="+$('#searchCompanyFundsLogLcoding').val()+
        "&startDate="+$('#searchCompanyFundsLogStartDate').combobox('getValue')+
        "&endDate="+$('#searchCompanyFundsLogEndDate').combobox('getValue')+
		"&type="+$('#searchCompanyFundsLogType').combogrid('getValues')+
		"&fundTypes="+companyFundsLogCBAll();
    });


	//查询按钮
	$('#searchCompanyFundsLogBtn').click(function(){
		$('#companyFundsLogList').datagrid({
			queryParams: {
				startDate: $('#searchCompanyFundsLogStartDate').datebox('getValue'),
				endDate: $('#searchCompanyFundsLogEndDate').datebox('getValue'),
				pcode: $('#searchCompanyFundsLogLcoding').val(),
				type: $('#searchCompanyFundsLogType').combobox("getValue"),
				fundTypes:companyFundsLogCBAll(),
			
			}
 		
		}); 
	});
	
	function companyFundsLogCBAll(){//输出选中的值
		var checks="";  
		$('input[name="fundTypes"]:checked').each(function(){
        	checks +=$(this).val()+",";
		});  
		return checks;  
	} 
	
	$(function(){
		$("#companyAmount").bind("keyup",function(){
			var balance = $("#companyBalance").val();
			var money=$("#companyAmount").val();
			var totalAmount = (parseFloat(balance)+parseFloat(money));
			totalAmount = Math.round(totalAmount*100)/100;
			$("#companySumAmount").val(totalAmount);
			$("#companyAmountCapital").html(cmycurd(money));
			
		});
		
	});
	
</script>
</body>
</html>

