<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp"%>
</head>
<body class="easyui-layout" data-options="fit : true,border : false">
<div id="customerService" style="width:100%;height:100%;overflow-y:auto">
	<div id="drMemberTable" title="用户基础信息" class="easyui-panel" style="width:99%;height:auto;padding:5px;margin-bottom:5px" data-options="collapsible:true">
		<table id="drMemberList" class="easyui-datagrid"
			style="height:100px;width:99%"
			data-options="singleSelect:true,
		    fitColumns:true, url: '',
		    method:'post',rownumbers:false, 
		    pagination:false,toolbar:'#drMemberTools'">
			<thead>
				<tr>
					<th data-options="field:'uid'" hidden="hidden"></th>
					<th data-options="field:'realName'" width="4%">用户姓名</th>
					<th data-options="field:'sex'" width="3%" formatter="formateSex">性别</th>
					<th data-options="field:'age'" width="3%">年龄</th>
					<th data-options="field:'mobilephone'" width="5%">联系方式</th>
					<th data-options="field:'bankName'" width="6%">绑卡银行</th>
					<th data-options="field:'bankNum'" width="15%">银行卡号</th>
					<th data-options="field:'idCards'" width="15%">身份证号</th>
					<th data-options="field:'level'" width="4%" formatter="formaterVIP">用户等级</th>	    
					<th data-options="field:'bidAmountCount'"  styler="styleColor" width="7%">累计投资金额</th>
					<th data-options="field:'balance'"  styler="styleColor" width="7%">可用余额</th>
					<th data-options="field:'onOff'" width="4%" formatter="formatOnOff">自动投标</th>
					<th data-options="field:'toFrom'" width="5%">注册渠道</th>
					<th data-options="field:'regDate'" formatter="formatDateBoxFull" width="7%">注册时间</th>
					<th data-options="field:'lastLoginTime'" formatter="formatDateBoxFull" width="7%">最后登录时间</th>
					<th data-options="field:'firstInvest'" formatter="formatDateBoxFull" width="7%">首投时间</th>
					<th data-options="field:'lastInvest'" formatter="formatDateBoxFull" width="7%">末投时间</th>
					<th data-options="field:'_operate',width:80,align:'center',formatter:formatOper" width="30%">基本操作</th>
				</tr>
			</thead>   
		</table>
		<div id="drMemberTools" style="padding:5px;height:20px">
			<form id="incrRestForm">
				<input id="searchType" name="type" value="2" hidden="hidden" /> 
				客户电话：<input class="easyui-numberbox" id="searchMobilephone" name="mobilephone" style="width:150px" data-options="required:true,validType:'maxLength[11]'"/>
				<a id="searchMemberBtn" href="#" class="easyui-linkbutton" iconCls="icon-search">查询</a>
			</form>
		</div>
	</div>
	
	<div id="investTable" title="用户投资产品" class="easyui-panel" style="width:99%;height:auto;padding:5px;margin-bottom: 5px" data-options="collapsible:true">
		<table id="productInvestList" class="easyui-datagrid"
			style="height:160px;width:99%"
			data-options="singleSelect:true,fitColumns:true, url: '',
		    method:'post',rownumbers:true, pagination:true">
			<thead>
				<tr>
					<th data-options="field:'investTime'" formatter="formatDateBoxFull" width="12%">投资时间</th>
					<th data-options="field:'amount'"  styler="styleColor" width="8%">投资金额</th>
					<th data-options="field:'factAmount'"  styler="styleColor" width="8%">生效金额</th>
					<th data-options="field:'factInterest'" width="6%">预计利息</th>
					<th data-options="field:'fullName'" formatter="formatFullName" width="12%">产品名称</th>
					<th data-options="field:'rate'" width="7%">预期年化(%)</th>
					<th data-options="field:'deadline'" width="7%">产品周期(天)</th>
					<th data-options="field:'establish'" width="10%" formatter="formatDate">产品成立日期</th>
					<th data-options="field:'expireDate'" width="10%" formatter="formatDate">产品到期日期</th>
					<th data-options="field:'productAmount'" styler="styleColor"  width="8%">产品总额</th>
					<th data-options="field:'methodName'" width="5%">投资类型</th>					
					<th data-options="field:'joinTypeName'" width="5%">加入方式</th>
				</tr>
			</thead>
		</table>
	</div>
	
	<div id="favourableTable" title="用户优惠券" class="easyui-panel" style="width:99%;height:auto;padding:5px;margin-bottom:5px" data-options="collapsible:true">
		<table id="favourableList" class="easyui-datagrid"
			style="height:160px;width:99%"
			data-options="singleSelect:true,
		    fitColumns:true, url: '',
		    method:'post',rownumbers:true, 
		    pagination:true">
			<thead>
				<tr>
					<th data-options="field:'name'" width="10%">优惠券名称</th>
					<th data-options="field:'type'" formatter="formatType" width="10%">优惠券类型</th>
					<th data-options="field:'amount'" width="10%">优惠券金额</th>
					<th data-options="field:'expireDate'" formatter="formatDate" width="10%">过期日期</th>
					<th data-options="field:'status'" formatter=formatStatus width="8%">状态</th>
					<th data-options="field:'enableAmount'" formatter="formatCondition" width="25%">使用条件</th>
					<th data-options="field:'remark'"  width="10%">优惠券详解</th>
					<th data-options="field:'userName'"  width="10%">发放人</th>
				</tr>
			</thead>
		</table>
	</div>
	
	<div id="friendsStatTable" title="用户好友情况" class="easyui-panel" style="width:99%;height:auto;padding:5px;margin-bottom:5px" data-options="collapsible:true">
		<table id="friendsStatList" class="easyui-datagrid"
			style="height:60px;width:99%"
			data-options="singleSelect:true,
		    fitColumns:true, url: '',
		    method:'post',rownumbers:true, 
		    pagination:false">
		    <thead>
				<tr>
					<th data-options="field:'firendTotal'" width="10%">好友数量</th>
					<th data-options="field:'investTotal'"  styler="styleColor" width="10%">好友投资额</th>
					<th data-options="field:'rewards'"  styler="styleColor" width="10%">推荐获取收益</th>
					<th data-options="field:'ticketTotal'" width="10%">推荐好友获取优惠券</th>
				</tr>
			</thead>
		</table>
	</div>
	
	<div id="memberFundsLogTable" title="用户资金记录" class="easyui-panel" style="width:99%;height:auto;padding:5px;margin-bottom:5px" data-options="collapsible:true">
		<table id="memberFundsRecordList" class="easyui-datagrid"
			style="height:200px;width:99%"
			data-options="singleSelect:true,
		    fitColumns:true, url: '',
		    method:'post',rownumbers:true, 
		    pagination:true">
			<thead>
				<tr>
					<th data-options="field:'id'" width="10%">记录号</th>
					<th data-options="field:'typeName'" width="10%">收支类别</th>
					<th data-options="field:'tradeTypeName'" width="10%">交易类别</th>
					<th data-options="field:'amount'"  styler="styleColor" width="15%">涉及金额</th>
					<th data-options="field:'balance'"  styler="styleColor" width="10%">操作后资金余额</th>
					<th data-options="field:'addTime'" formatter="formatDateBoxFull" width="15%">操作时间</th>
					<th data-options="field:'statusName'"  width="10%">操作状态</th>
				</tr>
			</thead>
		</table>
	</div>
	
	<div id="updateActivityWindow" class="easyui-window"
		data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:false,maximizable:false"
		style="width:850px;height:400px;padding:10px;">
	</div>
