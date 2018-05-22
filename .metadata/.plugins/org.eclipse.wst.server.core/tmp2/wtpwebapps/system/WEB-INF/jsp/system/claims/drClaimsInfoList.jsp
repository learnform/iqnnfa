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
	<table id="drClaimsInfoList" title="债权管理" 
	class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:true,
	    fitColumns:true, url: '../claims/drClaimsLoanList.do',
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#drClaimsInfoTools'">
		<thead>
	    <tr>
	    	<th data-options="field:'id'" hidden="true">序号</th>
	    	<th data-options="field:'status'" hidden="true">状态</th>  	
	    	<th data-options="field:'no'" width="10%">借款合同编号</th>
	        <th data-options="field:'name'" width="10%">产品名称</th>
	       	<th data-options="field:'companyName'" width="15%">企业名称</th>
	        <th data-options="field:'loanAmount'" width="10%" styler="styleColor" formatter="formatAmount">借款金额(元)</th>
	        <th data-options="field:'receiveInterest'" width="10%" styler="styleColor" formatter="formatAmount">应收利息(元)</th>
	        <th data-options="field:'serviceCharge'" width="10%" styler="styleColor" formatter="formatAmount">服务费(元)</th>	        
	        <th data-options="field:'addDate'" width="10%" formatter="formatDateBoxFull">新增日期</th>
	        <th data-options="field:'statusName'" width="5%">当前状态</th>
			<th data-options="field:'_operate',align:'center'" width="10%" formatter="formatOper">基本操作</th>
	    </tr>
	    </thead>
	</table>
	<div id="drClaimsInfoTools" style="padding:5px;height:750">
	  	<form id="drClaimsInfoForm">
	  		合同编号:<input id="searchClaimsLoanNo" name="no" class="easyui-textbox"  size="15" style="width:200px"/>
	  		产品名称:<input id="searchClaimsLoanName" name="name" class="easyui-textbox"  size="15" style="width:150px"/>
	  		企业名称:<input id="searchClaimsLoanCompanyName" name="companyName" class="easyui-textbox"  size="15" style="width:150px"/>
	  		录入日期:<input id="searchClaimsLoanStartDate" name="startDate" class="easyui-datebox" style="width:100px"/>到
	  				<input id="searchClaimsLoanEndDate" name="endDate" class="easyui-datebox" style="width:100px"/>
	  		当前状态: <select  id="searchClaimsLoanStatus" name="status" style="width:100px;" class="easyui-combobox">
						<option value=''>全部</option>
						<c:forEach items="${status }" var="map">
							<option value='${map.key }'>${map.value }</option>
						</c:forEach>
	           		</select>
	    	<a id="searchClaimsLoan" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	    	<a id="resetClaimsLoan" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="addDrClaimsInfoBtn()">债权新增</a>	
	    </form>
	</div>
	
	<div id="addDrClaimsInfoAdvanceDialog" class="easyui-dialog" title="放款提示"
		data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:true,maximizable:false,buttons:'#addDrClaimsInfoAdvanceDialogBtn'" style="width:300px;height:200px;padding:5px;">
		<form id="addDrClaimsInfoAdvanceForm">
			<input type="hidden" id="addDrClaimsInfoAdvanceId"  name="id"/>
			<table align="center">
				<tr>
					<td align="left">放款日期：</td>
					<td>
						<input id="addStartDate" name="startDate" type="text" class="easyui-datebox" data-options="required:true"/>
					</td>
				</tr>
				<tr>
					<td align="left">服务费：</td>
					<td>
						<input id="addServiceCharge" name="serviceCharge" type="text" class="easyui-numberbox" data-options="required:true,min:0,max:100000000,precision:2"/>
					</td>
				</tr>
			</table>
		</form>
		<div id="addDrClaimsInfoAdvanceDialogBtn">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="addDrClaimsInfoAdvance()">确定</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeAddDrClaimsInfoAdvanceDialog()">取消</a>
		</div>
	</div>
