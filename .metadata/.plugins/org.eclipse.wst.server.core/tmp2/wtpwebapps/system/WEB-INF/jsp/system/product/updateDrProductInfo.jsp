﻿<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<%@ include file="../../common/include/util.jsp" %>
<script type="text/javascript" src="../js/common/jquery.form.js"></script>
<script src="../js/layer/layer.min.js"></script>
<script src="../js/layer/extend/layer.ext.js"></script>
</head>
<body>
<div id="${tabid }">
	<form id="updateDrProductInfoForm" enctype="multipart/form-data">
	<input id="productId" type="hidden" value="${drProductInfo.id }" name="id"/>
		<div title="产品信息" class="easyui-panel" style="width:100%;height:auto;padding:10px;margin-bottom: 10px">
			<table id="updateProductInfo" align="center" cellspacing="1" cellpadding="1" style="width:auto;">
				<tr>
					<td align="left">产品编号：</td>
					<td colspan="2">
						<input name="code" value="${drProductInfo.code}" type="text" class="easyui-textbox" disabled="disabled"/>
					</td>
					<c:if test="${drProductInfo.fid != null}">
						<td align="left">续发编号：</td>
						<td colspan="2">
							<input name="code" value="${fcode }" type="text" class="easyui-textbox" disabled="disabled"/>
						</td>
					</c:if>
				</tr>
				<tr>
					<td align="left">产品全称：</td>
					<td colspan="2">
						<input name="fullName" value="${drProductInfo.fullName}" type="text" class="easyui-textbox" data-options="validType:'maxLength[50]'"/>
					</td>
					<td align="left">产品简称：</td>
					<td colspan="2">
						<input name="simpleName" value="${drProductInfo.simpleName}" type="text" class="easyui-textbox" data-options="validType:'maxLength[50]'"/>
					</td>
				</tr>
				<tr>
					<td align="left">产品类型：</td>
					<td colspan="2">
						<select id="updateProductType" name="type" style="width: 172px" class="easyui-combobox" data-options="    
					        onSelect: function(rec){    
					        	if(rec.value == 1 || rec.value == 4){
					        		$('#isShowSidUpdate').hide();
					        		$('#isShowPicUpdate').hide();
					        		$('.isShowPicInfoUpdate').hide();
					        	}else{
					        		$('#sidUpdate').combobox({    
									    url:'${apppath}/product/getDrSubjectInfo.do?type='+rec.value,    
									    valueField:'id',    
									    textField:'name',
									    onLoadSuccess:function(){
									    	$('.isShowPicInfoUpdate').remove();
									    	var data = $('#sidUpdate').combobox('getData');
								            if (data.length > 0) {
								                $('#sidUpdate').combobox('select', data[0].id);
								            }
									    }
									});  
					        		$('#isShowSidUpdate').show();
					        		$('#isShowPicUpdate').show();
					        		$('.isShowPicInfoUpdate').show();
					        	}  
					        },editable:false" <c:if test="${drProductInfo.fid != null}">disabled="disabled"</c:if>>
							<c:forEach items="${type}" var="map">
							
								<%-- <c:if test="${map.key == 1 || map.key == 2}"> --%>
								
								
								<c:if test="${map.key == 5 || map.key == 2|| map.key == 6}">
								<option value='${map.key }' <c:if test="${drProductInfo.type== map.key}"> selected="selected" </c:if>>${map.value }</option>
								</c:if>
							</c:forEach>
						</select>
						<c:if test="${drProductInfo.fid != null}"><input name="type" value="${drProductInfo.type }" type="hidden"/></c:if>
						
					</td>
					<td align="left">安全等级：</td>
					<td colspan="2">
						<select name="riskLevel" style="width: 172px" class="easyui-combobox"> 
								<option value=1  <c:if test="${drProductInfo.riskLevel==1 }">selected=selected</c:if>>低风险</option>
								<option value=2  <c:if test="${drProductInfo.riskLevel==2 }">selected=selected</c:if>>较低风险</option>
								<option value=3  <c:if test="${drProductInfo.riskLevel==3 }">selected=selected</c:if>>中等风险</option>
								<option value=4  <c:if test="${drProductInfo.riskLevel==4 }">selected=selected</c:if>>一定风险</option>
						</select>
					</td>
					<!--td align="left">居间人：</td>
					<td colspan="2">
						<select name="intermediary" style="width: 172px" class="easyui-combobox">
							<c:forEach items="${intermediary}" var="map">
								<option value='${map.key }' <c:if test="${drProductInfo.intermediary== map.key}"> selected="selected" </c:if>>${map.value }</option>
							</c:forEach>
						</select>
					</td-->
				</tr>
				<tr id="isShowSidUpdate" <c:if test="${drProductInfo.type == 1 || drProductInfo.type == 4}"> style="display:none" </c:if>>
					<td></td>
					<td align="left" colspan="2">
						<input name="isSid" value="1" type="radio" checked="checked"/>是否需要关联标的
					</td>
					<td align="left">关联标的：</td>
					<td>
						<select id="sidUpdate" name="sid" data-value="${drProductInfo.sid }" style="width: 190px" class="easyui-combobox" 
						<c:if test="${drProductInfo.fid != null}">disabled="disabled"</c:if> data-options="required:true,editable:false">
						</select>
						<c:if test="${drProductInfo.fid != null}"><input name="sid" value="${drProductInfo.sid }" type="hidden"/></c:if>
					</td>
					<td>
						<a href="javascript:void(0)" class="easyui-linkbutton" onclick="queryDrSubjectInfoBtn();">查看详情</a>
					</td>
				</tr>
				<tr>
					<td align="left">产品金额：</td>
					<td colspan="2">
						<input name="amount" value="${drProductInfo.amount}" type="text" class="easyui-numberbox" 
						data-options="required:true,min:0,max:5000000,precision:2,validType:'updateProductAmount[updateProductType,sidUpdate,productId]'" 
						<c:if test="${drProductInfo.fid != null}">disabled="disabled"</c:if>/>元
						<c:if test="${drProductInfo.fid != null}"><input name="amount" value="${drProductInfo.amount }" type="hidden"/></c:if>
					</td>
					<!--td align="left">成立时间：</td>
					<td colspan="2">
						<input name="establish" value="${establish}" type="text" class="easyui-datebox" data-options="editable:false"/>预估
					</td-->
				</tr>
				<tr>
					<td align="left">年化利率：</td>
					<td colspan="2">
						<input name="rate" value="${drProductInfo.rate}" type="text" class="easyui-numberbox" data-options="required:true,min:0,max:20,precision:2"/>%
					</td>
					<td align="left">活动利率：</td>
					<td colspan="2">
						<input name="activityRate" value="${drProductInfo.activityRate}" type="text" class="easyui-numberbox" data-options="required:true,min:0,max:10,precision:2"/>%
					</td>
				</tr>
				<tr>
					<td align="left">还款方式：</td>
					<td colspan="2">
						<select name="repayType" style="width: 172px" class="easyui-combobox">
							<c:forEach items="${repayType}" var="map">
								<c:if test="${map.key == 1}">
								<option value='${map.key }' <c:if test="${drProductInfo.repayType== map.key}"> selected="selected" </c:if>>${map.value }</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
					<td align="left">产品期限：</td>
					<td colspan="2">
						<input id="productDeadline" name="deadline" value="${drProductInfo.deadline}" type="text" class="easyui-numberbox" data-options="required:true,min:0,max:1000"/>天
					</td>
				</tr>
				<tr>
					<td align="left">起投金额：</td>
					<td colspan="2">
						<input name="leastaAmount" value="${drProductInfo.leastaAmount}" type="text" class="easyui-numberbox" data-options="required:true,min:0,max:100000"/>元
					</td>
					<td align="left">募集期限：</td>
					<td colspan="2">
						<input name="raiseDeadline" value="${drProductInfo.raiseDeadline}" type="text" class="easyui-numberbox" data-options="required:true,min:0,max:1000,validType:'deadline[productDeadline]'"/>天
					</td>
				</tr>
				<tr>
					<td align="left">递增金额：</td>
					<td colspan="2">
						<input name="increasAmount" value="${drProductInfo.increasAmount}" type="text" class="easyui-numberbox" data-options="required:true,min:0,max:5000000,precision:2"/>元
					</td>
					<td align="left">最大金额：</td>
					<td colspan="2">
						<input name="maxAmount" value="${drProductInfo.maxAmount}" type="text" class="easyui-numberbox" data-options="required:true,min:0,max:5000000,precision:2"/>元
					</td>
				</tr>
				<tr>
					<td align="left">活动提示：</td>
					<td colspan="2">
						<input id="acceptUpdate" name="accept" value="${drProductInfo.accept}" type="text" class="easyui-textbox" style="height:40px;" data-options="multiline:true"/>
					</td>
				</tr>
				<tr>
					<td align="left">pc跳转：</td>
					<td colspan="2">
						<input id="pcUrl" name="pcUrl" value="${drProductInfo.pcUrl}" type="text" class="easyui-textbox" style="width:350px;" data-options="min:0,max:50000000,precision:2"/>
					</td>
				</tr>
				<tr>
					<td align="left">移动跳转：</td>
					<td colspan="2">
						<input id="appUrl" name="appUrl" value="${drProductInfo.appUrl}" type="text" class="easyui-textbox" style="width:350px;" data-options="min:0,max:50000000,precision:2"/>
					</td>
				</tr>
				<tr>
					<td align="left">
						<input name="isHot" type="checkbox" value="1" <c:if test="${drProductInfo.isHot == 1}"> checked="checked" </c:if>/>是否热推
					</td>
					<!--td align="left">
						<input name="isDeductible" type="checkbox" value="1" <c:if test="${drProductInfo.isDeductible == 1}"> checked="checked" </c:if>/>可否抵扣
					</td-->
					<td align="left">
						<input name="isInterest" type="checkbox" value="1" <c:if test="${drProductInfo.isInterest == 1}"> checked="checked" </c:if>/>可否加息
					</td>
					<td align="left">
						<input name="isCash" type="checkbox" value="1" <c:if test="${drProductInfo.isCash == 1}"> checked="checked" </c:if>/>可否返现
					</td>
					<td align="left">
						<input name="isDouble" type="checkbox" value="1" <c:if test="${drProductInfo.isDouble == 1}"> checked="checked" </c:if>/>可否加倍
					</td>
					<td align="left">
						<input name="isRepair" type="checkbox" value="1" <c:if test="${drProductInfo.isRepair == 1}"> checked="checked" </c:if>/>可否补标
					</td>
				</tr>
				<tr>
					<td align="left">
						<input id="immediately" name="immediately" type="checkbox" value="1" <c:if test="${drProductInfo.immediately == 1}"> checked="checked" </c:if> />红包是否实时返现
					</td>
				</tr>
				<tr>
					<td align="left">产品介绍：</td>
					<td colspan="4">
						<input name="introduce" value="${drProductInfo.introduce}" class="easyui-textbox" style="height:123px;width: 450px;" data-options="multiline:true,validType:'maxLength[2000]'"/>
					</td>
				</tr>
				<tr>	
					<td align="left">借款人：</td>
					<td colspan="4">
						<input name="borrower" value="${drProductInfo.borrower}" class="easyui-textbox" style="height:123px;width: 450px;" data-options="multiline:true,validType:'maxLength[2000]'"/>
					</td>
				</tr>
				<tr>		
					<td align="left">还款来源：</td>
					<td colspan="4">
						<input name="repaySource" value="${drProductInfo.repaySource}" class="easyui-textbox" style="height:123px;width: 450px;" data-options="multiline:true,validType:'maxLength[2000]'"/>
					</td>
				</tr>
				<tr>		
					<td align="left">风控措施：</td>
					<td colspan="4">
						<input name="windMeasure" value="${drProductInfo.windMeasure}" class="easyui-textbox" style="height:123px;width: 450px;" data-options="multiline:true,validType:'maxLength[2000]'"/>
					</td>
				</tr>
				<tr id="isShowPicUpdate" data-value="${drClaimsPic}" <c:if test="${drClaimsPic == null}"> style="display:none" </c:if>>
					<th></th>
					<th>图片名称(点击查看)</th>
					<th></th>
					<th>是否显示</th>
					<th>显示顺序(先显示数字小的)</th>
				</tr>
				<c:forEach items="${drClaimsPic}" var="v" varStatus="i">
		   	   	<tr class='isShowPicInfoUpdate'>
			   	   	<td></td>
			   	   	<td>
						<input name="drClaimsPic[${i.index}].id" value="${v.id}" type='hidden'/>
						<a href='javascript:void(0)' data-value="${v.bigUrl}" onclick="showPic(this);">${v.name}</a>
					</td>
					<td></td>
					<td>
						<input type="checkbox" name="drClaimsPic[${i.index}].isShow" value="1" <c:if test="${v.isShow == 1}"> checked="checked" </c:if>/>
					</td>
		   	   		<td>
		   	   			<input name="drClaimsPic[${i.index}].showSort" value="${v.showSort}" type='text' class='easyui-numberbox' data-options='min:0,max:10'/> 
		   	   		</td>
	   	   		</tr>
				</c:forEach>
			</table>
		</div>
		<div title="产品扩展信息" class="easyui-panel" style="width:100%;height:auto;padding:10px;margin-bottom: 10px" data-options="collapsible:true,region:'center',tools:'#productExtendUpdBtn'">
			<table id="updProductExtendTable" align="center" cellspacing="1" cellpadding="1" style="width: auto;">
				<c:forEach items="${drProductExtend}" var="v" varStatus="i">
				<tr>
					<td>
						标题：<input name='drProductExtend[${i.index}].title' value="${v.title}" type='text' class='easyui-textbox' data-options="validType:'maxLength[50]'"/>
					</td>
					<td>
						内容：<input name='drProductExtend[${i.index}].content' value="${v.content}" class='easyui-textbox' style="height:60px;width: 450px;" data-options="multiline:true,validType:'maxLength[2000]'"/>
					</td>
					<td>
			   	   		<div class='btn-group'>
				   	   		<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-remove' onclick='delExtend(this)'>删除</a>
			   	   		</div>
	   	   			</td>
		   	   	</tr>
				</c:forEach>
			</table>
		</div>
		<div id="productExtendUpdBtn">
			<a href="javascript:void(0)" class="icon-add" onclick="updProductExtend();"></a>
		</div>
		<div title="产品图片" class="easyui-panel" style="width:100%;height:auto;padding:10px;"data-options="collapsible:true,region:'center',tools:'#productPicUpdBtn'">
			<table id="updProductPicTable" style="width:auto;" align="center" >
				<tr>
					<th>图片名称</th>
					<th>选择图片</th>
					<th>是否显示</th>
					<th>显示顺序(先显示数字小的)</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${drProductPic}" var="v" varStatus="i">
				<tr>
					<td>
						<input name='drProductPic[${i.index}].id' value="${v.id}" type="hidden"/>
						<input name='drProductPic[${i.index}].name' value="${v.name}" type='text' class='easyui-textbox' data-options="validType:'maxLength[50]'"/>
					</td>
					<td>
						<input name='drProductPic[${i.index}].bigUrl' value="${v.bigUrl}" type="hidden"/>
						<input type='file' name='productFiles' onchange="updateVerifyImage(this)" style='width:240px; white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'/>
					</td>
					<td>
						<input class='check-box <c:if test="${v.isShow == 1}">checked</c:if>' type="checkbox" name="drProductPic[${i.index}].isShow" value="1" onclick='changeOptions(this)' <c:if test="${v.isShow == 1}"> checked="checked" </c:if>/>
					</td>
		   	   		<td>
		   	   			<input name="drProductPic[${i.index}].showSort" value="${v.showSort}" type='text' class='easyui-numberbox' 
		   	   			<c:if test="${v.isShow == 1}">data-options='min:0,max:10,required:true'</c:if>
		   	   			<c:if test="${v.isShow == 0}">data-options='min:0,max:10'</c:if>
		   	   			/> 
		   	   		</td>
		   	   		<td>
			   	   		<div class='btn-group'>
				   	   		<a href='javascript:void(0)' data-value="${v.bigUrl}" class='easyui-linkbutton' iconCls='icon-search' onclick="updatePreviewImage(this)">查看</a>
				   	   		<a href='javascript:void(0)' data-value="${v.id}" class='easyui-linkbutton' iconCls='icon-remove' onclick='delPic(this)'>删除</a>
			   	   		</div>
		   	   		</td>
		   	   	</tr>
				</c:forEach>
			</table>
		</div>
		<div id="productPicUpdBtn">
			<a href="javascript:void(0)" class="icon-add" onclick="updProductPic();"></a>
		</div>
		<!-- 显示图片 -->
		<div id="updProductPicShow" class="easyui-dialog" title="查看图片" style="text-align:center;height:auto;width:625px;padding:10px;;top:40%" 
		data-options="closed:true,modal:true,minimizable:false,resizable:false,maximizable:false">
			<div id="imgbig">
				<img id="imglook" src="" width="600px" height="400px" />
			</div>
		</div>
		<!-- 显示图片 -->
		
		<div style="text-align:center;padding:30px 60px 30px 0px">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="updateDrProductInfoBtn();">提交审核</a>
		</div>
	</form>
