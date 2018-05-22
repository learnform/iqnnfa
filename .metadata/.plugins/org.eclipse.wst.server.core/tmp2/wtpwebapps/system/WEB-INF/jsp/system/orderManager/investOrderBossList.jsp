<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="drInvestOrderBossList" title="渠道订单管理" 
	class="easyui-datagrid" style="height:99%;"
	data-options="singleSelect:true,
	    fitColumns:true,
	    method:'post',rownumbers:true,showFooter: true,
	    pagination:true,toolbar:'#drProductInvestBossTools'">
		<thead>
	    <tr>
	        <th data-options="field:'realname'" width="4%">用户姓名</th>
	        <th data-options="field:'mobilePhone'" width="5%" >手机号码</th>
	        <th data-options="field:'recomRealName'" width="5%">推荐人姓名</th>
	        <th data-options="field:'recomMobilePhone'" width="5%">推荐人号码</th>
	        <th data-options="field:'fullName'" width="8%">产品名称</th>
	        <th data-options="field:'deadline'" width="5%">项目周期(天)</th>
	        <th data-options="field:'amount'" width="5%" styler="styleColor" formatter="formatAmount">订单金额</th>
	        <th data-options="field:'interest'" width="5%" styler="styleColor" formatter="formatAmount">预计收益</th>
	        <th data-options="field:'faAmount1'" width="5%" styler="styleColor" formatter="formatAmount">红包返现</th>
	        <th data-options="field:'raisedRates'" width="4%">加息利率</th>
	        <th data-options="field:'multiple'" width="4%" styler="styleColor">翻倍倍数</th>
	        <th data-options="field:'method'" width="4%">投资类型</th>
	        <th data-options="field:'investTime'" width="8%">订单时间</th>
	        <th data-options="field:'resultDate'" width="6%">计息日期</th>
	        <th data-options="field:'shouldTime'" width="6%">还款日期</th>
	        <th data-options="field:'joinType'" width="4%">投资终端</th>
	        <th data-options="field:'statusName'" width="5%">投资状态</th>
	        <th data-options="field:'usedTime'" width="8%">活动兑换日期</th>
	        <th data-options="field:'faAmount2'" width="5%">活动金额</th>
	        <th data-options="field:'typeName'" width="4%">活动类型</th>
	        <th data-options="field:'faStatus'" width="4%">活动状态</th>
	        <th data-options="field:'options'" width="5%">专属理财师</th>
	        <th data-options="field:'regdate'" width="8%">注册日期</th>
	        <th data-options="field:'aliasName'" width="5%">注册渠道</th>
	    </tr>
	    </thead>
	</table>
	<div id="drProductInvestBossTools" style="padding:5px;height:750">
	  	<form id="drProductInvestBossForm">
	  		产品名称:<input id="searchDrProductInvestBossFullName" name="fullName" class="easyui-textbox" value="" size="30" style="width:100px"/>
	  		用户手机:<input id="searchDrProductInvestBossMobilephone" name="mobilephone" class="easyui-textbox"  size="30" style="width:100px"/>
	  		用户姓名:<input id="searchDrProductInvestBossRealname" name="realname" class="easyui-textbox"  size="30" style="width:100px"/>
	  		订单日期:<input id="searchDrProductInvestBossStartDate" name="startDate" class="easyui-datebox" style="width:100px"/>到
	  			  <input id="searchDrProductInvestBossEndDate" name="endDate" class="easyui-datebox" style="width:100px"/>
	  		还款日期:<input id="searchDrProductInvestBossStartShouldTime" name="startShouldTime" class="easyui-datebox" style="width:100px"/>到
	  			  <input id="searchDrProductInvestBossEndShouldTime" name="endShouldTime" class="easyui-datebox" style="width:100px"/>
	  		投资类型: <select  id="searchDrProductInvestBossMethod" name="method" style="width:100px;" class="easyui-combobox">
				 	<option value=''>全部</option>
					<c:forEach var="map" items="${method}">
						<option value='${map.key}'>${map.value}</option>
			        </c:forEach>
	           		</select>	  
	  		渠道名称:<select class="easyui-combogrid" id="cid" name="cid" style="width:240px;padding-bottom: 3px;" data-options="
							panelWidth: 240,
							multiple: true,
							multiline:true,
							editable:false,
							idField: 'id',
							textField: 'alias',
							url: '../channel/drAllChannelInfoBossList.do',
							method: 'get',
							columns: [[
								{field:'id',checkbox:true},
								{field:'code',title:'渠道号',width:80},
								{field:'alias',title:'渠道名称',width:80},
							]],
							fitColumns: true
						">
					</select>
	    	<a id="searchInvestBossOrder" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	    </form>
	</div>
<script type="text/javascript">
	//查询按钮
	$('#searchInvestBossOrder').click(function(){
		var cids = $('#cid').combogrid('getValues')+"";
 		$('#drInvestOrderBossList').datagrid({
 			url: '../investOrder/investOrderBossList.do',
			queryParams: {
				realname:$('#searchDrProductInvestBossRealname').val(),
				fullName:$('#searchDrProductInvestBossFullName').val(),
				mobilephone:$('#searchDrProductInvestBossMobilephone').val(),
				startDate:$('#searchDrProductInvestBossStartDate').combobox('getValue'),
				endDate:$('#searchDrProductInvestBossEndDate').combobox('getValue'),
				startShouldTime:$('#searchDrProductInvestBossStartShouldTime').combobox('getValue'),
				endShouldTime:$('#searchDrProductInvestBossEndShouldTime').combobox('getValue'),
				cids:cids,
				method: $('#searchDrProductInvestBossMethod').combobox("getValue")
			}
		}); 
	});
</script>
</body>
</html>