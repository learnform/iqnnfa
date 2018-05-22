<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../../common/include/util.jsp" %>
</head>
<body>
	<table id="drProductRaiseList" title="手动回款" 
	class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:true,
	    fitColumns:true, url: '../task/drProductRepayList.do',
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#drProductInfoTools'">
		<thead>
	    <tr>
	    	<th data-options="field:'id'" hidden="true">序号</th>
	    	<th data-options="field:'isSid'" hidden="true"></th>	    	
	    	<th data-options="field:'code'" width="10%">产品编号</th>
	        <th data-options="field:'simpleName'" width="10%">产品名称</th>
	       	<th data-options="field:'rate'" width="5%">产品利率</th>
	       	<th data-options="field:'deadline'" width="5%">期限(天)</th>
<!-- 	       	<th data-options="field:'subSubplusDays'" width="6%">债权剩余天数(天)</th> -->
	        <th data-options="field:'amount'" width="10%" styler="styleColor" formatter="formatAmount">产品金额(元)</th>
	       	<th data-options="field:'alreadyRaiseAmount'" width="9%" styler="styleColor" formatter="formatAmount">已募集金额(元)</th>
	        <th data-options="field:'statusName'" width="5%">产品状态</th>
	        <th data-options="field:'status'" hidden="true">状态</th>
	        <th data-options="field:'isShowName'" formatter="formatOperIsShow">是否显示</th>
	        <th data-options="field:'isShow'" hidden="true">是否显示</th>
	       	<th data-options="field:'startDate'" width="10%" formatter="formatDateBoxFull">上架日期</th>
<!-- 	        <th data-options="field:'surplusDay'" width="6%">剩余到期天数(天)</th> -->
			<th data-options="field:'_operate',align:'center'" width="10%" formatter="formatOper">基本操作</th>
	    </tr>
	    </thead>
	</table>
	<div id="drProductInfoTools" style="padding:5px;height:20px ">
	  	<form id="drProductInfoForm">
	  		产品编号:<input id="searchDrProductInfoCode" name="code" class="easyui-textbox"  size="15" style="width:200px"/>
	  		产品简称:<input id="searchDrProductInfoSimpleName" name="simpleName" class="easyui-textbox"  size="15" style="width:200px"/>
	  		产品期限:<input id="searchDrProductInfoDeadline" name="deadline" class="easyui-textbox"/>
	  		剩余到期天数:<input id="searchDrProductInfoSurplusDay" name="surplusDay" class="easyui-textbox"/>
	  		产品状态: <select  id="searchDrProductInfoStatus" name="status" style="width:100px;" class="easyui-combobox">
						<option value=''>全部</option>
						<c:forEach items="${status }" var="map">
							<option value='${map.key }'>${map.value }</option>
						</c:forEach>
	           		</select>
	    	<a id="searchDrProductInfo" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	    	<a id="resetDrProductInfo" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
	    </form>
	</div>
	
	<div id="raisePassWordWindow" class="easyui-window"
		data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:false,maximizable:false"
		title="请输入密码" style="width:300px;height:120px;">
		<form id="passWordForm" style="padding:10px 20px 10px 40px;">
		<input type="hidden" id="pid" name="pid"/>
		密码:<input type="password" id="password" name="password" class="easyui-textbox"/>
		<div style="padding:5px;text-align:center;">
			<a id="confirmPassWord" href="javascript:void(0)" class="easyui-linkbutton" icon="icon-ok">确认</a>
			<a id="cancelPassWord" href="javascript:void(0)" class="easyui-linkbutton" icon="icon-cancel">取消</a>
		</div>
		</form>
	</div>
	
<script type="text/javascript">

	//重置按钮
	$('#resetDrProductInfo').click(function(){
		$("#drProductInfoForm").form("reset");
		$("#drProductRaiseList").datagrid("load", {});
	});
	
	//查询按钮
	$('#searchDrProductInfo').click(function(){
 		$('#drProductRaiseList').datagrid({
			queryParams: {
				code: $('#searchDrProductInfoCode').val(),
				simpleName: $('#searchDrProductInfoSimpleName').val(),
				deadline: $('#searchDrProductInfoDeadline').val(),
				surplusDay: $('#searchDrProductInfoSurplusDay').val(),
				status: $('#searchDrProductInfoStatus').combobox('getValue'),
			}
		}); 
	});
	//确认密码按钮并执行手动计息
	$('#confirmPassWord').click(function(){
		$.ajax({
          	url: "${apppath}/task/chcekRepayPassWord.do",
            type: 'POST',
            data: {'password':$('#password').val(),'id':$('#pid').val()},
            dataType: "json",
            success:function(result){
				if(result.success){
					$.messager.alert("提示信息",result.msg);
					$("#passWordForm").form("reset");
					$("#drProductRaiseList").datagrid("reload");
					$("#raisePassWordWindow").window('close');
				}else{
					$.messager.alert("提示信息",result.msg);
				}
			}
        });
	});
	//取消密码按钮
	$('#cancelPassWord').click(function(){
		$("#passWordForm").form("reset");
		$("#raisePassWordWindow").window('close');
	});
	
	
	//添加基本操作链接
	function formatOper(val,row,index){  
			return	'<a href="#" class="btn l-btn l-btn-small" onclick="toShowProductInfoBtn('+index+')">查看</a>'+"   "+
					'<a href="#" class="btn l-btn l-btn-small" onclick="raiseByHandsBtn('+index+')">手动回款</a>';
	} 
	
	//跳转到产品显示页面
	function toShowProductInfoBtn(index){
		$('#drProductRaiseList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drProductRaiseList').datagrid('getSelected'); 
		var mainTab = parent.$('#main-center');
		var detailTab = {
				title : "产品显示",
				content:"<iframe width='100%' height='100%' frameborder='0' src='${apppath}/product/toShowDrProductInfo.do?id="+row.id+"'></iframe>",
				closable : true
		};
		mainTab.tabs("add",detailTab);
	}
	//添加状态链接
	function formatOperIsShow(value,row,index){
		if(row.isShow == "1"){
			return '是';
		}else{
			return '否';
		}
	}
	
	function raiseByHandsBtn(index){
		$('#drProductRaiseList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drProductRaiseList').datagrid('getSelected'); 
		$('#raisePassWordWindow').window("open").window("center")
		$('#pid').val(row.id);
	}
	
</script>
</body>
</html>