<script type="text/javascript">

	//重置按钮
	$('#resetClaimsLoan').click(function(){
		$("#drClaimsInfoForm").form("reset");
		$("#drClaimsInfoList").datagrid("load", {});
	});
	
	//查询按钮
	$('#searchClaimsLoan').click(function(){
 		$('#drClaimsInfoList').datagrid({
			queryParams: {
				no: $('#searchClaimsLoanNo').val(),
				name: $('#searchClaimsLoanName').val(),
				companyName: $('#searchClaimsLoanCompanyName').val(),
				startDate: $('#searchClaimsLoanStartDate').datebox('getValue'),
				endDate: $('#searchClaimsLoanEndDate').datebox('getValue'),
				status: $('#searchClaimsLoanStatus').combobox('getValue'),
			}
		}); 
	});
	
	//添加基本操作链接
	function formatOper(val,row,index){  
		if(row.status=="1" || row.status=="3"){
			return	'<a href="#" class="btn l-btn l-btn-small" onclick="toShowClaimsInfoBtn('+index+')">查看</a>'+"   "+
					'<a href="#" class="btn l-btn l-btn-small" onclick="updateDrClaimsInfoBtn('+index+')">修改</a>';
					
		}else if((row.status=="2" || row.status=="4" || row.status=="5") && row.receiveInterest == null){
			return	'<a href="#" class="btn l-btn l-btn-small" onclick="toShowClaimsInfoBtn('+index+')">查看</a>'+"   "+
					'<a href="#" class="btn l-btn l-btn-small" onclick="addDrClaimsInfoAdvanceBtn('+index+')">放款</a>';
		}else{
			return	'<a href="#" class="btn l-btn l-btn-small" onclick="toShowClaimsInfoBtn('+index+')">查看</a>';
		}
	} 
	
	//跳转到债权添加页面
	function addDrClaimsInfoBtn(){
		var mainTab = parent.$('#main-center');
		var detailTab = {
				title : "债权新增",
				content:"<iframe width='100%' height='100%' frameborder='0' src='${apppath}/claims/toAddClaimsInfo.do' ></iframe>",
				closable : true
		};
		mainTab.tabs("add",detailTab);
	}
	
	//跳转到债权修改页面
	function updateDrClaimsInfoBtn(index){
		$('#drClaimsInfoList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drClaimsInfoList').datagrid('getSelected'); 
	    $.ajax({
			url: "${apppath}/claims/isOperate.do?id="+row.id+"&operate=update",
			dataType:"json",
			success:function(result){
				if(result.success){
					var mainTab = parent.$('#main-center');
					var detailTab = {
							title : "债权修改",
							content:"<iframe width='100%' height='100%' frameborder='0' src='${apppath}/claims/toUpdateClaimsInfo.do?lid="+row.id+"'></iframe>",
							closable : true
					};
					mainTab.tabs("add",detailTab);
				}else{
					$.messager.alert("提示信息",result.errorMsg,function(){
						$('#drClaimsInfoList').datagrid('reload');
					});
				}
			}
 		});
	}
	
	//跳转到债权显示页面
	function toShowClaimsInfoBtn(index){
		$('#drClaimsInfoList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drClaimsInfoList').datagrid('getSelected'); 
		var mainTab = parent.$('#main-center');
		var detailTab = {
				title : "债权显示",
				content:"<iframe width='100%' height='100%' frameborder='0' src='${apppath}/claims/toShowClaimsInfo.do?lid="+row.id+"'></iframe>",
				closable : true
		};
		mainTab.tabs("add",detailTab);
	}
	
	//放款操作
	function addDrClaimsInfoAdvanceBtn(index){
		$('#drClaimsInfoList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drClaimsInfoList').datagrid('getSelected'); 
	    $('#addDrClaimsInfoAdvanceId').val(row.id);
		$("#addDrClaimsInfoAdvanceDialog").dialog("open");
	}
	
	//放款操作
	function addDrClaimsInfoAdvance(index){
		var validate = $("#addDrClaimsInfoAdvanceForm").form("validate");
		if(!validate){
			return false;
		}
		var url = "${apppath}/claims/addDrClaimsInfoAdvance.do";
		$.ajax({
			url: url,
			dataType:"json",
			data:$("#addDrClaimsInfoAdvanceForm").serialize(),
			success:function(result){
				if(result.success){
					$.messager.alert("操作提示", result.msg);
					$('#drClaimsInfoList').datagrid('reload');
					$("#addDrClaimsInfoAdvanceDialog").dialog("close");
					$('#addDrClaimsInfoAdvanceForm').form('clear');
				}else{
					$.messager.alert("提示信息",result.errorMsg);
					$('#drClaimsInfoList').datagrid('reload');
					$("#addDrClaimsInfoAdvanceDialog").dialog("close");
				}
			}
	  	});
	}
	
	//关闭Dialog
	function closeAddDrClaimsInfoAdvanceDialog(){  
		$("#drClaimsInfoList").datagrid("reload");
		$("#addDrClaimsInfoAdvanceDialog").dialog("close");
	}
</script>
</body>
</html>

