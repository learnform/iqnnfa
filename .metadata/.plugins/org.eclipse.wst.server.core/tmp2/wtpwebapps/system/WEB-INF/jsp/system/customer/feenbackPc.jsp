<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/common/jquery.form.js"></script>
</head>
<body>
	<table id="toPcFeedback" title="广告列表 " 
	class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:true,
	    fitColumns:true, url: '../feedBack/getPcFeedbackList.do',
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#sysFeedbackUserTools',onLoadSuccess:ysFeedbackBtn">
	    
	    <thead>
	    <tr>
	    	<th data-options="field:'id'" hidden="hidden">ID</th>
	        <th data-options="field:'content'" width="10%">姓名</th>
	       	<th data-options="field:'contactInformation'" width="10%">手机号码</th>	     
	       	<th data-options="field:'feedbackTime'" width="15%" formatter="formatDateBoxFull">预留时间</th>
	       	<th data-options="field:'isReg'" width="10%" formatter="formaterOperisReg">是否注册</th>
	       	<th data-options="field:'isCrusy'" width="10%" formatter="formaterOperisCrusy">是否充值</th>
			<th data-options="field:'handleResult'" width="20%">备注</th>
			<th data-options="field:'_operate',width:80,align:'center',formatter:formatOper" width="10%">基本操作</th>
	    </tr>
	    </thead>
	</table> 
		<div id="sysFeedbackUserTools" style="padding:5px;height:750">
		<form id="sysBannerForm">
	  		日期:<input id="searchClaimsLoanStartDate" name="feedbackTime" class="easyui-datebox" style="width:150px"/>
	  		是否注册: <select  id="searchSysBannerStatus" name="isReg" style="width:100px;" class="easyui-combobox">
				 	<option value=''>全部</option>
					<c:forEach var="map" items="${whether}">
						<option value='${map.key}'>${map.value}</option>
			        </c:forEach>
	           		</select>
			是否充值: <select  id="searchSysBannerCode" name="isCrusy" style="width:100px;" class="easyui-combobox">
				 	<option value=''>全部</option>
					<c:forEach var="map" items="${whether}">
						<option value='${map.key}'>${map.value}</option>
			        </c:forEach>
	           		</select>
	          <a id="searchysFeedbackBtn" href="#" class="easyui-linkbutton" iconCls="icon-search">查询</a>      
	    </form>
	    <div id="updateysFeedbackWindow" class="easyui-window"
		data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:false,maximizable:false" style="width:450px;height:350px;padding:10px;">
	</div>
	</div>

	
<script type="text/javascript">

	//是否注册
	function formaterOperisReg(value,row,index){
		if(row.isReg == "1"){
			return '已注册';
		}else if(row.isReg == "0"){
			return '未注册';
		}else{
			return '未注册';
		}
	}
	//是否充值
	function formaterOperisCrusy(value,row,index){
		if(row.isCrusy == "1"){
			return '已充值';
		}else if(row.isCrusy == "0"){
			return '未充值';
		}else{
			return '未充值';
		}
	}
function formatDate(value,row,index){
		if(value!=''&&value!=null){
			var unixTimestamp = new Date(value);  
			return unixTimestamp.toLocaleString();
		}else{
			return '';
		}
	}

	function ysFeedbackBtn (){
			$('.ysFeedbackBtn').linkbutton();
	}

	//重置按钮
	$('#resetSysBannerBtn').click(function(){
		$("#sysBannerForm").form("reset");
		$("#getPcFeedbackList").datagrid("load", {});
	});
	
	//查询按钮
	$('#searchysFeedbackBtn').click(function(){
 		$('#toPcFeedback').datagrid({
			queryParams: {
				feedbackTime: $('#searchClaimsLoanStartDate').datebox('getValue'),
				isReg: $('#searchSysBannerStatus').combobox("getValue"),
				isCrusy: $('#searchSysBannerCode').combobox("getValue"),
			}
		}); 
	});
	
	//添加基本操作链接
	function formatOper(val,row,index){ 
		var articleOper="";
		if(row.status==0){
			articleOper += '<a href="#" class="ysFeedbackBtn" onclick="updateysFeedbackWindow('+index+')">添加备注</a>'+' ';
		}
		if(row.status==1){
			articleOper += '<a href="#" class="ysFeedbackBtn" onclick="updateysFeedbackWindow('+index+')">查看备注</a>'+' ';
		}
		return articleOper;
	} 	
	
	//跳转广告修改页面
	//../feedBack/getPcFeedbackList.do
 	function updateysFeedbackWindow(index){
 		$('#toPcFeedback').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#toPcFeedback').datagrid('getSelected'); 
		$("#updateysFeedbackWindow").window({
			title:"处理广告信息",
			href:"../feedBack/selectPcByFeedbackKey.do?id="+row.id,
			
		});
		$("#updateysFeedbackWindow").window("open");
	} 

	
	
	function deleteSysBanner(index) {
		$('#sysBannerList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#sysBannerList').datagrid('getSelected'); 
        $.messager.confirm('操作提示', '确定要删除吗?', function(r){
        	if(r){
	            $.ajax({
	            	url: "${apppath}/banner/deleteSysBanner.do?id="+row.id,
	                type: 'POST',
	               success:function(result){
						if(result.success){
							$.messager.alert("提示信息",result.msg);
							$("#sysBannerList").datagrid("reload");
						}else{
							$.messager.alert("提示信息",result.errorMsg);
						}
					}
	            });
            }
        });
 	}
 	
 	function recoverSysBanner(index) {
 		$('#sysBannerList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#sysBannerList').datagrid('getSelected'); 
		$.ajax({
	       	url: "${apppath}/banner/recoverSysBanner.do?id="+row.id,
	        type: 'POST',
	        success:function(result){
				if(result.success){
					$.messager.alert("提示信息",result.msg);
					$("#sysBannerList").datagrid("reload");
				}else{
					$.messager.alert("提示信息",result.errorMsg);
				}
			}
       });
 	}
	
</script>
</body>
</html>

