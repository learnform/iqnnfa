<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="drProductInfoList" 
	class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:true,
	    fitColumns:true, url: '../subject/showProductListForSub.do?sid='+${sid},
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#drProductInfoTools'">
		<thead>
	    <tr>
	    	<th data-options="field:'id'" hidden="true">序号</th>
	    	<th data-options="field:'isSid'" hidden="true"></th>	    	
	    	<th data-options="field:'renewal'" hidden="true">判断是否续发</th>	
	    	<th data-options="field:'bespoke'" hidden="true">取消预约</th>		    	
	    	<th data-options="field:'code'" width="10%">产品编号</th>
	        <th data-options="field:'simpleName'" width="10%">产品名称</th>
	       	<th data-options="field:'rate'" width="4%">产品利率</th>
	       	<th data-options="field:'deadline'" width="5%">期限(天)</th>
	       	<th data-options="field:'subSubplusDays'" width="6%">债权剩余天数(天)</th>
	        <th data-options="field:'amount'" width="7%" styler="styleColor" formatter="formatAmount">产品金额(元)</th>
	       	<th data-options="field:'alreadyRaiseAmount'" width="9%" styler="styleColor" formatter="formatAmount">已募集金额(元)</th>
	        <th data-options="field:'statusName'" width="3%">产品状态</th>
	        <th data-options="field:'status'" hidden="true">状态</th>
	        <th data-options="field:'isShowName'" formatter="formatOperIsShow">是否显示</th>
	        <th data-options="field:'isShow'" hidden="true">是否显示</th>
	        <th data-options="field:'isHot'" formatter="formaterOperisHot">是否热推</th>
	        <th data-options="field:'fid'" formatter="formaterOperisSecondaryProducts">是否续发</th>
	       	<th data-options="field:'startDate'" width="8%" formatter="formatDateBoxFull">上架日期</th>
	       	<th data-options="field:'fullDate'" width="8%" formatter="formatDateBoxFull">满标时间</th>
	        <th data-options="field:'surplusDay'" width="6%">剩余到期天数(天)</th>
	        <th data-options="field:'establish'" width="6%"  styler="styleColor" formatter="remainRaise" >募集剩余天数</th>
			
			<th data-options="field:'_operate',align:'center'" width="10%" formatter="formatOper">基本操作</th>
	    </tr>
	    </thead>
	</table>
	<div id="drProductInfoTools" style="padding:5px;height:750">
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
	        <input id="searchDrProductInfoSid" name="sid"  class="easyui-textbox" value="${sid}"  type="hidden"/>
	    	<a id="searchDrProductInfo" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	    	<a id="resetDrProductInfo" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
	    	<a id="exportDrProductInfo" href="javascript:exportDrProductInfo();" class="easyui-linkbutton" iconCls="icon-redo">导出</a>
	    </form>
	</div>
	
<script type="text/javascript">

	//重置按钮
	$('#resetDrProductInfo').click(function(){
		$("#drProductInfoForm").form("reset");
		$("#drProductInfoList").datagrid("load", {});
	});
	
	//查询按钮
	$('#searchDrProductInfo').click(function(){
 		$('#drProductInfoList').datagrid({
			queryParams: {
				sid: $('#searchDrProductInfoSid').val(),
				code: $('#searchDrProductInfoCode').val(),
				simpleName: $('#searchDrProductInfoSimpleName').val(),
				deadline: $('#searchDrProductInfoDeadline').val(),
				surplusDay: $('#searchDrProductInfoSurplusDay').val(),
				status: $('#searchDrProductInfoStatus').combobox('getValue'),
			}
		}); 
	});
	
	//添加基本操作链接
	function formatOper(val,row,index){  
		return '<a href="#" class="btn l-btn l-btn-small" onclick="toShowProductInfoBtn('+index+')">查看</a>';
	} 
	
	
	//跳转到产品显示页面
	function toShowProductInfoBtn(index){
		$('#drProductInfoList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drProductInfoList').datagrid('getSelected'); 
		var mainTab = parent.$('#main-center');
		var detailTab = {
				title : "产品显示",
				content:"<iframe width='100%' height='100%' frameborder='0' src='${apppath}/product/toShowDrProductInfo.do?id="+row.id+"'></iframe>",
				closable : true
		};
		mainTab.tabs("add",detailTab);
	}
	
	//更改是否热推
	function updateDrProductIsHotBtn(index){
		$('#drProductInfoList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drProductInfoList').datagrid('getSelected'); 
		$.messager.confirm('操作提示', '你确定更改吗？', function(r){
			if(r){
				var url = "../product/updateDrProductIsHot.do?id="+row.id+"&isHot="+row.isHot;
				$.ajax({
					url: url,
					dataType:"json",
					success:function(){
						$('#drProductInfoList').datagrid('reload');
						$.messager.alert("操作提示", "操作成功");
					}
			  	});
			}
		});
	}
	
	var j = 0;
	
	//添加状态链接
	function formatOperIsShow(value,row,index){
		if(row.isShow == "1"){
			return '<a href="#" onclick="updateDrProductIsShowBtn('+index+')">是</a>';
		}else{
			return '<a href="#" onclick="updateDrProductIsShowBtn('+index+')">否</a>';
		}
	}
	//添加热推状态
	function formaterOperisHot(value,row,index){
		if(row.isHot == "1"){
			return '<a href="#" onclick="updateDrProductIsHotBtn('+index+')">是</a>';
		}else{
			return '<a href="#" onclick="updateDrProductIsHotBtn('+index+')">否</a>';
		}
	}
	
	//是否是续发产品
	function formaterOperisSecondaryProducts(value,row,index){
		if(row.fid==null || row.fid=='undefined'){
			return '否';
		}else{
			return '是';
		}
	}
	
	//显示剩余募集时间
	
	function remainRaise(value,row,index){
		var returnStr="";
		
		if(row.establish != null && row.establish != 'undefined'){
			var date3 = row.establish - Date.parse(new Date());
	          var day = Math.floor(date3/(24*3600*1000));
	          var hh= Math.floor(date3/(3600*1000));
	          //alert(date3);
	          if(day > 0){
	        	  returnStr = day+'天';
	          }else{
	        	  if(day == 0&& hh > 1){
	            	  returnStr = hh+'小时';
	              }else{
	            	 if(hh < 0){
	            		  returnStr = '已结束';
            		}else if(hh <= 1){
            			returnStr = '1小时内';
            		}
	              }
	          } 
		}
        return returnStr;
	}
	
	//导出
	function exportDrProductInfo(){
		window.location.href="../product/exportDrProductInfo.do?code="+$('#searchDrProductInfoCode').val()+
						"&sid="+$('#searchDrProductInfoSid').val()+
						"&simpleName="+encodeURIComponent(encodeURIComponent($('#searchDrProductInfoSimpleName').val()))+
						"&status="+$('#searchDrProductInfoStatus').combobox('getValue');
	}
	
	
	//获取当前时间
	function getNowFormatDate() {
	    var date = new Date();
	    var seperator1 = "-";
	    var seperator2 = ":";
	    var year = date.getFullYear();
	    var month = date.getMonth() + 1;
	    var strDate = date.getDate();
	    if (month >= 1 && month <= 9) {
	        month = "0" + month;
	    }
	    if (strDate >= 0 && strDate <= 9) {
	        strDate = "0" + strDate;
	    }
	    var currentdate = year + seperator1 + month + seperator1 + strDate
	            + " " + date.getHours() + seperator2 + date.getMinutes()
	            + seperator2 + date.getSeconds();
	    return currentdate;
	}
</script>
</body>
</html>

