﻿<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body style="width:100%;height:100%">
	<table id="memberList" title="用户查询" class="easyui-datagrid" style="height:99%;width:99.9%"data-options="singleSelect:true,
	    fitColumns:true,method:'post',rownumbers:true,pagination:true,toolbar:'#memberTools'">
		<thead>
	    <tr>
	        <th data-options="field:'uid'" hidden="true"></th>
	       	<th data-options="field:'regDate'" width="10%"  formatter="formatDateBoxFull">注册时间</th>
	       	<th data-options="field:'mobilephone'" width="6%">手机号码</th>
	       	<th data-options="field:'realName'" width="5%">真实姓名</th>
	       	<th data-options="field:'recommCodes'" width="5%">推荐码</th>
	        <th data-options="field:'idCards'" width="10%">身份证号</th>
	        <th data-options="field:'balance'" width="10%" styler="styleColor" formatter="formatAmount">账户余额</th>
	       	<th data-options="field:'freeze'" width="10%" styler="styleColor" formatter="formatAmount">冻结金额</th>
	       	<th data-options="field:'crushCount'" width="10%" styler="styleColor" formatter="formatAmount">充值总额</th>
	        <th data-options="field:'carryCount'" width="10%" styler="styleColor" formatter="formatAmount">提现总额</th>
	        <th data-options="field:'referrer'" width="10%">推荐人</th>	        
	    </tr>
	    </thead>
	</table>
	<div id="memberTools" style="padding:5px;height:750">
	  	<form id="memberForm">
	  		手机号码: <input id="searchMemberMobilephone" class="easyui-textbox" name="mobilephone" style="width:150px">
			真实姓名: <input id="searchMemberRealName" class="easyui-textbox" name="realName" style="width:150px">
			身份证号码: <input id="searchMemberIdCards" class="easyui-textbox" name="idCards" style="width:150px">
			推荐人: <input id="searchMemberReferrer" class="easyui-textbox" name="referrer" style="width:150px">
	    	<a id="searchMemberLogBtn" href="#" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	    </form>
	</div>
<script type="text/javascript">
	$(function(){
		//查询按钮
		$('#searchMemberLogBtn').click(function(){
			if($('#searchMemberMobilephone').val()==""&&$('#searchMemberRealName').val()==""&&$('#searchMemberIdCards').val()==""&&$('#searchMemberReferrer').val()==""){
				$.messager.alert("提示信息","请输入筛选条件再进行查询！");
				$('#memberList').datagrid('loadData', { total: 0, rows: [] });
				return;
			}
	 		$('#memberList').datagrid({
	 			url: '../member/memberList.do',
				queryParams: {
					mobilephone: $('#searchMemberMobilephone').val(),
					realName: $('#searchMemberRealName').val(),
					idCards: $('#searchMemberIdCards').val(),
					referrer: $('#searchMemberReferrer').val()
				}
			}); 
		});
	});
</script>
</body>
</html>
