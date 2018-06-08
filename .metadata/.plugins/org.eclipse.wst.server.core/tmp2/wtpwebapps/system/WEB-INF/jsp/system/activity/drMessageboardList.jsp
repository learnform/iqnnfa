<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp"%>
<script type="text/javascript" src="${apppath}/js/common/jquery.form.js"></script>
</head>
<body>
	<table id="getYsMessageboardList" title="留言板" class="easyui-datagrid"
		style="height: 99%;"
		data-options="singleSelect:true,
	    fitColumns:true,url: '../activity/getYsMessageboardList.do',
	    method:'post',rownumbers:true,showFooter: true,
	    pagination:true,toolbar:'#prizeTools',onLoadSuccess:ysFeedbackBtn">
		<thead>
			<tr>
				<th data-options="field:'id'" hidden="hidden">ID</th>
				<th data-options="field:'realName'" width="10%">姓名</th>
				<th data-options="field:'mobilePhone'" width="10%">联系方式</th>
				<th data-options="field:'message'" width="30%">留言内容</th>
				<th data-options="field:'submittime'" width="10%"
					formatter="formatDateBoxFull">提交时间</th>
				<!-- <th data-options="field:'status'" width="10%">状态</th> -->
				<th data-options="field:'status'" width="100px"
					formatter="formatStatus">状态</th>
				<th
					data-options="field:'_operate',width:80,align:'center',formatter:formatOper"
					width="10%">基本操作</th>
			</tr>
		</thead>
	</table>
	<div id="prizeTools" style="padding: 5px; height: 750">
		<form id="prizeRecordForm">
			联系方式:<input id="searchMobilePhone" name="MobilePhone"
				class="easyui-textbox" size="15" style="width: 100px" /> 状态: <select
				id="searchStatus" name="status" style="width: 100px;"
				class="easyui-combobox">
				<option value=''>全部</option>
				<option value="0">未审核</option>
				<option value="1">通过</option>
				<option value="2">未通过</option>
			</select> <a id="searchPrizeRecord" href="javascript:void(0)"
				class="easyui-linkbutton" iconCls="icon-search">查询</a> <a
				id="resetPrizeBtn" href="#" class="easyui-linkbutton"
				iconCls="icon-reload">重置</a>
		</form>
	</div>
	<div id="giveawardPrize" class="easyui-window"
		data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:false,maximizable:false"
		style="width: 450px; height: 350px; padding: 10px;"></div>
	<div id="giveawardPrize" class="easyui-window"
		data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:false,maximizable:false"
		style="width: 450px; height: 350px; padding: 10px;"></div>
	<div id="award" class="easyui-window"
		data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:false,maximizable:false"
		style="width: 400px; height: 400px; padding: 10px;"></div>
	<div id="view" class="easyui-window"
		data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:false,maximizable:false"
		style="width: 400px; height: 400px; padding: 10px;"></div>
	<script type="text/javascript">
		$(function() {
			$('#getYsMessageboardList').datagrid("hideColumn", "id");
		});

		function ysFeedbackBtn() {
			$('.ysFeedbackBtn').linkbutton();
		}
		//查询按钮
		$('#searchPrizeRecord').click(function() {
			//alert("111");
			$('#getYsMessageboardList').datagrid({
				url : '../activity/getYsMessageboardList.do',
				queryParams : {
					mobilePhone : $('#searchMobilePhone').val(),
					status : $('#searchStatus').combobox("getValue"),
				}
			});
		});
		//重置按钮
		$('#resetPrizeBtn').click(function() {
			$("#prizeRecordForm").form("reset");
			$("#getYsMessageboardList").datagrid("load", {});
		});

		//状态
		function formatStatus(value, row, index) {
			if (value == 0) {
				return '未审核';
			} else if (value == 1) {
				return '通过';
			} else if (value == 2) {
				return '未通过';
			}
		}

		//操作
		function formatOper(value, row, index) {
			var articleOper = "";
			if (row.status == 0) {
				articleOper += '<a href="#" class="ysFeedbackBtn" onclick="giveawardPrize('
						+ index + ')">审核</a>';
			}
			return articleOper;
		}
		//留言审核操作
		function giveawardPrize(index) {
			$('#getYsMessageboardList').datagrid('selectRow', index);// 关键在这里 
			var row = $('#getYsMessageboardList').datagrid('getSelected');
			$("#giveawardPrize").window({
				title : "审核",
				href : "../activity/selectByPrimaryKey.do?id=" + row.id,
			});
			$("#giveawardPrize").window("open");
		}
	</script>
</body>
</html>





