<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../../common/util.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/js/easyUI/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/js/easyUI/themes/icon.css">
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/jquery.form.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<table id="crmstaffList" title="电销专员" 
	class="easyui-datagrid" style="height:99%;" remoteSort="true"
	data-options="singleSelect:true,
	    fitColumns:true, url: '${pageContext.servletContext.contextPath}/background/electric/staffList.html',
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#drProductInvestTools'">
		<thead>
	    <tr>
<!-- 	    	<th data-options="checkbox:true"></th> -->
	    	<th data-options="field:'uid'" width="80px">用户ID</th>
	        <th data-options="field:'userName'"  width="80px">用户姓名</th>
	        <th data-options="field:'mobilePhone'" formatter="formatImg" width="80px">手机号</th>
	        <th data-options="field:'mobile'" width="80px">手机号</th>
	        <th data-options="field:'referrerName'"  width="80px">推荐人姓名</th>
	        <th data-options="field:'referrerPhone'"  width="80px"  formatter="formatRef">推荐人号码</th>
	        <th data-options="field:'registertime'" width="80px" formatter="formatDateBoxFull">注册时间</th>
	        <th data-options="field:'bankName'" width="80px">绑卡银行</th>
	        <th data-options="field:'balance'" sortable="true" styler="styleColor" width="80px">账户金额</th>
	        <th data-options="field:'freeze'" sortable="true" styler="styleColor" width="80px">冻结金额</th>
	        <th data-options="field:'wprincipal'" sortable="true" styler="styleColor" width="80px">待收本金</th>
	        <th data-options="field:'investAmount'" sortable="true" styler="styleColor" width="80px">累计投资总额</th>
	        <th data-options="field:'isFollow'"  width="80px" formatter="formatFollow">是否沟通</th>
	        <th data-options="field:'followCount'" sortable="true"  width="50px">沟通次数</th>
	        <th data-options="field:'lastFollowTime'"  width="100px"  formatter="formatDateBoxFull">最后沟通时间</th>
			<th data-options="field:'lastFollowState'" width="100px">最后沟通状态</th>
	        <th data-options="field:'regfrom'"  width="80px" formatter="formatRegfrom">注册终端</th>
	        <th data-options="field:'_operate',align:'center'"  width="80px"  formatter="formatOper">操作</th>
	    </tr>
	    </thead>
	</table>
	<div id="drProductInvestTools" style="padding:5px;height:750">
	  	<form id="staffListForm">
	  		手机号:<input id="searchRegMobilephone" name="mobilephone" class="easyui-textbox"  size="30" style="width:100px"/>
	  		用户姓名:<input id="searchRegRealname" name="userName" class="easyui-textbox"  size="30" style="width:100px"/>
	  		注册日期:<input id="searchRegStartDate" name="dateStart" class="easyui-datebox" style="width:100px"/>到
	  				<input id="searchRegEndDate" name="dateEnd" class="easyui-datebox" style="width:100px"/>
			预约时间:<input id="searchAdvanceDate" name="advanceDate" class="easyui-datebox" style="width:100px"/>
			推荐人姓名:<input id="searchDrProductInvestRecomRealName" name="referrerName" class="easyui-textbox" value="" size="30" style="width:100px"/>
	  		推荐人号码:<input id="searchDrProductInvestRecomMobilePhone" name="referrerPhone" class="easyui-textbox"  size="30" style="width:100px"/>
	  		累计投资额:<input id="searchInvestAmountS" name="minAmount" class="easyui-textbox" value="" size="30" style="width:100px"/>&nbsp;至
					<input id="searchInvestAmountE" name="maxAmount" class="easyui-textbox" value="" size="30" style="width:100px"/><br/>
			是否投资:<select id="isInvest" class="easyui-combobox" name="isInvest" style="width:200px;">   
					    <option value="">全部</option>   
					    <option value="1">是</option>   
					    <option value="0">否</option>   
					</select> 
			是否沟通:<select id="isFollow" class="easyui-combobox" name="isFollow" style="width:200px;">   
					    <option value="">全部</option>   
					    <option value="1">是</option>   
					    <option value="2">否</option>   
					</select>		
			跟进流程状态：<select id="status" class="easyui-combobox" name="status" style="width:200px;">
							<option value="">全部</option>
							<option value="0">未接听</option>
							<option value="1">待联系</option>
							<option value="2">持续跟进</option>
							<option value="3">高意向</option>
							<option value="4">成功</option>
							<option value="5">失败</option>
						 </select>				 							
	    	<a id="search" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	    	<a id="reset" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
	    </form>
	</div>
	<div id="w" class="easyui-dialog" title="沟通管理" data-options="iconCls:'icon-save',minimizable:false,tools:'#tt',closed:true" style="width:600px;height:400px;padding:10px;">
