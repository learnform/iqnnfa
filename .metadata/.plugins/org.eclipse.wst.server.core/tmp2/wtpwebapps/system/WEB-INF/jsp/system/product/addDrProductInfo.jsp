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
	<form id="addDrProductInfoForm" enctype="multipart/form-data">
		<div title="产品信息" class="easyui-panel" style="width:100%;height:auto;padding:10px;margin-bottom: 10px">
			<table id="productInfo" align="center" cellspacing="1" cellpadding="1" style="width:auto;">
				<tr>
					<td align="left">产品编号：</td>
					<td colspan="2">
						<input name="code" value="${productCode }" type="hidden"/>
						<input name="code" value="${productCode }" type="text" class="easyui-textbox" disabled="disabled"/>
					</td>
					<td></td>
					<td align="left">
						<input id="productCode" type="text" class="easyui-textbox" data-options="validType:'maxLength[100]'"/>
					</td>
					<td align="left">
						<a href="javascript:void(0)" class="easyui-linkbutton" onclick="copyDrProductInfo();">复制</a>
					</td>
				</tr>
				<tr>
					<td align="left">产品全称：</td>
					<td colspan="2">
						<input id="productFullName" name="fullName" type="text" class="easyui-textbox" data-options="validType:'maxLength[50]'"/>
					</td>
					<td align="left">产品简称：</td>
					<td colspan="2">
						<input id="productSimpleName" name="simpleName" type="text" class="easyui-textbox" data-options="validType:'maxLength[50]'"/>
					</td>
				</tr>
				<tr>
					<td align="left">产品类型：</td>
					 <td colspan="2"> 
						<select id="productType" name="type" style="width: 172px" class="easyui-combobox" data-options="    
					        onSelect: function(rec){
					        	if(rec.value == 10 || rec.value == 11){
					        		$('#isShowSid').hide();
					        		$('#isShowPic').hide();
					        		$('.isShowPicInfo').hide();
					        	}else{
					       			$('#sid').combobox({    
									    url:'${apppath}/product/getDrSubjectInfo.do?type='+rec.value,    
									    valueField:'id',    
									    textField:'name',
									    onLoadSuccess:function(){
									    	$('.isShowPicInfo').remove();
									    	var data = $('#sid').combobox('getData');
								            if (data.length > 0) {
								                $('#sid').combobox('select', data[1].id);
								            }
									    }
									});  
					        		$('#isShowSid').show();
					        		$('#isShowPic').show();
					        		$('.isShowPicInfo').show();
					        	}  
					        },editable:false" >
					        
					        <option value="">全部</option>
							<c:forEach items="${type}" var="map">
								<%-- <c:if test="${map.key == 5 || map.key == 2|| map.key == 6}"> --%>
									<option value='${map.key }'>${map.value }</option>
								<%--  </c:if> --%>
							</c:forEach>
						</select>
						
					</td>
					<td align="left">安全等级：</td>
					<td colspan="2">
						<select name="riskLevel" style="width: 172px" class="easyui-combobox"> 
								<option value=1 selected="selected">低风险</option>
								<option value=2>较低风险</option>
								<option value=3>中等风险</option>
								<option value=4>一定风险</option>
						</select>
					</td>
				</tr>
				 <tr id="isShowSid" style="display:none"> 
					<td></td>
					<td align="left" colspan="2"> 
						<input name="isSid" value="5" type="radio" checked="checked"/>是否需要关联标的
					</>
					<td align="left">关联标的：</td>
					 <td>
						<select id="sid" name="sid" style="width: 190px" class="easyui-combobox" data-options="editable:false">
						</select>
					</td> 
					<td>
						<a href="javascript:void(0)" class="easyui-linkbutton" onclick="queryDrSubjectInfoBtn();">查看详情</a>
					</td>
				</tr>
				<tr>
					<td align="left">产品金额：</td>
					<td colspan="2">
						<input id="productAmount" name="amount" type="text" class="easyui-numberbox" data-options="required:true,min:0,max:50000000,precision:2,validType:'productAmount[productType,sid]'"/>元
					</td>
				</tr>
				<tr>
					<td align="left">年化利率：</td>
					<td colspan="2">
						<input id="productRate" name="rate" type="text" class="easyui-numberbox" data-options="required:true,min:0,max:20,precision:2"/>%
					</td>
					<td align="left">活动利率：</td>
					<td colspan="2">
						<input id="productActivityRate" name="activityRate" type="text" class="easyui-numberbox" data-options="required:true,min:0,max:10,precision:2"/>%
					</td>
				</tr>
				<tr>
					<td align="left">还款方式：</td>
					<td colspan="2">
						<select name="repayType" style="width: 172px" class="easyui-combobox">
							<c:forEach items="${repayType}" var="map">
								<c:if test="${map.key == 1}">
								<option value='${map.key }'>${map.value }</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
					<td align="left">产品期限：</td>
					<td colspan="2">
						<input id="productDeadline" name="deadline" type="text" class="easyui-numberbox" data-options="required:true,min:0,max:1000"/>天
					</td>
				</tr>
				<tr>
					<td align="left">起投金额：</td>
					<td colspan="2">
						<input id="productLeastaAmount" name="leastaAmount" type="text" class="easyui-numberbox" data-options="required:true,min:0,max:100000"/>元
					</td>
					<td align="left">募集期限：</td>
					<td colspan="2">
						<input id="productRaiseDeadline" name="raiseDeadline" type="text" class="easyui-numberbox" data-options="required:true,min:0,max:1000,validType:'deadline[productDeadline]'"/>天
					</td>
				</tr>
				<tr>
					<td align="left">递增金额：</td>
					<td colspan="2">
						<input id="productIncreasAmount" name="increasAmount" type="text" class="easyui-numberbox" data-options="required:true,min:1,max:50000000,precision:2"/>元
					</td>
					<td align="left">最大金额：</td>
					<td colspan="2">
						<input id="productMaxAmount" name="maxAmount" type="text" class="easyui-numberbox" data-options="required:true,min:0,max:50000000,precision:2"/>元
					</td>
				</tr>
				<tr>
					<td align="left">活动提示：</td>
					<td colspan="2">
						<input id="accept" name="accept" type="text" class="easyui-textbox" style="height:40px;" data-options="multiline:true,validType:'length[1,15]'"/>
					</td>
				</tr>
				<tr>
					<td align="left">pc跳转：</td>
					<td colspan="2">
						<input id="pcUrl" name="pcUrl" type="text" class="easyui-textbox" style="width:350px;" data-options="min:0,max:50000000,precision:2"/>
					</td>
				</tr>
				<tr>
					<td align="left">移动跳转：</td>
					<td colspan="2">
						<input id="appUrl" name="appUrl" type="text" class="easyui-textbox" style="width:350px;" data-options="min:0,max:50000000,precision:2"/>
					</td>
				</tr>
				<tr>	
					<td align="left">
						<input id="productIsHot" name="isHot" type="checkbox" value="1"/>是否热推
					</td>
					<!--td align="left">
						<input id="productIsDeductible" name="isDeductible" type="checkbox" value="1"/>可否抵扣
					</td-->
					<td align="left">
						<input id="productIsInterest" name="isInterest" type="checkbox" value="1"/>可否加息
					</td>
					<td align="left">
						<input id="productIsCash" name="isCash" type="checkbox" value="1"/>可否返现
					</td>
					<td align="left">
						<input id="productIsDouble" name="isDouble" type="checkbox" value="1"/>可否加倍
					</td>
					<td align="left">
						<input id="productIsRepair" name="isRepair" type="checkbox" value="1"/>可否补标
					</td>
				</tr>
				<tr>
					<td align="left">
						<input id="immediately" name="immediately" type="checkbox" value="1" checked="checked"/>红包是否实时返现
					</td>
				</tr>
				<tr>
					<td align="left">产品介绍：</td>
					<td colspan="4">
						<input id="productIntroduce" class="easyui-textbox" name="introduce" style="height:123px;width: 450px;" data-options="multiline:true,validType:'maxLength[2000]'"/>
					</td>
				</tr>
				<tr>	
					<td align="left">借款人：</td>
					<td colspan="4">
						<input id="productBorrower" class="easyui-textbox" name="borrower" style="height:123px;width: 450px;" data-options="multiline:true,validType:'maxLength[2000]'"/>
					</td>
				</tr>
				<tr>		
					<td align="left">还款来源：</td>
					<td colspan="4">
						<input id="productRepaySource" class="easyui-textbox" name="repaySource" style="height:123px;width: 450px;" data-options="multiline:true,validType:'maxLength[2000]'"/>
					</td>
				</tr>
				<tr>		
					<td align="left">风控措施：</td>
					<td colspan="4">
						<input id="productWindMeasure" class="easyui-textbox" name="windMeasure" style="height:123px;width: 450px;" data-options="multiline:true,validType:'maxLength[2000]'"/>
					</td>
				</tr>
				<tr id="isShowPic" style="display:none">
					<th></th>
					<th>图片名称(点击查看)</th>
					<th></th>
					<th>是否显示</th>
					<th>显示顺序(先显示数字小的)</th>
				</tr>
			</table>
		</div>
		<div title="产品扩展信息" class="easyui-panel" style="width:100%;height:auto;padding:10px;margin-bottom: 10px" data-options="collapsible:true,region:'center',tools:'#productExtendAddBtn'">
			<table id="addProductExtendTable" align="center" cellspacing="1" cellpadding="1" style="width: auto;">
			</table>
		</div>
		<div id="productExtendAddBtn">
			<a href="javascript:void(0)" class="icon-add" onclick="addProductExtend();"></a>
		</div>
		
		<div title="产品图片" class="easyui-panel" style="width:100%;height:auto;padding:10px;"data-options="collapsible:true,region:'center',tools:'#productPicAddBtn'">
			<table id="addProductPicTable" align="center" cellspacing="1" cellpadding="1" style="width: auto;">
				<tr>
					<th>图片名称</th>
					<th>选择图片</th>
					<th>是否显示</th>
					<th>显示顺序(先显示数字小的)</th>
					<th>操作</th>
				</tr>
			</table>
		</div>
		<div id="productPicAddBtn">
			<a href="javascript:void(0)" class="icon-add" onclick="addProductPic();"></a>
		</div>
		<!-- 显示图片 -->
		<div id="addProductPicShow" class="easyui-dialog" title="查看图片" style="height:auto;width:625px;padding:10px;top:40%" 
		data-options="closed:true,modal:true,minimizable:false,resizable:true,maximizable:false">
			<div id="imgbig">
				<img id="imglook" src="" width="600px" height="400px" />
			</div>
		</div>
		<!-- 显示图片 -->
		<div style="text-align:center;padding:30px 60px 30px 0px">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="addDrProductInfo();">提交审核</a>
		</div>
	</form>
