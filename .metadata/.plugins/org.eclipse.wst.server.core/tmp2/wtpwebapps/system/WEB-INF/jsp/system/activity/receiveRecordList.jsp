 <%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="receiveRecordList" title="奖品领取记录列表"
	class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:true,
	    fitColumns:true, url: '../activity/getReceiveRecordList.do',
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#receiveRecordListTools'">
		<thead>
	    <tr>
	    	<th data-options="field:'id'" hidden="true">序号</th>
	        <th data-options="field:'realname'" width="8%">奖品领取人姓名</th>
			<th data-options="field:'realphone'" width="8%">奖品领取人手机</th>
	       	<th data-options="field:'name'" width="15%">奖品名称</th>
			<th data-options="field:'add_time'" width="15%" formatter="formatDateBoxFull">领取时间</th>
			<th data-options="field:'send_name'" width="10%">收货人姓名</th>
			<th data-options="field:'phone_number'" width="10%">联系方式</th>
			<th data-options="field:'address'" width="15%">收货地址</th>
			<th data-options="field:'status'" formatter="formaterStatus">信息确认</th>
			<th data-options="field:'remark'" width="10%">备注</th>
	    </tr>
	    </thead>
	</table>
	<div id="receiveRecordListTools" style="padding:5px;height:750">
	  	<form id="receiveRecordForm">
			奖品领取人姓名:<input id="searchRealName" name="realname" class="easyui-textbox"  size="15" style="width:200px"/>
			奖品领取人手机号:<input id="searchRealphone" name="searchRealphone" class="easyui-textbox" size="15" style="width:200px"/>
			领取时间:<input id="searchStartTime" name="searchStartTime" class="easyui-datebox" style="width:100px"/>到
			<input id="searchEndTime" name="searchEndTime" class="easyui-datebox" style="width:100px"/>
			信息是否已确认:<select id="searchStatus" class="easyui-combobox" name="searchStatus" style="width:100px;">
										<option value="">—请选择—</option>
										<option value="0">未确认</option>
										<option value="1">已确认</option>
									</select>
			<a id="searchReceiveRecord" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
			<a id="resetReceiveRecord" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
		</form>
	</div>

<script type="text/javascript">


	//重置按钮
	$('#resetReceiveRecord').click(function(){
		$("#receiveRecordForm").form("reset");
		$("#receiveRecordList").datagrid("load", {});
	});
	
	//查询按钮
	$('#searchReceiveRecord').click(function(){
 		$('#receiveRecordList').datagrid({
			queryParams: {
                realname: $('#searchRealName').val(),
                realphone: $('#searchRealphone').val(),
                startDate:$('#searchStartTime').datebox('getValue'),
                endDate:$('#searchEndTime').datebox('getValue'),
				status:$('#searchStatus').combogrid('getValues')+""
			}
		}); 
	});


	//更改是否显示
	function updateReceiveRecordListBtn(index){
		$('#receiveRecordList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#receiveRecordList').datagrid('getSelected'); 
		$.messager.confirm('操作提示', '你确定更改吗？', function(r){
			if(r){
				var url = "../activity/updateReceiveRecord.do?id="+row.id;
				$.ajax({
					url: url,
					success:function(){
						$('#receiveRecordList').datagrid('reload');
						$.messager.alert("操作提示", "操作成功");
					}
			  	});
			}
		});
	} 

	
	//是否发货
	function formaterStatus(value,row,index){
		if(row.status=="1"){
            return '已确认';
		}else{
            return '<a href="#" onclick="updateReceiveRecordListBtn('+index+')">未确认</a>';
		}
	}

</script>
</body>
</html>