</div>

<div id="queryDrMemberAutoInvestDialog" class="easyui-dialog" title="自动投标配置"
	data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:true,maximizable:false,buttons:'#queryDrMemberAutoInvestDialogBtn'" style="width:300px;height:200px;padding:5px;">
	<table align="center">
		<tr>
			<td align="left">自投标期：</td>
			<td>
				<input id="drMemberAutoInvestDeadline" type="text" class="easyui-textbox" disabled="disabled"/>
			</td>
		</tr>
		<tr>
			<td align="left">自投金额：</td>
			<td colspan="3">
				<input id="drMemberAutoInvestAmount" type="text" class="easyui-numberbox" disabled="disabled"/>
			</td>
		</tr>
		<tr>
			<td align="left">保留余额：</td>
			<td colspan="3">
				<input id="drMemberAutoInvestBalance" type="text" class="easyui-numberbox" disabled="disabled"/>
			</td>
		</tr>
		<tr>
			<td align="left">使用优惠券：</td>
			<td colspan="3">
				<input id="drMemberAutoInvestUseCoupon" type="text" class="easyui-textbox" disabled="disabled"/>
			</td>
		</tr>
	</table>
	<div id="queryDrMemberAutoInvestDialogBtn">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeQueryDrMemberAutoInvestDialog()">关闭</a>
	</div>
</div>

