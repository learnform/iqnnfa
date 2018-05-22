<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="drMemberAutoInvestConfList" title="用户自投配置" 
	class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:true,
	    fitColumns:true, url: '../autoInvest/drMemberAutoInvestConfList.do',
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#drMemberAutoInvestConfTools'">
		<thead>
	    <tr>
	    	<th data-options="field:'id'" hidden="true">序号</th>
	    	<th data-options="field:'mobilePhone'" width="10%">用户手机</th>
	    	<th data-options="field:'realname'" width="5%">用户姓名</th>
	    	<th data-options="field:'availableBalance'" width="10%" styler="styleColor" formatter="formatAmount">可用余额</th>
	    	<th data-options="field:'deadline'" width="10%">自动标期</th>	    	
	        <th data-options="field:'amount'" width="10%" styler="styleColor" formatter="formatAmount">自投金额</th>
	        <th data-options="field:'balance'" width="10%" styler="styleColor" formatter="formatAmount">保留余额</th>	        
	        <th data-options="field:'useCouponName'" width="10%">使用优惠券</th>
	       	<th data-options="field:'onOffName'" width="10%">状态</th>
	        <th data-options="field:'addTime'" width="10%" formatter="formatDateBoxFull">添加时间</th>
	        <th data-options="field:'updTime'" width="10%" formatter="formatDateBoxFull">修改时间</th>	        
	    </tr>
	    </thead>
	</table>
	<div id="drMemberAutoInvestConfTools" style="padding:5px;height:750">
	  	<form id="drMemberAutoInvestConfForm">
  			用户手机:<input id="searchDrMemberAutoInvestConfMobilephone" name="mobilePhone" class="easyui-textbox"  size="30" style="width:100px"/>
	  		用户姓名:<input id="searchDrMemberAutoInvestConfRealname" name="realname" class="easyui-textbox"  size="30" style="width:100px"/>
	  		当前状态: <select  id="searchDrMemberAutoInvestConfOnOff" name="onOff" style="width:100px;" class="easyui-combobox">
				 	<option value=''>全部</option>
					<c:forEach var="map" items="${onOff}">
						<option value='${map.key}'>${map.value}</option>
			        </c:forEach>
	           		</select>
	    	<a id="searchDrMemberAutoInvestConf" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	    	<a id="resetDrMemberAutoInvestConf" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
	    	<a id="exportDrMemberAutoInvestConf" href="javascript:exportDrMemberAutoInvestConf();" class="easyui-linkbutton" iconCls="icon-redo">导出</a>
	    </form>
	</div>
<script type="text/javascript">
	//重置按钮
	$('#resetDrMemberAutoInvestConf').click(function(){
		$("#drMemberAutoInvestConfForm").form("reset");
		$("#drMemberAutoInvestConfList").datagrid("load", {});
	});
	
	//查询按钮
	$('#searchDrMemberAutoInvestConf').click(function(){
 		$('#drMemberAutoInvestConfList').datagrid({
			queryParams: {
				realname:$('#searchDrMemberAutoInvestConfRealname').val(),
				mobilePhone:$('#searchDrMemberAutoInvestConfMobilephone').val(),
				onOff: $('#searchDrMemberAutoInvestConfOnOff').combobox("getValue")
			}
		}); 
	});
	
	//导出
	function exportDrMemberAutoInvestConf(){
		window.location.href="../autoInvest/exportDrMemberAutoInvestConf.do?realname="+encodeURIComponent(encodeURIComponent($('#searchDrMemberAutoInvestConfRealname').val()))+
						"&mobilePhone="+$('#searchDrMemberAutoInvestConfMobilephone').val()+
						"&onOff="+$('#searchDrMemberAutoInvestConfOnOff').combobox("getValue");
	}
</script>
</body>
</html>

