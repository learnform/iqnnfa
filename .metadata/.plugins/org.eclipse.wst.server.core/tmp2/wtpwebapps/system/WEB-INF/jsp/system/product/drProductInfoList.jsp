﻿ <%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
</head>
<body>
	<table id="drProductInfoList" title="产品列表"
	class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:true,
	    fitColumns:true, url: '../product/drProductInfoList.do',
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#drProductInfoTools'">
		 <thead>
	    <tr>
	    	<th data-options="field:'id'" hidden="true">序号</th>
	    	<th data-options="field:'isSid'" hidden="true"></th>	    	
	    	<th data-options="field:'renewal'" hidden="true">判断是否续发</th>	
	    	<th data-options="field:'bespoke'" hidden="true">取消预约</th>		    	
	    	<th data-options="field:'code'" hidden="true"> 产品编号</th>
	        <th data-options="field:'simpleName'" width="10%">产品名称</th>
	       	<th data-options="field:'rate'" width="4%">产品利率</th>
	       	<th data-options="field:'deadline'" width="5%">期限(天)</th>
	       	<th data-options="field:'subSubplusDays'" width="6%">债权剩余天数(天)</th>
	        <th data-options="field:'amount'" width="7%" styler="styleColor" formatter="formatAmount">产品金额(元)</th>
	       	<th data-options="field:'alreadyRaiseAmount'" width="6%" styler="styleColor" formatter="formatAmount">已募集金额(元)</th>
			<th data-options="field:'investCount',formatter:formatOperCount"  width="6%">投资记录</th>
	        <th data-options="field:'statusName'" width="3%">产品状态</th>
	        <th data-options="field:'status'" hidden="true">状态</th>
	        <th data-options="field:'type'" hidden="false">产品类型</th>
	        <th data-options="field:'isShowName'" formatter="formatOperIsShow">是否显示</th>
	        <th data-options="field:'isShow'" hidden="true">是否显示</th>
	        <th data-options="field:'isHot'" formatter="formaterOperisHot">是否热推</th>
	        <th data-options="field:'isAuto'" formatter="formaterOperisAuto">是否自动上架</th>
			<th data-options="field:'autoNum'">自动上架序号</th>
	        <th data-options="field:'fid'" formatter="formaterOperisSecondaryProducts">是否续发</th>
	       	<th data-options="field:'startDate'" width="5%" formatter="formatDateBoxFull">上架日期</th>
	       	<th data-options="field:'fullDate'" width="8%" formatter="formatDateBoxFull">满标时间</th>
	        <th data-options="field:'surplusDay'" width="6%">剩余到期天数(天)</th>
	        <th data-options="field:'establish'" width="6%"  styler="styleColor" formatter="remainRaise" >募集剩余天数</th>
			<th data-options="field:'_operate',align:'center'" width="10%" formatter="formatOper">基本操作</th>
	    </tr>
	    </thead>
	</table>
	<div id="drProductInfoTools" style="padding:5px;height:750">
	  	<form id="drProductInfoForm">
	  		产品简称:<input id="searchDrProductInfoSimpleName" name="simpleName" class="easyui-textbox"  size="15" style="width:200px"/>
	  		产品期限:<input id="searchDrProductInfoDeadline" name="deadline" class="easyui-textbox" style="width:50px;"/>
	  		剩余到期天数:<input id="searchDrProductInfoSurplusDay" name="surplusDay" class="easyui-textbox" style="width:50px;"/>
	  		产品类型: <select  id="searchDrProductInfoType" name="type" style="width:100px;" class="easyui-combobox">
						<option value=''>全部</option>
						<c:forEach items="${type}" var="map">
								 <%-- <c:if test="${map.key == 5 || map.key == 2|| map.key == 6}">  --%>
									<option value='${map.key }'>${map.value }</option>
								<%--  </c:if> --%> 
							</c:forEach> 
							
	           		</select>
	  		产品状态: <select  id="searchDrProductInfoStatus" name="status" style="width:100px;" class="easyui-combobox">
						<option value=''>全部</option>
						<c:forEach items="${status }" var="map">
							<option value='${map.key }'>${map.value }</option>
						</c:forEach>
	           		</select>
			是否自动上架：<select  id="searchDrProductInfoIsAuto" name="isAuto" style="width:100px;" class="easyui-combobox">
				<option value=''>全部</option>
				<option value='1'>是</option>
				<option value='0'>否</option>
		</select>
			满标时间：<input id="searchAutoStartDate" name="dateStart" class="easyui-datebox" style="width:100px"/>到
			<input id="searchAutoEndDate" name="dateEnd" class="easyui-datebox" style="width:100px"/>
			上架时间：<input id="searchAutoStartDate1" name="dateStart1" class="easyui-datebox" style="width:100px"/>到
			<input id="searchAutoEndDate1" name="dateEnd1" class="easyui-datebox" style="width:100px"/>
	    	<a id="searchDrProductInfo" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search">查询</a>
			<a id="resetDrProductInfo" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="addDrProductInfoBtn()">产品新增</a>	
	    	<a id="exportDrProductInfo" href="javascript:exportDrProductInfo();" class="easyui-linkbutton" iconCls="icon-redo">导出</a>
	    </form>
	</div>
	<div id="updateDrProductInfoDialog" class="easyui-dialog" title="产品修改"
		data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:true,maximizable:false,buttons:'#updateDrProductInfoBtn'" style="width:600px;height:400px;padding:5px;">
		<form id="updateDrProductInfoForm">
			<div title="产品信息" class="easyui-panel" style="width:100%;height:auto;padding:10px;margin-bottom: 10px">
				<input type="hidden" id="drProductId"  name="id"/>
				<table align="center">
					<tr>
						<td align="left">产品编号：</td>
						<td>
							<input id="drProductCode" name="code" type="text" class="easyui-textbox" disabled="disabled"/>
						</td>
		
						<td align="left">起投金额：</td>
						<td>
							<input id="drProductLeastaAmount" name="leastaAmount" type="text" class="easyui-numberbox" data-options="required:true,min:0,max:100000"/>元
						</td>
					</tr>
					<tr>
						<td align="left">产品全称：</td>
						<td>
							<input id="drProductFullName" name="fullName" type="text" class="easyui-textbox" data-options="required:true"/>
						</td>
						<td align="left">产品简称：</td>
						<td>
							<input id="drProductSimpleName" name="simpleName" type="text" class="easyui-textbox" data-options="required:true"/>
						</td>
					</tr>
					<tr>
						<td align="left">活动提示：</td>
						<td colspan="3">
							<input id="drProductAccept" name="accept" class="easyui-textbox" style="width: 415px;" data-options=""/>
						</td>
					</tr>
					<tr>
						<td align="left">pc跳转：</td>
						<td colspan="3">
							<input id="pcUrl" name="pcUrl" type="text" class="easyui-textbox" style="width:350px;"  data-options="min:0,max:50000000,precision:2"/>
						</td>
					</tr>
					<tr>
						<td align="left">移动跳转：</td>
						<td colspan="3">
							<input id="appUrl" name="appUrl" type="text" class="easyui-textbox" style="width:350px;" data-options="min:0,max:50000000,precision:2"/>
						</td>
					</tr>
					<tr>
						<td align="left">
							<input id="immediately" name="immediately" type="hidden"  />红包是否实时返现
						</td>
					</tr>
					<tr>
						<td align="left">产品介绍：</td>
						<td colspan="3">
							<input id="drProductIntroduce" name="introduce" class="easyui-textbox" style="height:120px;width: 415px;" data-options="multiline:true"/>
						</td>
					</tr>
					<tr>	
						<td align="left">借款人：</td>
						<td colspan="3">
							<input id="drProductBorrower" name="borrower" class="easyui-textbox" style="height:120px;width: 415px;" data-options="multiline:true"/>
						</td>
					</tr>
					<tr>		
						<td align="left">还款来源：</td>
						<td colspan="3">
							<input id="drProductRepaySource" name="repaySource" class="easyui-textbox" style="height:120px;width: 415px;" data-options="multiline:true"/>
						</td>
					</tr>
					<tr>		
						<td align="left">风控措施：</td>
						<td colspan="3">
							<input id="drProductWindMeasure" name="windMeasure" class="easyui-textbox" style="height:120px;width: 415px;" data-options="multiline:true"/>
						</td>
					</tr>
				</table>
			</div>
			<div title="产品扩展信息" class="easyui-panel" style="width:100%;height:auto;padding:10px;margin-bottom: 10px" data-options="collapsible:true,region:'center',tools:'#productExtendUpdElseBtn'">
				<table id="updProductExtendElseTable" align="center" cellspacing="1" cellpadding="1">
				</table>
			</div>
			<div id="productExtendUpdElseBtn">
				<a href="javascript:void(0)" class="icon-add" onclick="updProductExtendElse();"></a>
			</div>
		</form>
		<div id="updateDrProductInfoBtn">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="updateDrProductInfoForElse()">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeDialog()">取消</a>
		</div>
	</div>
	
	<div id="addDrProductInfoStartDateDialog" class="easyui-dialog" title="上架设置"
		data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:true,maximizable:false,buttons:'#addDrProductStartDateDialogBtn'" style="width:500px;height:200px;padding:5px;">
		<table align="center">
			<td style="height: 50px">
				<input class="isAuto" type="radio" name="isAuto"
	            class="easyui-validatebox" checked="checked" value="0"><label>指定上架时间</label></input>
	            <input class="isAuto" type="radio" name="isAuto"
	            class="easyui-validatebox" value="1"><label>满足条件即可上架</label></input>
	        </td>
       </table> 
		<form id="addDrProductInfoStartDateForm" class='isAutoform'>
			<input type="hidden" id="drProductStartDateId"  name="id"/>
			<table align="center">
				<tr>
					<td align="left">上架时间：</td>
					<td>
						<input id="addStartDate" name="startDate" type="text" class="easyui-datetimebox" data-options="required:true"/>
					</td>
				</tr>
			</table>
		</form>