<div id="queryTemporaryCashDialog" class="easyui-dialog" title="发放临时返现红包"
	data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:true,maximizable:false,buttons:'#queryTemporaryCashDialogBtn'" style="width:300px;height:200px;padding:5px;">
	<form id="addTemporaryCashForm">
	<input type="hidden" id="drMemberFavourableUid"  name="uid"/>
	<table align="center">
		<tr>
			<td align="left">产品期限：</td>
			<td>
				<input id="temporaryCashProductDeadline" name="productDeadline" type="text" class="easyui-numberbox" data-options="required:true,min:0"/>
			</td>
		</tr>
		<tr>
			<td align="left">投资金额：</td>
			<td>
				<input id="temporaryCashProductEnableAmount" name="enableAmount" type="text" class="easyui-numberbox" data-options="required:true,min:0"/>
			</td>
		</tr>
		<tr>
			<td align="left">返现金额：</td>
			<td colspan="3">
				<input id="temporaryCashProductAmount" name="amount" type="text" class="easyui-numberbox" data-options="required:true,min:0,
				validType:'temporaryCashAmount[temporaryCashProductDeadline,temporaryCashProductEnableAmount]'"/>
			</td>
		</tr>
	</table>
	</form>
	<div id="queryTemporaryCashDialogBtn">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="addTemporaryCash()">发放</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeTemporaryCash()">关闭</a>
	</div>
