<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="drChannelInfoUserList" title="渠道注册用户" 
	class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:true,
	    fitColumns:true, url: '../channel/drChannelInfoUserList.do',
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#drChannelInfoUserTools'">
		<thead>
	    <tr>
	    	<th data-options="field:'id'" hidden="true">序号</th>
	    	<th data-options="field:'realName'" width="25%">客户姓名</th>
	        <th data-options="field:'mobilephone'" width="25%">手机号码</th>
	        <th data-options="field:'regDate'" width="25%" formatter="formatDateBoxFull">注册时间</th>
	       	<th data-options="field:'name'" width="20%">渠道名称</th>
	    </tr>
	    </thead>
	</table>
	<div id="drChannelInfoUserTools" style="padding:5px;height:750">
	  	<form id="drChannelInfoUserForm">
	  		注册时间:<input id="ssearchDrChannelInfoUserStartDate" name="startDate" class="easyui-datebox" style="width:100px"/>
	  		至<input id="searchDrChannelInfoUserEndDate" name="endDate" class="easyui-datebox" style="width:100px"/>
	  		手机号码:<input id="searchDrChannelInfoUserPhone" name="mobilephone" class="easyui-textbox"  size="15" style="width:100px"/>
			渠道名称: <select  id="searchDrChannelInfoUserCode" name="code" style="width:100px;" class="easyui-combobox">
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
	    	<a id="searchDrChannelInfoUser" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	    	<a id="resetDrChannelInfoUser" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-redo" onclick="drChannelInfoUserDown()">导出</a>	
	    </form>
	</div>
<script type="text/javascript">
	//重置按钮
	$('#resetDrChannelInfoUser').click(function(){
		$("#drChannelInfoUserForm").form("reset");
		$("#drChannelInfoUserList").datagrid("load", {});
	});
	
	//查询按钮
	$('#searchDrChannelInfoUser').click(function(){
 		$('#drChannelInfoUserList').datagrid({
			queryParams: {
				startDate: $('#ssearchDrChannelInfoUserStartDate').datebox('getValue'),
				endDate: $('#searchDrChannelInfoUserEndDate').datebox('getValue'),
				mobilephone: $('#searchDrChannelInfoUserPhone').val(),
				code: $('#searchDrChannelInfoUserCode').combobox('getValue'),
			}
		}); 
	});

	function drChannelInfoUserDown(){
		location.href="${apppath}/channel/exportChannelUserRecord.do?mobilephone="+$('#searchDrChannelInfoUserPhone').val()
						+"&startDate="+$('#ssearchDrChannelInfoUserStartDate').datebox('getValue')+
						"&endDate="+$('#searchDrChannelInfoUserEndDate').datebox('getValue')+
						"&code="+$('#searchDrChannelInfoUserCode').combobox('getValue');
	};
</script>
</body>
</html>

