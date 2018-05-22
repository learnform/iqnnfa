<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="memberFundsLogList" title="客户收支记录  <span style='color: #0015FF;'>收入合计</span>：<span id='memberFundsLogIncome' style='color: red;'></span>
	 <span style='color: #0015FF;'>支出合计</span>：<span id='memberFundsLogPay' style='color: red;'></span>" 
	class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:true,
	    fitColumns:true,
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#memberFundsLogTools'">
		<thead>
	    <tr>
	        <th data-options="field:'fundTypeName'" width="10%" >交易类型</th>
	        <th data-options="field:'typeName'" width="8%">收支类型</th>
	       	<th data-options="field:'amount'" width="10%" styler="styleColor" formatter="formatAmount">交易金额</th>
	       	<th data-options="field:'mobilephone'" width="10%">用户手机</th>	   
	        <th data-options="field:'realName'" width="10%">用户姓名</th>
	       	<th data-options="field:'idCards'" width="12%">身份证号</th>	     
	        <th data-options="field:'remark'" width="25%">备注</th>
			<th data-options="field:'addTime'" width="10%" formatter="formatDateBoxFull">交易时间</th>
	    </tr>
	    </thead>
	</table>
	<div id="memberFundsLogTools" style="padding:5px;height:750">
	  	<form id="memberFundsLogForm">
	  		交易时间:<input id="searchMemberFundsLogStartDate" name="startDate" class="easyui-datebox" style="width:100px"/>
	  		至<input id="searchMemberFundsLogEndDate" name="endDate" class="easyui-datebox" style="width:100px"/>
	  		用户姓名:<input id="searchMemberFundsLogRealName" name="realName" class="easyui-textbox"  size="15" style="width:100px"/>
	  		用户手机:<input id="searchMemberFundsLogMobilephone" name="mobilephone" class="easyui-textbox"  size="11" style="width:100px"/>
	    	<a id="searchMemberFundsLogBtn" href="#" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	    	<a id=resetMemberFundsLogBtn href="#" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
			<a id=exportMemberFundsLogBtn href="#" class="easyui-linkbutton" iconCls="icon-reload">导出</a>
	    	<br>
	    	<label><input type="checkbox" value=""/> 全部 </label>
			<c:forEach var="map" items="${memberFundsType}">
				<label>
				<input type="checkbox" name="fundTypes" value="${map.key}" id="${map.key}" />${map.value}
				</label>
		    </c:forEach>
	    </form>
	</div>
<script type="text/javascript">
	$(document).ready(function () {
		$('#memberFundsLogList').datagrid({ 
		    onBeforeLoad: function (d) {
			    $.ajax({
				url:"${apppath}/memberFundsLog/memberFundsLogSum.do",
				type:"POST",
				data:$("#memberFundsLogForm").serialize(),  
				success:function(result){
					$("#memberFundsLogIncome").text(fmoney(result.memberFundsLogIncome,2));
					$("#memberFundsLogPay").text(fmoney(result.memberFundsLogPay,2));
				}
				});
			} 
    	});
	});
	//重置按钮
	$('#resetMemberFundsLogBtn').click(function(){
		$("#memberFundsLogForm").form("reset");
		$("#memberFundsLogList").datagrid("load", {});
	});

    //导出按钮
    $('#exportMemberFundsLogBtn').click(function(){
        location.href="${apppath}/memberFundsLog/exportMemberFundsLog.do?realName="+$('#searchMemberFundsLogRealName').val()+
            "&startDate="+$('#searchMemberFundsLogStartDate').combobox('getValue')+
            "&endDate="+$('#searchMemberFundsLogEndDate').combobox('getValue')+
            "&mobilephone="+$('#searchMemberFundsLogMobilephone').val()+
            "&fundTypes="+memberFundsLogCBAll();
    });

	//查询按钮
	$('#searchMemberFundsLogBtn').click(function(){
 		$('#memberFundsLogList').datagrid({
 			url: '../memberFundsLog/memberFundsLogList.do',
			queryParams: {
				startDate: $('#searchMemberFundsLogStartDate').datebox('getValue'),
				endDate: $('#searchMemberFundsLogEndDate').datebox('getValue'),
				mobilephone: $('#searchMemberFundsLogMobilephone').val(),
				realName: $('#searchMemberFundsLogRealName').val(),
				idCards: $('#searchMemberFundsLogIdCards').val(),
				fundTypes:memberFundsLogCBAll(),
			}
		}); 
	});

	function memberFundsLogCBAll(){//输出选中的值
		var checks="";  
		$('input[name="fundTypes"]:checked').each(function(){
        	checks +=$(this).val()+",";
		});  
		return checks;  
	} 
	

</script>
</body>
</html>