</div>
<script type="text/javascript">
	//查询按钮
	$('#searchMemberBtn').click(function(){
		var mobilephone = $('#searchMobilephone').val();
		if(mobilephone==null || mobilephone ==''){
			$.messager.alert("提示信息","请输入用户手机号码");
			return false;
		}else{
			var length = mobilephone.length;
			if(length!=11){
				$.messager.alert("提示信息","请输入精确手机号码");
				return false;
			}
		}
 		$('#drMemberList').datagrid({
 			url:'../member/qeuryMemberList.do',
			queryParams: {
				mobilephone: mobilephone,
			}
		});
		$('#productInvestList').datagrid({
			url:'../member/productInvestList.do?mobilephone='+mobilephone
		});
		
		$('#favourableList').datagrid({
			url:'../member/favourableList.do?mobilephone='+mobilephone
		});
		
		$('#friendsStatList').datagrid({
			url:'../member/recommendInfoList.do?mobilephone='+mobilephone
		});
		
		$('#memberFundsRecordList').datagrid({
			url:'../member/memberFundsRecordList.do?mobilephone='+mobilephone
		});
	});
	
	function ref(){
		$('#favourableList').datagrid({
				url:'../member/favourableList.do?mobilephone='+mobilephone
			});
	}
	
	function formatDate(value) {  
    if (value == null || value == '') {  
        return '';  
    }  
    var dt = parseToDate(value);  
    return dt.format("yyyy-MM-dd");  
} 
	
	function validata(str){
		var checkboxes = document.getElementsByName(str);
		for(var i=0;i<checkboxes.length;i++){
			if(checkboxes[i].checked){
     			return true;
     		}
		}
		return false;
	}
	
	function formateSex(value,row,index){
		if(value==1){
			return '先生';
		}else if(value==2){
			return '女士';
		}else{
			return '';
		}
		
	}
	
	function formatType(value,row,index){
		if(value==1){
			return '红包';
		}else if(value==2){
			return '加息券';
		}else if(value==3){
			return '体验金';
		}else if(value ==4){
			return '翻倍券';
		}else{
			return '';
		}
	}
	
	function formatCondition(value,row,index){
		return '投资额'+value+'元以上且产品期限大于等于'+row.productDeadline+'天可用';
	}
	
	
	//添加基本操作链接
	function formatOper(val,row,index){  
	    	return '<a href="#" class="btn l-btn l-btn-small" onclick="giveTemporary('+index+')">发放临时红包</a>'+"  "+
	    	'<a href="#" class="btn l-btn l-btn-small" onclick="giveOut('+index+',1)">发放红包</a>'+"  "+
	    	'<a href="#" class="btn l-btn l-btn-small" onclick="giveOut('+index+',2)">发放加息券</a>'+"  "+
	    	'<a href="#" class="btn l-btn l-btn-small" onclick="giveOut('+index+',4)">发放翻倍券</a>';  
	} 
	//跳转到发放页面
	function giveOut(index,type){
		$('#drMemberList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drMemberList').datagrid('getSelected'); 
		$("#updateActivityWindow").window({
			title:"发放页面",
			href:"../member/giveOut.do?uid="+row.uid+"&type="+type
		});
		$("#updateActivityWindow").window("open");
	}
	
	//打开临时红包发放Dialog
	function giveTemporary(index,type){
		$('#drMemberList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drMemberList').datagrid('getSelected'); 
	    $("#drMemberFavourableUid").val(row.uid);
	    $("#addTemporaryCashForm").form("reset");
		$("#queryTemporaryCashDialog").dialog("open");
	}
	
	//发送临时返现红包
	function addTemporaryCash(){  
		var validate = $("#addTemporaryCashForm").form("validate");
		if(!validate){
			return false;
		}
   		$.ajax({
          	url: "${apppath}/caseRule/addTemporaryCash.do",
            type: 'POST',
            data:$("#addTemporaryCashForm").serialize(),  
            success:function(result){
				if(result.success){
					$.messager.alert("提示信息",result.msg);
					$("#drMemberList").datagrid("reload");
					$("#queryTemporaryCashDialog").dialog("close");
				}else{
					$.messager.alert("提示信息",result.errorMsg);
				}
			}
        });
	}
	
	var data = null;
 	$('#temporaryCashProductAmount').numberbox({
	 	missingMessage:function(){
					$.ajax({
						type : "POST",
						async : false,
						url : "../caseRule/validatorTemporaryCashAmount.do",
						dataType : "json",
						data : {
							"deadline" : $("#temporaryCashProductDeadline").numberbox('getValue'),
							"amount" : $("#temporaryCashProductEnableAmount").numberbox('getValue')
						},
						success : function(result) {
							if(result.success){
								if( result.map.drCashRule == null){
									data = "没有可用规则！";
								}else{
									if(result.map.drCashRule.redAmount == null){
										data = "该输入项为必填项";
									}else{
										data = "最大返现金额("+result.map.drCashRule.redAmount+"元)！";
									}
								}
							}
						}
					});
					return data;
	 			}
	})
	
	//修改显示状态信息
	function formatStatus(value,row,index){
		if(row.status=="0"){
			return '生效中';
		}else if(row.status=="1"){
			return '使用中';
		}else{
			return '已失效';
		}
	}
	
	function formatStatus(value,rec,index){
		if(value==0){
			return '有效';
		}else if(value==1){
			return '已使用';
		}else if(value==2){
			return '已过期';
		}
	}
	
	//是否是VIP
	function formaterVIP(value,row,index){
		if(row.level == "1"){
			return 'VIP';
		}else{
			return '普通用户';
		}
	}
	
	function formatAmount(value,rec,index){
		if(value==0||value==null)
			return '0.00';
		else
			return (value.toFixed(2) + '').replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g, '$&,');
	}
	function formatRaisedRates(value,rec,index){
		if(value==0||value==null)
			return '0.00';
		else
			return (value + '%');
	}
	function formatRedEnvelopeType(value,row,index){
		if(row.redEnvelopeType =="0"){
			return '抵用券';
		}else if(row.redEnvelopeType=="1"){
			return '返现券';
		}else{
			return '其他';
		}
	}
	
	function formatFullName(value,row,index){
		return '<a href="#" onclick="toShowProductInfoBtn('+index+')">'+row.fullName+'</a>';
	}
	
	//跳转到产品显示页面
	function toShowProductInfoBtn(index){
		$('#productInvestList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#productInvestList').datagrid('getSelected'); 
		var mainTab = parent.$('#main-center');
		var detailTab = {
				title : "产品显示",
				content:"<iframe width='100%' height='100%' frameborder='0' src='${apppath}/product/toShowDrProductInfo.do?id="+row.pid+"'></iframe>",
				closable : true
		};
		mainTab.tabs("add",detailTab);
	}
	
	
	//状态  0=无，1=查看
	function formatOnOff(value,row,index){
		if(row.onOff == "1"){
			return '<a href="#" onclick="queryDrMemberAutoInvestBtn('+index+')">查看</a>';
		}else{
			return '无';
		}
	}
	
	//打开查看用户自投配置dialog
	function queryDrMemberAutoInvestBtn(index){
		$('#drMemberList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drMemberList').datagrid('getSelected'); 
		var url = "${apppath}/member/queryDrMemberAutoInvest.do?uid="+row.uid;
		$.ajax({
			url: url,
			dataType:"json",
			success:function(result){
				$("#drMemberAutoInvestDeadline").textbox('setValue',result.map.drMemberAutoInvestConf.deadline);
				$("#drMemberAutoInvestAmount").numberbox('setValue',result.map.drMemberAutoInvestConf.amount);
				$("#drMemberAutoInvestBalance").numberbox('setValue',result.map.drMemberAutoInvestConf.balance);
				$("#drMemberAutoInvestUseCoupon").textbox('setValue',result.map.drMemberAutoInvestConf.useCouponName);
				$("#queryDrMemberAutoInvestDialog").dialog("open");
			}
	  	});
	}
	//关闭Dialog
	function closeQueryDrMemberAutoInvestDialog(){  
		$("#drMemberList").datagrid("reload");
		$("#queryDrMemberAutoInvestDialog").dialog("close");
	}
	
	//关闭Dialog
	function closeTemporaryCash(){  
		$("#drMemberList").datagrid("reload");
		$("#queryTemporaryCashDialog").dialog("close");
	}
</script>
</body>
</html>