</div>	
<div id="queryDrSubjectInfoWindow" class="easyui-window"
	data-options="closed:true,modal:true,minimizable:false,maximizable:false" style="padding:10px;">
</div>
<script type="text/javascript">

	$(document).ready(function(){
		$("#sidUpdate").combobox({    
		    url:'${apppath}/product/getDrSubjectInfo.do?type='+$('#updateProductType').combobox('getValue')+'&id='+$('#productId').val(),    
		    valueField:'id',    
		    textField:'name',
		    onLoadSuccess:function(){
		    	var data = $('#sidUpdate').combobox('getData');
	            if (data.length > 0) {
	            	$.each(data, function (n, v) {
	            		if(v.id == $('#sidUpdate').data("value")){
	            			$("#sidUpdate").combobox('select',$('#sidUpdate').data("value"));
	            		}
	                });
	            }
		    },
		    onSelect: function(rec){   
		    $('.isShowPicInfoUpdate').remove();
			    $.ajax({
					url: '${apppath}/product/getClaimsPicInfo.do?id='+$('#sidUpdate').combobox('getValue'),
					dataType:'json',
					success:function(result){
						if(result != ''){
							 $.each(result, function (n, v) {
							var tr = "<tr class='isShowPicInfoUpdate'><td></td><td>"+
									"<input name=\"drClaimsPic["+n+"].id\" value='"+v.id+"' type='hidden'/>"+
									"<a href='javascript:void(0)' data-value='"+v.bigUrl+"' onclick=\"showPic(this)\">"+v.name+"</a>"+
									"</td>" +
									"<td></td>"+
									"<td>";
								if(v.isShow == 1){
									tr+="<input class='check-box checked' type='checkbox' name=\"drClaimsPic["+n+"].isShow\" value='1' checked='checked' onclick='changeOptions(this)'/>";
								}else{
									tr+="<input class='check-box' type='checkbox' name=\"drClaimsPic["+n+"].isShow\" value='1' onclick='changeOptions(this)'/>";
								}
									tr+="</td>" +
						   	   		"<td><input name=\"drClaimsPic["+n+"].showSort\" value="+v.showSort+" type='text' class='easyui-numberbox' data-options='min:0,max:10,required:false'/>" +
						   	   		"</td></tr>"; 
								$('#updateProductInfo').append(tr);
								$('.easyui-numberbox').numberbox({    
								}); 
							});
						}
					}
				}); 
        	}
		}); 
	});
	
 	function updateDrProductInfoBtn(){
		var flag = $("#updateDrProductInfoForm").form('enableValidation').form('validate');
		if(flag){
			$("#updateDrProductInfoForm").ajaxSubmit({
				url:"${apppath}/product/updateDrProductInfo.do",
				type:"POST",
				data:$("#updateDrProductInfoForm").serialize(),
	      		success:function(data){
	      		    var resultJson = jQuery.parseJSON(data);
					var resultJson = eval(resultJson);
					if(resultJson.success){
						$.messager.alert("提示信息",resultJson.msg,"",function(){
							var currTab = parent.$('#main-center').tabs('getTab', "产品列表");
							if(currTab != null){
								var content = '<iframe scrolling="no" frameborder="0"  src="../product/toDrProductInfoList.do" style="width:100%;height:100%;"></iframe>';  
								parent.$('#main-center').tabs('update', {
									tab: currTab,
									options: {
										content: content  // 新内容的URL
									}
								});
							}
							parent.$('#main-center').tabs('close','产品修改');
						});
						$("#updateDrProductInfoForm").resetForm(); // 提交后重置表单
					}else{
						$.messager.alert("提示信息",resultJson.errorMsg);
					}            	
				}
	        });
	        return false; // 阻止表单自动提交事件
		}
	} 
	
	//跳转标的详情页面
	function queryDrSubjectInfoBtn(index){
		$("#queryDrSubjectInfoWindow").window({
			title:"标的详情",
			width:$(this).width()*0.5,
			height:$(this).height()*0.6,
			href:"../product/showDrSubjectInfo.do?id="+$('#sidUpdate').combobox('getValue'),
		});
		$("#queryDrSubjectInfoWindow").window("open").window("center");
	}
	
	function showPic(ths){
		var src = $(ths).data('value');
        layer.photos({
            json:  { //您服务端接口需严格按照下述格式返回
		        "status": 1,    //请求的状态，1表示成功，其它表示失败
		        "msg": "",  //状态提示语
		        "title": "",    //相册标题
		        "id": "",    //相册id
		        "start": 0, //初始显示的图片序号，默认0
		        "data": [   //相册包含的图片，数组格式
		            {
		                "name": "", //图片名
		                "pid": "", //图片id
		                "src": src, //原图地址
		                "thumb": "", //缩略图地址
		                "area": [638, 851] //原图宽高
		            }
		        ]
		    },
        });
	}
	
	var k = ${drProductPic.size()};
	//添加图片
	function updProductPic(){
		var tr = "<tr><td>"+
			"<input name=\"drProductPic["+k+"].name\" type='text' class='easyui-textbox' data-options=\"validType:'maxLength[50]'\"/>"+
			"</td>" +
			"<td>" +
			"<input name=\"drProductPic["+k+"].bigUrl\"  type='hidden'/>"+
			"<input type='file' name='productFiles' onchange=\"updateVerifyImage(this)\" style='width:240px; white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'/>"+
			"</td>" +
			"<td>" +
				"<input class='check-box checked' type='checkbox' name=\"drProductPic["+k+"].isShow\" value='1'  checked='checked' onclick='changeOptions(this)'/>" +
			"</td>" +
   	   		"<td>" +
   	   			"<input name=\"drProductPic["+k+"].showSort\" type='text' class='easyui-numberbox' data-options='min:0,max:20,required:true'/> " +
   	   		"</td>" +
   	   		"<td><div class='btn-group'>" +
   	   		"<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-search' onclick=\"updatePreviewImage(this)\">"+
   	   		"查看</a>"+" "+"<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-remove' onclick='delPic(this)'> " +
   	   		"删除</a></div></td></tr>"; 
		$("#updProductPicTable").append(tr);
		$('.easyui-textbox').textbox({    
		}); 
		$('.easyui-numberbox').numberbox({    
		}); 
		$('.easyui-linkbutton').linkbutton({    
		}); 
		k++;
	}
	
	var j = ${drProductExtend.size()};
	//修改产品扩展信息
	function updProductExtend(){
		var tr = "<tr><td>"+
			"标题：<input name=\"drProductExtend["+j+"].title\" type='text' class='easyui-textbox' data-options=\"validType:'maxLength[50]'\"/>"+
			"</td>" +
			"<td>" +
			"内容：<input class='easyui-textbox' name=\"drProductExtend["+j+"].content\" style='height:60px;width: 450px;' data-options=\"multiline:true,validType:'maxLength[2000]'\"/>"+
			"</td>" +
   	   		"<td><div class='btn-group'>" +
   	   		"<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-remove' onclick='delExtend(this)'> " +
   	   		"删除</a></div></td></tr>"; 
		$("#updProductExtendTable").append(tr);
		$('.easyui-textbox').textbox({    
		}); 
		$('.easyui-linkbutton').linkbutton({    
		});
		j++;
	}
	
	function changeOptions(ths) {
		var $this = $(ths);
		
		if ($this.hasClass('checked')) {
    		$this.parents('tr').find('.easyui-numberbox').numberbox({ 
				required:false
			});
			$this.removeClass('checked');
		}else {
		    $this.parents('tr').find('.easyui-numberbox').numberbox({ 
				required:true
			});
			$this.addClass('checked');
		}
	}
	
		//验证图片
	function updateVerifyImage(ths) {
		if (ths.value == "") {  
			$.messager.alert("提示信息","请上传图片");
	        return false;  
	    } 
        if (!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(ths.value)) {  
        	$.messager.alert("提示信息","图片类型必须是.gif,jpeg,jpg,png中的一种");
            ths.value = "";  
            return false;  
        }
        $(ths).prev('input').val('use');
        $(ths).parents('tr').find('a').eq(0).data("value", "undefined");
    	return true;  
	}
	
	//图片预览
	function updatePreviewImage(ths) {
		if(typeof($(ths).data("value")) == "undefined" || $(ths).data("value") == "undefined"){
			var dFile = $(ths).parents('tr').find('input[type="file"]');
		    if (dFile.val() == "" ) {
		        $.messager.alert("提示信息","请上传图片");
		        return false;
		    }
			var type = dFile.val().substring(dFile.val().lastIndexOf(".") + 1, dFile.val().length).toLowerCase();
		    if (type != "jpg" && type != "bmp" && type != "gif" && type != "png") {
		        $.messager.alert("提示信息","请上传正确的图片格式");
		        return false;
		    }
	        if (window.navigator.userAgent.indexOf("MSIE")>=1 && !(navigator.userAgent.indexOf("MSIE 10.0") > 0))    
	      	{    
				dFile.select();
				var imgSrc = document.selection.createRange().text;
				var localImagId = document.getElementById("imglook");
				localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
				document.selection.empty();
	      	}else{
				$("#imglook").attr("src",window.URL.createObjectURL(dFile.prop('files')[0]));
	      	}  
			$('#updProductPicShow').dialog('open');
			return true;
		}else{
			$("#imglook").attr("src",$(ths).data("value"));
			$('#updProductPicShow').dialog('open');
		}
	}
	
	function delPic(obj){
		var id= $(obj).data("value");
		if(typeof(id) == "undefined"){
			$(obj).parent().parent().parent().remove();
		}else{
			$.ajax({
				url: '${apppath}/product/deleteDrProductPic.do?id='+id,
				dataType:'json',
				success:function(result){
					if(result.success){
						$(obj).parent().parent().parent().remove();
					}else{
						$.messager.alert("提示信息",resultJson.errorMsg);
					}
				}
	 		});
		}
	}
	
	function delExtend(obj){
		$(obj).parent().parent().parent().remove();
	}
	
		//图片预览
	function PreviewImage(acceptPicAddFile) {
		if (acceptPicAddFile.value == "") {  
			$.messager.alert("提示信息","请上传图片");
	        return false;  
	    }  
     	if (!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(acceptPicAddFile.value)) {  
        	$.messager.alert("提示信息","图片类型必须是.gif,jpeg,jpg,png中的一种");
            acceptPicAddFile.value = "";  
            return false;  
        }
	    if(acceptPicAddFile){  
			if (window.navigator.userAgent.indexOf("MSIE")>=1 && !(navigator.userAgent.indexOf("MSIE 10.0") > 0))    {    
				acceptPicAddFile.select();
				var imgSrc = document.selection.createRange().text;
				var localImagId = document.getElementById("showArticleAddPic");
				localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
				document.selection.empty();
      		}else{ 
                if(acceptPicAddFile.files)  
                {  
                	$("#showAcceptPicAddPic").attr("src",window.URL.createObjectURL(acceptPicAddFile.files[0]));  
                }  
             }
         }  
		return true;
	}
</script>

</body>
</html>