<!-- 		<div align="center">用户姓名：<span id="userName"></span> -->
<!-- 		&nbsp;&nbsp;&nbsp;手机号：<span id="mobilePhone"></span> -->
<!-- 		<a href="#" class="btn l-btn l-btn-small"  onclick="clickPhone()">呼叫</a></div><br> -->
<!-- 		<div id="ztth_load"></div> -->
<!-- 		<script> -->
<!--    		    var ag_num_value = 8001;   -->
<!--   		    var ag_phone_value = 15909346841;   -->
<%--   		    $('#ztth_load').load('${basePath}/sz_crm/ztth_wincall.jsp#ag_num=' + ag_num_value + '&agentPhone=' + ag_phone_value); --%>
<!--  		</script>  -->
<%-- <iframe src="${basePath}/sz_crm/ztth_wincall.jsp#ag_num=8888&agentPhone='15909346841'" width="100%" height="100%"></iframe> --%>
		
	</div>
	<script type="text/javascript">
	$(function(){
		$('#crmstaffList').datagrid("hideColumn", "mobile");
	});
	//查询按钮
	$('#search').click(function(sort,order){
 		$('#crmstaffList').datagrid({
			queryParams: {
				minAmount:$('#searchInvestAmountS').val(),
				maxAmount:$('#searchInvestAmountE').val(),
				dateStart:$('#searchRegStartDate').combobox('getValue'),
				dateEnd:$('#searchRegEndDate').combobox('getValue'),
				advanceDate:$('#searchAdvanceDate').combobox('getValue'),
				mobilePhone:$('#searchRegMobilephone').val(),
				userName:$('#searchRegRealname').val(),
				referrerName:$('#searchDrProductInvestRecomRealName').val(),
				isInvest:$('#isInvest').combo("getValue")+"",
				isFollow:$('#isFollow').combo("getValue")+"",
				status:$('#status').combo("getValue")+"",
				referrerPhone:$('#searchDrProductInvestRecomMobilePhone').val()
			}
		}); 
	});
	
	function formatImg(val,row,index){
		var mobile = row.mobilePhone.substr(0, 3)+ '***'+ row.mobilePhone.substr(7);
		return  mobile +'<a href="#" onclick="clickPhone('+index+')"><img style="width:20px; height:20px" src="../../images/phone.png"></a>';
	}
	
	function formatRef(val,row,index){
		var mobile = row.referrerPhone;
		if(mobile!=null&&mobile!=''){
			mobile=mobile.substr(0, 3)+ '***'+ mobile.substr(7);
		}
		return  mobile;
	}
	
	function formatFollow(val,row,index){
		var val = row.followCount;
		if(val>=1){return '是';}
		else{return '否';}
	}
	
	function formatRegfrom(val,row,index){
		if(val==0){return 'pc';}
		else if(val == 1){return 'IOS';}
		else if(val == 2){return 'android';}
		else if(val == 3){return '微信';}
		else if(val == 4){return 'WAP';}
	}
	
	//重置
	$('#reset').click(function(){
		$("#staffListForm").form("reset");
		$("#crmstaffList").datagrid("load", {});
	});
	
	//沟通记录窗口
// 	function clickPhone(index){
// 		var row = $('#crmstaffList').datagrid('getSelected'); 
// 		$("#userName").text(row.userName);
// 		$("#mobilePhone").text(row.mobilePhone);
// 		$('#followList').datagrid({
// 			url: '../electric/staffList.html?mobilePhone='+row.mobilePhone
// 		});
		
// 		$("#w").window("open");
// 		$('#followList').form('load', '${pageContext.servletContext.contextPath}/background/electric/followList.html?uid=' + row.uid);
// 	}
	function clickPhone(index){
		$('#crmstaffList').datagrid('selectRow',index);// 关键在这里 
		var row = $('#crmstaffList').datagrid('getSelected'); 
		var userName =row.userName;
		var mobilePhone = row.mobile;
		var mobile = row.mobilePhone;
		$("#w").window({
			title:"沟通管理",
			width:$(this).width()*0.5,
			height:$(this).height()*0.6,
			maximizable:true,
			href:'../electric/toFollowList.html?uid=' + row.uid + '&userName='+userName+'&mobilePhone='+mobilePhone+'&mobile='+mobile,
		});
		$("#w").window("open").window("center");
	}
	
	//添加基本操作链接
	function formatOper(val,row,index){  
// 		return	'<button type="button" class="btn" id="ztth_callouter_btn" onclick="clickOutNum()"> 呼叫</button>&nbsp;&nbsp;&nbsp;';
		return '<a href="#" class="btn l-btn l-btn-small"  onclick="clickPhone('+index+')">沟通</a>&nbsp;&nbsp;&nbsp;';
	} 
</script>
</body>
</html>