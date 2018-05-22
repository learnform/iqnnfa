<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
<script type="text/javascript" src="../js/common/jquery.form.js"></script>
</head>
<body>
	<table id="drChannelInfoAnalysisList" title="渠道分析" 
	class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:true,
	    fitColumns:true, url: '../channel/drChannelInfoAnalysisList.do',
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#drChannelInfoAnalysisTools'">
		<thead>
	    <tr>
	    	<th data-options="field:'id'" hidden="true">序号</th>
	    	<th data-options="field:'addDate'" formatter="formatDateBox" width="6%">日期</th>
	        <th data-options="field:'name'" width="5%">渠道</th>
	        <th data-options="field:'activatenum'" width="5%">激活人数</th>
	        <th data-options="field:'registerCount'" width="84px">注册人数</th>
	        <th data-options="field:'realNameCount'" width="84px">实名人数</th>
	       	<th data-options="field:'firstCount'" width="84px">首投人数</th>
	        <th data-options="field:'firstAmount'" width="136px">首投金额</th>
	        <th data-options="field:'secondCount'" width="84px">二投用户</th>
	        <th data-options="field:'secondAmount'" width="136px">二投金额</th>
	        <th data-options="field:'afterCount'" width="84px">后续投资人数</th>
	        <th data-options="field:'afterAmount'" width="136px">后续投资金额</th>
	        <th data-options="field:'monthCount'" width="136px">首投月标人数</th>
	        <th data-options="field:'monthAmount'" width="136px">首投月标金额</th>
			<th data-options="field:'saveMoney'" width="136px">渠道留存</th>
			<th data-options="field:'regularAmount'" width="136px">定期投资总额</th>
			<th data-options="field:'_operate',align:'center'" width="170px;" formatter="formatOper">基本操作</th>
	    </tr>
	    </thead>
	</table>
	<div id="drChannelInfoAnalysisTools" style="padding:5px;height:750">
	  	<form id="drChannelInfoForm">
	  		渠道名称:<input id="searchDrChannelInfoName" name="name" class="easyui-textbox"  size="15" style="width:100px"/>
	    	<a id="searchDrChannelInfo" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-redo" onclick="drChannelInfoUserDown()">导出</a>	
	    </form>
	</div>
	
<script type="text/javascript">

	//导出
	function drChannelInfoUserDown(){
		location.href="${apppath}/channel/exportChannelAnalysisRecord.do?name="+$('#searchDrChannelInfoName').val();
	};
	var i=1;
	//查询按钮
	$('#searchDrChannelInfo').click(function(){
 		$('#drChannelInfoAnalysisList').datagrid({
			queryParams: {
				name: $('#searchDrChannelInfoName').val()
			}
		}); 
 		i++;
	});
	
	function formatDateBox(value) {  
	    if (value == null || value == '') {  
	        return '';  
	    }  
	    var dt = parseToDate(value);  
	    return dt.format("yyyy-MM-dd");  
	}  
	
	function updateDrChannelInfoBtn(index){
		$('#drChannelInfoAnalysisList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drChannelInfoAnalysisList').datagrid('getSelected'); 
		console.log(row.id)
		var url = "${apppath}/channel/queryDrChannelAnalysisInfo.do?code="+row.id;
		$.ajax({
			url: url,
			dataType:"json",
			success:function(data){
				$('#drChannelInfoAnalysisList').datagrid('updateRow',{
					index: index,
					row: data
				});
			}
	  	});
	}
	
	//添加基本操作链接
	function formatOper(val,row,index){  
		return	'<a href="#" class="btn l-btn l-btn-small"  onclick="updateDrChannelInfoBtn('+index+')">统计</a>&nbsp;&nbsp;&nbsp;';
	} 
</script>
</body>
</html>
