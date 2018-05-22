<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp"%>
</head>
<body>
	<table id="redEnvelopeList" title="${type==1?'红包发放':type==2?'加息券发放':'翻倍券发放' }" class="easyui-datagrid"
		style="height:99%;width:99.9%"
		data-options="singleSelect:true,
	    fitColumns:true, url: '../member/giveOutInfo.do?type=${type }',
	    method:'post',rownumbers:true, 
	    pagination:true">
		<thead>
			<c:if test="${type == 1 }"><!-- 红包 -->
				<tr>
					<th data-options="field:'id'" hidden="hidden">红包ID</th>
					<th data-options="field:'code'">红包编号</th>
					<th data-options="field:'name'">红包名称</th>
					<th data-options="field:'amount'" formatter="formatAmount">红包金额</th>
					<th data-options="field:'enableAmount'" formatter="formatAmount">启用金额</th>
					<th data-options="field:'deadline'">有效期(天)</th>
					<th data-options="field:'productDeadline'">产品效期(天)</th>
					<th data-options="field:'grantQty'">发放数量</th>
					<th data-options="field:'surplusQty'">剩余数量</th>
					<th data-options="field:'_operate',width:80,align:'center',formatter:formatOper">基本操作</th>
				</tr>
			</c:if>
			
			<c:if test="${type == 2 }"><!-- 加息 -->
				<tr>
					<th data-options="field:'id'" hidden="hidden">ID</th>
					<th data-options="field:'code'">加息券编号</th>
					<th data-options="field:'name'">加息券名称</th>
					<th data-options="field:'raisedRates'" formatter="formatAmount">加息额度</th>
					<th data-options="field:'enableAmount'" formatter="formatAmount">启用金额</th>
					<th data-options="field:'deadline'">有效期(天)</th>
					<th data-options="field:'productDeadline'">产品效期(天)</th>
					<th data-options="field:'grantQty'">发放数量</th>
					<th data-options="field:'surplusQty'">剩余数量</th>
					<th data-options="field:'_operate',width:80,align:'center',formatter:formatOper">基本操作</th>
				</tr>
			</c:if>
			
			<c:if test="${type == 4 }"><!-- 翻倍-->
				<tr>
					<th data-options="field:'id'" hidden="hidden">ID</th>
					<th data-options="field:'code'">翻倍券编号</th>
					<th data-options="field:'name'">翻倍券名称</th>
					<th data-options="field:'multiple'" formatter="formatAmount">翻倍倍数</th>
					<th data-options="field:'enableAmount'" formatter="formatAmount">启用金额</th>
					<th data-options="field:'deadline'">有效期(天)</th>
					<th data-options="field:'productDeadline'">产品效期(天)</th>
					<th data-options="field:'grantQty'">发放数量</th>
					<th data-options="field:'surplusQty'">剩余数量</th>
					<th data-options="field:'_operate',width:80,align:'center',formatter:formatOper">基本操作</th>
				</tr>
			</c:if>
		</thead>
	</table>
	<script type="text/javascript">


	//添加基本操作链接
	function formatOper(val,row,index){  
		var status;
		if(2 != row.status && row.surplusQty>0){
			return '<a href="#" class="btn l-btn l-btn-small" onclick="selectActivityWindow('+index+',${uid})">选中发放</a>';  
		}
    	
	} 
	function selectActivityWindow(index,uid){
		$('#redEnvelopeList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#redEnvelopeList').datagrid('getSelected'); 
		$.ajax({
         	url: "${apppath}/member/selectActivity.do",
           	type: 'POST',
           	data:{"id":row.id,"uid":'${uid}'},  
           	success:function(result){
				if(result.success){
					$.messager.alert("提示信息",result.msg);
					$("#redEnvelopeList").datagrid("reload");
					$("#addRedEnvelopeDialog").dialog("close");
					window.parent.ref();
				}else{
					$.messager.alert("提示信息",result.errorMsg);
				}
			}	
       	});
	
	}
	
		
	function formatAmount(value,rec,index){
		if(value==0||value==null)
			return '0.00';
		else
			return (value.toFixed(2) + '').replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g, '$&,');
	}
	

	//修改显示生效时间
	function formatEffectiveTime(val,row,index){
		var startDate;
		var endDate;
		if(row.startTime!=''&&row.startTime!=null){
			startDate = new Date(row.startTime);  
		}
		if(row.endTime!=''&&row.endTime!=null){
			endDate =new Date(row.endTime); 
		} 
		return startDate.format("yyyy-MM-dd hh:mm:ss")+'-'+endDate.format("yyyy-MM-dd hh:mm:ss");
	}
	
	function formatDate(value,row,index){
		if(value!=''&&value!=null){
			var unixTimestamp = new Date(value);  
			return unixTimestamp.toLocaleString();
		}else{
			return '';
		}
	}
	
	//格式化日期
	Date.prototype.format = function (format) {  
	    var o = {  
	        "M+": this.getMonth() + 1, // month  
	        "d+": this.getDate(), // day  
	        "h+": this.getHours(), // hour  
	        "m+": this.getMinutes(), // minute  
	        "s+": this.getSeconds(), // second  
	        "q+": Math.floor((this.getMonth() + 3) / 3), // quarter  
	        "S": this.getMilliseconds()  
	        // millisecond  
	    }  
	    if (/(y+)/.test(format))  
	        format = format.replace(RegExp.$1, (this.getFullYear() + "")  
	            .substr(4 - RegExp.$1.length));  
	    for (var k in o)  
	        if (new RegExp("(" + k + ")").test(format))  
	            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));  
	    return format;  
	} 
</script>
</body>
</html>