<!-- 		自动上架form -->
		<form id="addDrProductInfoAsAutoForm" class='isAutoform'  style='display:none;'>
			<input type="hidden" id="drProductAsAutoId"  name="id"/>
			<table align="center">
				<tr>
					<td align="left">当同期产品剩余金额低于：</td>
					<td>
						<input id="autoAmount" name="autoAmount" type="text" class="easyui-Numberbox" data-options="required:true"/>
					</td>
					<td align="right">元</td>
				</tr>
				<tr>
					<td align="left">自动上架序号：</td>
					<td>
						<input id="autoNum" name="autoNum" type="text" class="easyui-Numberbox" data-options="required:true"/>
					</td>
				</tr>
			</table>
		</form>
		
		<div id="addDrProductStartDateDialogBtn">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="addDrProductStartDate()">确定</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeDrProductStartDateDialog()">取消</a>
		</div>
	</div>
<script type="text/javascript">

	var isAutoIndex = 0;
	$('.isAuto').click(function(){
		$(".isAutoform").hide();
		if($(this).index() == 0)
			isAutoIndex = 0;
		else
			isAutoIndex = 1;
		$(".isAutoform").eq(isAutoIndex).show();
	})

	//重置按钮
	$('#resetDrProductInfo').click(function(){
		$("#drProductInfoForm").form("reset");
		$("#drProductInfoList").datagrid("load", {});
	});
	
	//查询按钮
	$('#searchDrProductInfo').click(function(){
 		$('#drProductInfoList').datagrid({
			queryParams: {
				simpleName: $('#searchDrProductInfoSimpleName').val(),
				deadline: $('#searchDrProductInfoDeadline').val(),
				surplusDay: $('#searchDrProductInfoSurplusDay').val(),
				isAuto:$('#searchDrProductInfoIsAuto').combo("getValue")+"",
                dateStart:$('#searchAutoStartDate').datebox('getValue'),
                dateEnd:$('#searchAutoEndDate').datebox('getValue'),
                dateStart1:$('#searchAutoStartDate1').datebox('getValue'),
                dateEnd1:$('#searchAutoEndDate1').datebox('getValue'), 
				status: $('#searchDrProductInfoStatus').combobox('getValue'),
				type: $('#searchDrProductInfoType').combobox('getValue'), 
			}
		}); 
	});
	
	//添加基本操作链接
	function formatOper(val,row,index){  
		if(row.status=="1" || row.status=="3"){
			return	'<a href="#" class="btn l-btn l-btn-small" onclick="toShowProductInfoBtn('+index+')">查看</a>'+"   "+
					'<a href="#" class="btn l-btn l-btn-small" onclick="updateDrProductInfoBtn('+index+')">修改</a>';
		}else if(row.status=="2"){
			return	'<a href="#" class="btn l-btn l-btn-small" onclick="toShowProductInfoBtn('+index+')">查看</a>'+"   "+
					'<a href="#" class="btn l-btn l-btn-small" onclick="updateDrProductInfoBtn('+index+')">修改</a>'+"   "+
					'<a href="#" class="btn l-btn l-btn-small" onclick="updateDrProductStartDateBtn('+index+')">上架</a>'+"   "+
					'<a href="#" class="btn l-btn l-btn-small" onclick="updateDrProductDeleteBtn('+index+')">作废</a>';
		}else if(row.status=="6"){
			return	'<a href="#" class="btn l-btn l-btn-small" onclick="toShowProductInfoBtn('+index+')">查看</a>'+"   "+
			'<a href="#" class="btn l-btn l-btn-small" onclick="updateDrProductInfoBtn('+index+')">修改</a>'+"   "+
			'<a href="#" class="btn l-btn l-btn-small" onclick="reviewDrProductInfoBtn('+index+')">复审</a>';
		}else{
			var oper = '<a href="#" class="btn l-btn l-btn-small" onclick="updateDrProductInfoForElseBtn('+index+')">修改</a>'+"   "+
					'<a href="#" class="btn l-btn l-btn-small" onclick="toShowProductInfoBtn('+index+')">查看</a>';
					
			if(0<row.surplusDay && row.surplusDay<=5 && row.isSid == 1 && row.status=="8"){
				if(null == row.renewal){
					oper +="   "+'<a href="#" class="btn l-btn l-btn-small" onclick="addProductInfoRenewalBtn('+index+')">续发</a>';
				}
			}
			if(row.bespoke == 1 && row.status=="5"){
				oper +="   "+'<a href="#" class="btn l-btn l-btn-small" onclick="productCancelBespokeBtn('+index+')">取消预约</a>';
			}
			if(row.status=="5" && row.alreadyRaiseAmount == 0){
				oper +="   "+'<a href="#" class="btn l-btn l-btn-small" onclick="productFansBtn('+index+')">下架</a>';
			}
			return oper;
		}
	} 
	
	//跳转到产品添加页面
	function addDrProductInfoBtn(){
		var mainTab = parent.$('#main-center');
		var detailTab = {
				title : "产品新增",
				content:"<iframe width='100%' height='100%' frameborder='0' src='${apppath}/product/toAddDrProductInfo.do' ></iframe>",
				closable : true
		};
		mainTab.tabs("add",detailTab);
	}
	
	//跳转到产品修改页面
	function updateDrProductInfoBtn(index){
		$('#drProductInfoList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drProductInfoList').datagrid('getSelected'); 
	    $.ajax({
			url: "${apppath}/product/isOperate.do?id="+row.id+"&operate=update",
			dataType:"json",
			success:function(result){
				if(result.success){
					var mainTab = parent.$('#main-center');
					var detailTab = {
							title : "产品修改",
							content:"<iframe width='100%' height='100%' frameborder='0' src='${apppath}/product/toUpdateProductInfo.do?id="+row.id+"'></iframe>",
							closable : true
					};
					mainTab.tabs("add",detailTab);
				}else{
					$.messager.alert("提示信息",result.errorMsg,function(){
						$('#drProductInfoList').datagrid('reload');
					});
				}
			}
 		});
	}
	
	//产品复审
	function reviewDrProductInfoBtn(index){
		$('#drProductInfoList').datagrid('selectRow',index);// 关键在这里 
		var row = $('#drProductInfoList').datagrid('getSelected'); 
		$.messager.confirm("操作提示", "是否对产品复审？", function(ensure){
			if(ensure){
				var url = "${apppath}/product/reviewDrProductInfo.do?id="+row.id;
				$.ajax({
					url: url,
					dataType:"json",
					success:function(result){
						if(result.success){
							$('#drProductInfoList').datagrid('reload');
							$.messager.alert("操作提示", result.msg);
						}else{
							$('#drProductInfoList').datagrid('reload');
							$.messager.alert("提示信息",result.errorMsg);
						}
					}
			  	});
			}
		});
	}
	
	//跳转到产品续发页面
	function addProductInfoRenewalBtn(index){
		$('#drProductInfoList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drProductInfoList').datagrid('getSelected'); 
	    $.ajax({
			url: "${apppath}/product/validatorAddDrProductInfoRenewal.do?id="+row.id,
			dataType:"json",
			success:function(result){
				if(result.success){
					var mainTab = parent.$('#main-center');
					var detailTab = {
							title : "产品续发",
							content:"<iframe width='100%' height='100%' frameborder='0' src='${apppath}/product/toAddProductInfoRenewal.do?id="+row.id+"'></iframe>",
							closable : true
					};
					mainTab.tabs("add",detailTab);
				}else{
					$.messager.alert("提示信息",result.errorMsg,function(){
						$('#drProductInfoList').datagrid('reload');
					});
				}
			}
 		});
	}
	
		//上架操作
	function updateDrProductStartDateBtn(index){
		$('#drProductInfoList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drProductInfoList').datagrid('getSelected'); 
	    $('#drProductStartDateId').val(row.id);
	    $('#drProductAsAutoId').val(row.id);
	    $('#autoAmount').val(row.autoAmount);
        $('#autoNum').val(row.autoNum);
	    $("#addStartDate").datetimebox("setValue",getNowFormatDate());  
		$("#addDrProductInfoStartDateDialog").dialog("open");
	}
	
	//上架操作
	function addDrProductStartDate(index){
		if(isAutoIndex == 0){
			var validate = $("#addDrProductInfoStartDateForm").form("validate");
			if(!validate){
				return false;
			}
			var url = "${apppath}/product/updateDrProductStatus.do?id="+$('#drProductStartDateId').val()+"&startDate="+$('#addStartDate').datetimebox('getValue');
			$.ajax({
				url: url,
				dataType:"json",
				success:function(result){
					if(result.success){
						$.messager.alert("操作提示", result.msg);
						$('#drProductInfoList').datagrid('reload');
						$("#addDrProductInfoStartDateDialog").dialog("close");
					}else{
						$.messager.alert("提示信息",result.errorMsg);
						$('#drProductInfoList').datagrid('reload');
						$("#addDrProductInfoStartDateDialog").dialog("close");
					}
				}
		  	});
		}else{
			var url = "${apppath}/product/aotoUpdateProductStatus.do?id="+$('#drProductAsAutoId').val()+"&autoAmount="+$('#autoAmount').val()+"&autoNum="+$('#autoNum').val();
			$.ajax({
				url: url,
				dataType:"json",
				success:function(result){
					if(result.success){
						$.messager.alert("操作提示", result.msg);
						$('#drProductInfoList').datagrid('reload');
						$("#addDrProductInfoStartDateDialog").dialog("close");
					}else{
						$.messager.alert("提示信息",result.errorMsg);
						$('#drProductInfoList').datagrid('reload');
						$("#addDrProductInfoStartDateDialog").dialog("close");
					}
				}
		  	});
		}
	}
	
	//取消预约操作
	function productCancelBespokeBtn(index){
		$('#drProductInfoList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drProductInfoList').datagrid('getSelected'); 
		$.messager.confirm("取消预约提示", "您取消上架时间为 "+formatDateBoxFull(row.startDate), function(ensure){
			if(ensure){
				var url = "${apppath}/product/updateDrProductCancelBespoke.do?id="+row.id;
				$.ajax({
					url: url,
					dataType:"json",
					success:function(result){
						if(result.success){
							$('#drProductInfoList').datagrid('reload');
							$.messager.alert("操作提示", result.msg);
						}else{
							$('#drProductInfoList').datagrid('reload');
							$.messager.alert("提示信息",result.errorMsg);
						}
					}
			  	});
			}
		});
	}
	
	//作废操作
	function updateDrProductDeleteBtn(index){
		$('#drProductInfoList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drProductInfoList').datagrid('getSelected'); 
		$.messager.confirm("操作提示", "是否作废这个产品？", function(ensure){
			if(ensure){
				var url = "${apppath}/product/updateDrProductDelete.do?id="+row.id;
				$.ajax({
					url: url,
					dataType:"json",
					success:function(result){
						if(result.success){
							$('#drProductInfoList').datagrid('reload');
							$.messager.alert("操作提示", result.msg);
						}else{
							$('#drProductInfoList').datagrid('reload');
							$.messager.alert("提示信息",result.errorMsg);
						}
					}
			  	});
			}
		});
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
	
	//更改是否显示
	function updateDrProductIsShowBtn(index){  
		$('#drProductInfoList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drProductInfoList').datagrid('getSelected'); 
		$.messager.confirm('操作提示', '你确定更改吗？', function(r){
			if(r){
				var url = "../product/updateDrProductIsShow.do?id="+row.id+"&isShow="+row.isShow;
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
	
	//下架操作
	function productFansBtn(index){  
		$('#drProductInfoList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drProductInfoList').datagrid('getSelected'); 
		$.messager.confirm('操作提示', '你确定要下架吗？', function(r){
			if(r){
				var url = "../product/updateDrProductFans.do?id="+row.id;
				$.ajax({
					url: url,
					dataType:"json",
					success:function(result){
						if(result.success){
							$('#drProductInfoList').datagrid('reload');
							$.messager.alert("提示信息",result.msg);
						}else{
							$('#drProductInfoList').datagrid('reload');
							$.messager.alert("提示信息",result.errorMsg);
						}
					}
			  	});
			}
		});
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
	//打开dialog
	function updateDrProductInfoForElseBtn(index){  
		$('#drProductInfoList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#drProductInfoList').datagrid('getSelected'); 
		var url = "${apppath}/product/queryDrProductInfo.do?id="+row.id;
		$.ajax({
			url: url,
			dataType:"json",
			success:function(result){
				if(result.success){
					$("#drProductId").val(result.map.drProductInfo.id);
					$("#drProductCode").textbox('setValue',result.map.drProductInfo.code);
					$("#drProductFullName").textbox('setValue',result.map.drProductInfo.fullName);
					$("#drProductSimpleName").textbox('setValue',result.map.drProductInfo.simpleName);
					$("#drProductAccept").textbox('setValue',result.map.drProductInfo.accept);
					$("#drProductLeastaAmount").textbox('setValue',result.map.drProductInfo.leastaAmount);
					$("#drProductIntroduce").textbox('setValue',result.map.drProductInfo.introduce);
					$("#drProductBorrower").textbox('setValue',result.map.drProductInfo.borrower);
					$("#drProductRepaySource").textbox('setValue',result.map.drProductInfo.repaySource);
					$("#drProductWindMeasure").textbox('setValue',result.map.drProductInfo.windMeasure);
					$("#pcUrl").textbox('setValue',result.map.drProductInfo.pcUrl);
					$("#appUrl").textbox('setValue',result.map.drProductInfo.appUrl);

					
					$("#updProductExtendElseTable tr").remove();
					$.each(result.map.drProductExtend, function (n, v) {
						var tr = "<tr><td>"+
								"标题：<input name=\"drProductExtend["+n+"].title\" value="+v.title+" type='text' class='easyui-textbox' style='width: 150px;' data-options=\"validType:'maxLength[50]'\"/>"+
								"</td>" +
								"<td>" +
								"内容：<input class='easyui-textbox' name=\"drProductExtend["+n+"].content\" value='"+v.content+"' style='height:60px;width: 200px;' data-options=\"multiline:true,validType:'maxLength[2000]'\"/>"+
								"</td>" +
					   	   		"<td><div class='btn-group'>" +
					   	   		"<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-remove' onclick='delExtend(this)'> " +
					   	   		"删除</a></div></td></tr>"; 
						$("#updProductExtendElseTable").append(tr);
						$('.easyui-textbox').textbox({    
						}); 
						$('.easyui-linkbutton').linkbutton({    
						});
						j++;
					});		
					
					$("#updateDrProductInfoDialog").dialog("open");
				}else{
					$.messager.alert("提示信息",result.errorMsg);
				}
			}
	  	});
	}
	
	//修改产品扩展信息
	function updProductExtendElse(){
		var tr = "<tr><td>"+
			"标题：<input name=\"drProductExtend["+j+"].title\" type='text' class='easyui-textbox' style='width: 150px;' data-options=\"validType:'maxLength[50]'\"/>"+
			"</td>" +
			"<td>" +
			"内容：<input class='easyui-textbox' name=\"drProductExtend["+j+"].content\" style='height:60px;width: 200px;' data-options=\"multiline:true,validType:'maxLength[2000]'\"/>"+
			"</td>" +
   	   		"<td><div class='btn-group'>" +
   	   		"<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-remove' onclick='delExtend(this)'> " +
   	   		"删除</a></div></td></tr>"; 
		$("#updProductExtendElseTable").append(tr);
		$('.easyui-textbox').textbox({    
		}); 
		$('.easyui-linkbutton').linkbutton({    
		});
		j++;
	}
	
	function delExtend(obj){
		$(obj).parent().parent().parent().remove();
	}
	
	//上架后的修改
	function updateDrProductInfoForElse(){  
		var validate = $("#updateDrProductInfoForm").form("validate");
		if(!validate){
			return false;
		}
   		$.ajax({
          	url: "${apppath}/product/updateDrProductInfoForElse.do",
            type: 'POST',
            data:$("#updateDrProductInfoForm").serialize(),
            success:function(result){
				if(result.success){
					$.messager.alert("提示信息",result.msg);
					$("#drProductInfoList").datagrid("reload");
					$("#updateDrProductInfoDialog").dialog("close");
				}else{
					$.messager.alert("提示信息",result.errorMsg);
				}
			}
        });
	}
	
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
	
	//是否自动上架
	function formaterOperisAuto(value,row,index){
		if(row.isAuto=="1"){
			return '是';
		}else{
			return '否';
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
	
	//关闭Dialog
	function closeDialog(){  
		$("#drProductInfoList").datagrid("reload");
		$("#updateDrProductInfoDialog").dialog("close");
	}
	
	//关闭Dialog
	function closeDrProductStartDateDialog(){  
		$("#drProductInfoList").datagrid("reload");
		$("#addDrProductInfoStartDateDialog").dialog("close");
	}
	
	//导出
	function exportDrProductInfo(){
		window.location.href="../product/exportDrProductInfo.do?simpleName="+encodeURIComponent(encodeURIComponent($('#searchDrProductInfoSimpleName').val()))+
			"&type="+$('#searchDrProductInfoType').combobox('getValue')+
			"&status="+$('#searchDrProductInfoStatus').combobox('getValue')+
			"&deadline="+$('#searchDrProductInfoDeadline').val()+
            "&surplusDay="+$('#searchDrProductInfoSurplusDay').val()+
            "&isAuto="+$('#searchDrProductInfoIsAuto').combo("getValue")+
            "&dateStart="+$('#searchAutoStartDate').datebox('getValue')+
            "&dateEnd="+$('#searchAutoEndDate').datebox('getValue');
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
	
function formatOperCount(value,row,index){
	var id = "'"+row.id+ "'";
	var titleName = "'"+row.simpleName+ "'";
	return '<a href="#" onclick="toInvestList('+id+','+titleName+')">'+value+'</a>';
}
function toInvestList(id,titleName){
	var mainTab = parent.$('#main-center');
	var detailTab = {
			title : titleName+"投资记录",
			content:"<iframe width='100%' height='100%' frameborder='0' src='${apppath}/invest/toProductInvestList.do?id="+id+"&titleName='"+titleName+" ></iframe>",
			closable : true
	};
	var tab = mainTab.tabs("getSelected");
	var index = mainTab.tabs('getTabIndex',tab);
	mainTab.tabs("add",detailTab);
}


</script>
</body>
</html>

