<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="drChannelInfoOrderList" title="渠道订单" 
	class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:true,
	    fitColumns:true, url: '../channel/drChannelInfoOrderList.do',
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#drChannelInfoOrderTools'">
		<thead>
	    <tr>
	    	<th data-options="field:'id'" hidden="true">序号</th>
	    	<th data-options="field:'realName'" width="10%">客户姓名</th>
	        <th data-options="field:'mobilephone'" width="10%">手机号码</th>
	        <th data-options="field:'fullName'" width="10%">产品名称</th>
	        <th data-options="field:'amount'" width="10%" styler="styleColor" formatter="formatAmount">订单金额</th>
	        <th data-options="field:'deadline'" width="10%">项目周期</th>
	        <th data-options="field:'investTime'" width="10%" formatter="formatDateBoxFull">订单时间</th>
	        <th data-options="field:'regDate'" width="10%" formatter="formatDateBoxFull">注册时间</th>
	       	<th data-options="field:'name'" width="20%">渠道名称</th>
	    </tr>
	    </thead>
	</table>
	<div id="drChannelInfoOrderTools" style="padding:5px;height:750">
	  	<form id="drChannelInfoOrderForm">
	  		注册时间:<input id="ssearchDrChannelInfoOrderStartDate" name="startDate" class="easyui-datebox" style="width:100px"/>
	  		至<input id="searchDrChannelInfoOrderEndDate" name="endDate" class="easyui-datebox" style="width:100px"/>
	  		手机号码:<input id="searchDrChannelInfoOrderPhone" name="mobilephone" class="easyui-textbox"  size="15" style="width:100px"/>
			渠道名称: <select  id="searchDrChannelInfoOrderCode" name="code" style="width:100px;" class="easyui-combobox">
				<c:if test="${isAuth == 1 }">
					<c:forEach items="${channel }" var="map">
						<c:if test="${map.code == code }">
							<option value='${map.code }'>${map.name }</option>
						</c:if>
					</c:forEach>
				</c:if>
				<c:if test="${isAuth == 0 }">
					<option value=''>全部</option>
					<c:forEach items="${channel }" var="map">
						<option value='${map.code }'>${map.name }</option>
					</c:forEach>
				</c:if>
         	</select>
	    	<a id="searchDrChannelInfoOrder" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	    	<a id="resetDrChannelInfoOrder" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-redo" onclick="drChannelInfoOrderDown()">导出</a>	
	    </form>
	</div>
<script type="text/javascript">
	//重置按钮
	$('#resetDrChannelInfoOrder').click(function(){
		$("#drChannelInfoOrderForm").form("reset");
		$("#drChannelInfoOrderList").datagrid("load", {});
	});
	
	//查询按钮
	$('#searchDrChannelInfoOrder').click(function(){
 		$('#drChannelInfoOrderList').datagrid({
			queryParams: {
				startDate: $('#ssearchDrChannelInfoOrderStartDate').datebox('getValue'),
				endDate: $('#searchDrChannelInfoOrderEndDate').datebox('getValue'),
				mobilephone: $('#searchDrChannelInfoOrderPhone').val(),
				code: $('#searchDrChannelInfoOrderCode').combobox('getValue'),
			}
		}); 
	});

	function drChannelInfoOrderDown(){
		location.href="${apppath}/channel/exportChannelOrderRecord.do?mobilephone="+$('#searchDrChannelInfoOrderPhone').val()
						+"&startDate="+$('#ssearchDrChannelInfoOrderStartDate').datebox('getValue')+
						"&endDate="+$('#searchDrChannelInfoOrderEndDate').datebox('getValue')+
						"&code="+$('#searchDrChannelInfoOrderCode').combobox('getValue');
	};
</script>
</body>
</html>