</div>	
<div id="queryDrSubjectInfoWindow" class="easyui-window"
	data-options="closed:true,modal:true,minimizable:false,maximizable:false" style="padding:10px;">
</div>
<script type="text/javascript">
	var j=0;
	
	$("#sid").combobox({    
	    onSelect: function(rec){   
		    $.ajax({
				url: '${apppath}/product/getClaimsPicInfo.do?id='+$('#sid').combobox('getValue'),
				dataType:'json',
				success:function(result){
					$(".isShowPicInfo").remove();
					if(result != ''){
						$.each(result, function (n, v) {
						var tr = "<tr class='isShowPicInfo'><td></td><td>"+
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
					   	   		"<td><input name=\"drClaimsPic["+n+"].showSort\" value="+v.showSort+" type='text' class='easyui-numberbox' data-options='min:0,max:20,required:false'/>" +
					   	   		"</td></tr>"; 
							$('#productInfo').append(tr);
							$('.easyui-numberbox').numberbox({    
							}); 
						});
					}
				}
			}); 
			//从债权-票据信息取到承兑人添加到承兑机构中
			$.ajax({
				url: '${apppath}/product/getDrClaimsBill.do?id='+$('#sid').combobox('getValue'),
				dataType:'json',
				success:function(result){
					if(result != ''){
// 						$('#accept').textbox('setValue',result.acceptor);
					}
				}
			}); 
       	}
	}); 

 	function addDrProductInfo(){
		var flag = $("#addDrProductInfoForm").form('enableValidation').form('validate') ;
		if(flag){
			$("#addDrProductInfoForm").ajaxSubmit({
				url:"${apppath}/product/addDrProductInfo.do",
				type:"POST",
				data:$("#addDrProductInfoForm").serialize(),
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
							parent.$('#main-center').tabs('close','产品新增');
						});
						$("#addDrProductInfoForm").resetForm(); // 提交后重置表单
					}else{
						$.messager.alert("提示信息",resultJson.errorMsg);
					}            	
				}
	        });
	        return false; // 阻止表单自动提交事件
		}
	} 
	
	//显示标的详情
	function queryDrSubjectInfoBtn(index){
		if($('#sid').combobox('getValue') == ""){
			$.messager.alert("提示信息","请关联标的");
			return;
		}
		$("#queryDrSubjectInfoWindow").window({
			title:"标的详情",
			width:$(this).width()*0.5,
			height:$(this).height()*0.6,
			href:"../product/showDrSubjectInfo.do?id="+$('#sid').combobox('getValue'),
		});
		$("#queryDrSubjectInfoWindow").window("open").window("center");
	}
	
	//复制操作
	function copyDrProductInfo(){
		$.ajax({
			url: "${apppath}/product/copyDrProductInfo.do?code="+$("#productCode").val(),
			dataType:"json",
			success:function(result){
				if(result.success){
					$("#productType").combobox('select',result.map.drProductInfo.type);
					
					if(2 == result.map.drProductInfo.type){
						$('.isShowPicInfo').remove();
						$("#sid").combobox({    
						    url:'${apppath}/product/getDrSubjectInfo.do?type='+result.map.drProductInfo.type,  
						    valueField:'id',    
						    textField:'name',
						    onLoadSuccess:function(){
						    	$('.isShowPicInfo').remove();
						    	var data = $('#sid').combobox('getData');
					            if (data.length > 0) {
					            	$.each(data, function (n, v) {
					            		if(v.id == result.map.drProductInfo.sid){
					            			$("#sid").combobox('select',result.map.drProductInfo.sid);
					            		}
					                });
					            }
						    }
						});
						if(typeof(result.map.drClaimsPic) != "undefined"){
							$.each(result.map.drClaimsPic, function (n, v) {
								var tr = "<tr class='isShowPicInfo' ><td></td><td>"+
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
								   	   		"<td><input name=\"drClaimsPic["+n+"].showSort\" value="+v.showSort+" type='text' class='easyui-numberbox' data-options='min:0,max:20,required:false'/>" +
								   	   		"</td></tr>"; 
								$('#productInfo').append(tr);
								$('.easyui-numberbox').numberbox({    
								}); 
							});
						}
					}
		
					$("#productFullName").textbox('setValue',result.map.drProductInfo.fullName);
					$("#productSimpleName").textbox('setValue',result.map.drProductInfo.simpleName);
					$("#productAmount").numberbox('setValue',result.map.drProductInfo.amount);
					$("#productRate").numberbox('setValue',result.map.drProductInfo.rate);
					$("#productActivityRate").numberbox('setValue',result.map.drProductInfo.activityRate);
					$("#productDeadline").numberbox('setValue',result.map.drProductInfo.deadline);
					$("#productLeastaAmount").numberbox('setValue',result.map.drProductInfo.leastaAmount);
					$("#productRaiseDeadline").numberbox('setValue',result.map.drProductInfo.raiseDeadline);
					$("#productIncreasAmount").numberbox('setValue',result.map.drProductInfo.increasAmount);	
					$("#productMaxAmount").numberbox('setValue',result.map.drProductInfo.maxAmount);
					if(1 == result.map.drProductInfo.isShow){
						$("#productIsShow").attr("checked",'true');
					}
					if(1 == result.map.drProductInfo.isHot){
						$("#productIsHot").attr("checked",'true');
					}
					if(1 == result.map.drProductInfo.isDeductible){
						$("#productIsDeductible").attr("checked",'true');
					}
					if(1 == result.map.drProductInfo.isInterest){
						$("#productIsInterest").attr("checked",'true');
					}
					if(1 == result.map.drProductInfo.isRepair){
						$("#productIsRepair").attr("checked",'true');
					}
					if(1 == result.map.drProductInfo.isCash){
						$("#productIsCash").attr("checked",'true');
					}		
					if(1 == result.map.drProductInfo.isDouble){
						$("#productIsDouble").attr("checked",'true');
					}				
					$("#productIntroduce").textbox('setValue',result.map.drProductInfo.introduce);
					$("#productBorrower").textbox('setValue',result.map.drProductInfo.borrower);	
					$("#productRepaySource").textbox('setValue',result.map.drProductInfo.repaySource);
					$("#productWindMeasure").textbox('setValue',result.map.drProductInfo.windMeasure);	
					$("#accept").textbox('setValue',result.map.drProductInfo.accept);			
					$("#pcUrl").textbox('setValue',result.map.drProductInfo.pcUrl);
					$("#appUrl").textbox('setValue',result.map.drProductInfo.appUrl);
					$("#addProductExtendTable tr").remove();
					$.each(result.map.drProductExtend, function (n, v) {
						var tr = "<tr><td>"+
								"标题：<input name=\"drProductExtend["+n+"].title\" value="+v.title+" type='text' class='easyui-textbox' data-options=\"validType:'maxLength[50]'\"/>"+
								"</td>" +
								"<td>" +
								"内容：<input class='easyui-textbox' name=\"drProductExtend["+n+"].content\" value="+v.content+" style='height:60px;width: 450px;' data-options=\"multiline:true,validType:'maxLength[2000]'\"/>"+
								"</td>" +
					   	   		"<td><div class='btn-group'>" +
					   	   		"<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-remove' onclick='delExtend(this)'> " +
					   	   		"删除</a></div></td></tr>"; 
						$("#addProductExtendTable").append(tr);
						$('.easyui-textbox').textbox({    
						}); 
						$('.easyui-linkbutton').linkbutton({    
						});
						j++;
					});		
				}else{
					$.messager.alert("提示信息",result.errorMsg);
				}
			}
	  	});
	};
	
	//显示照片
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
	
	var i=0;
		//添加图片
	function addProductPic(){
		var tr = "<tr><td>"+
			"<input name=\"drProductPic["+i+"].name\" type='text' class='easyui-textbox' data-options=\"validType:'maxLength[50]'\"/>"+
			"</td>" +
			"<td>" +
			"<input name=\"drProductPic["+i+"].bigUrl\"  type='hidden'/>"+
			"<input type='file' name='productFiles' onchange=\"addVerifyImage(this)\" style='width:240px; white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'/>"+
			"</td>" +
			"<td>"+
				"<input class='check-box checked' type='checkbox' name=\"drProductPic["+i+"].isShow\" value='1' checked='checked' onclick='changeOptions(this)'/>"+
			"</td>"+
	   	   	"<td><input name=\"drProductPic["+i+"].showSort\" type='text' class='easyui-numberbox' style='width: 100px' data-options='min:0,max:20,required:true'/>" +
	   	   	"</td>"+
   	   		"<td><div class='btn-group'>" +
   	   		"<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-search' onclick=\"addPreviewImage(this)\">"+
   	   		"查看</a>"+" "+"<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-remove' onclick='delPic(this)'> " +
   	   		"删除</a></div></td></tr>"; 
		$("#addProductPicTable").append(tr);
		$('.easyui-textbox').textbox({    
		}); 
		$('.easyui-numberbox').numberbox({    
		}); 
		$('.easyui-linkbutton').linkbutton({    
		});
		i++;
	}
	
		//添加产品扩展信息
	function addProductExtend(){
		var tr = "<tr><td>"+
			"标题：<input name=\"drProductExtend["+j+"].title\" type='text' class='easyui-textbox' data-options=\"validType:'maxLength[50]'\"/>"+
			"</td>" +
			"<td>" +
			"内容：<input class='easyui-textbox' name=\"drProductExtend["+j+"].content\" style='height:60px;width: 450px;' data-options=\"multiline:true,validType:'maxLength[2000]'\"/>"+
			"</td>" +
   	   		"<td><div class='btn-group'>" +
   	   		"<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-remove' onclick='delExtend(this)'> " +
   	   		"删除</a></div></td></tr>"; 
		$("#addProductExtendTable").append(tr);
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
	function addVerifyImage(ths) {
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
    	return true;  
	}
	
	//图片预览
	function addPreviewImage(ths) {
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
		$('#addProductPicShow').dialog('open');
		return true;
	}	
	
	function delPic(obj){
		$(obj).parent().parent().parent().remove();
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
