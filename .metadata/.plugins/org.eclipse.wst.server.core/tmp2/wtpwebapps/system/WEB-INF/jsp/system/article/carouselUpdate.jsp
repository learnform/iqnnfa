<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
<script type="text/javascript" src="../js/common/jquery.form.js"></script>
</head>
<body>
<div class="easyui-panel" style="width:100%;height:auto;padding:10px;">
<form id="updateSysBannerForm" enctype="multipart/form-data">
<input name="id" type="hidden" value="${sysBanner.id}" />
	<table>
		<tr>
			<td>
				名称<span style="color: red;">*</span>:
				<input type="text" name="title" size="50" value="${sysBanner.title}" class="easyui-textbox" data-options="required:true,prompt:'最多输入20个字',multiline:true,validType:'maxLength[20]'" />
			</td>
		</tr>
		<tr>	
			<td>
				展示位置：
				<input id="ios" name="isIos" value="1" type="checkbox" <c:if test="${sysBanner.isIos == 1}"> checked="checked" </c:if>/>IOS
				<input id="android" name="isAndroid"  value="1" type="checkbox" <c:if test="${sysBanner.isAndroid == 1}"> checked="checked" </c:if>/>Android
				<input id="H5" name="isH5" type="checkbox"  value="1" <c:if test="${sysBanner.isH5 == 1}"> checked="checked" </c:if>/>H5
			</td>
		</tr>
		<tr>
			<td>
				排序<span style="color: red;">*</span>:
				<input type="text" name="sort" value="${sysBanner.sort}" class="easyui-numberbox" data-options="required:true,min:0,max:9,prompt:'可输入0~99的任意数字，数字越大排序越靠前'" />
			</td>
		</tr>
		<tr hidden="true">	
			<td>
				广告位置<span style="color: red;">*</span>:
				<select id="code" name="code" style="width:100px;" class="easyui-combobox">
					<option value="7" selected="selected">轮播图</option>
	           	</select>
			</td>
		</tr>
		<tr>
			<td>
				上传图片<span style="color: red;">*</span>:
			</td>
		</tr>
		<tr>
			<td>		
				<input type="file" id="bannerUpdPicFile" name="bannerUpdPicFile" onchange="PreviewImage(this)" />
					<div style="color:gray;" id="size"></div>
				<img src="${sysBanner.imgUrl}" id="showBannerUpdPic"  height="160" width="200"  /> 
			</td>
		</tr>
		<tr>	
			<td>
				链接内容<span style="color: red;">*</span>:
				<input type="text" name="location" value="${sysBanner.location}" class="easyui-textbox" data-options="required:true"/>
				<div style="color:red">请以http://格式输入如：http://www.baidu.com</div>
			</td>
		</tr>
	</table>
</form>
<div style="text-align:center;padding:30px 60px 10px 0px">
	<a id="picAddBtn" href="javascript:void(0)" data-options="iconCls:'icon-save'"
	class="easyui-linkbutton" onclick="updateSysBanner()">修改</a>
</div>
</div>

<script type="text/javascript">
	$(function(){
		 	var screenImage = $("#showBannerUpdPic");
		    var theImage = new Image();
		    theImage.src = screenImage.attr("src");
		    $("#size").html("已上传的图片尺寸："+theImage.width+"*"+theImage.height);
	})

	function updateSysBanner(){
// 		var isIos= document.getElementById('ios').checked;
// 		var isAndroid= document.getElementById('android').checked;
// 		var isH5= document.getElementById('H5').checked;
// 		if(isIos==false && isAndroid==false && isH5 == false){
// 			$.messager.alert("提示信息","请选择图片展示的位置！");
// 			return;
// 		}
		
		var validate = $("#updateSysBannerForm").form("validate");
		if(!validate){
			return false;
		}
		$("#updateSysBannerForm").ajaxSubmit({
            type: 'post', // 提交方式 get/post
            url: '${apppath}/banner/updateSysBanner.do', // 需要提交的 url
            success: function(result) { // data 保存提交后返回的数据，一般为 json 数据
               	var resultJson = jQuery.parseJSON(result);
            	if(resultJson.success){
					$.messager.alert("提示信息",resultJson.msg,"",function(){
						var currTab = parent.$('#main-center').tabs('getTab', "发现轮播");
						var content = '<iframe scrolling="no" frameborder="0"  src="../banner/toCarouselList.do" style="width:100%;height:100%;"></iframe>';  
						parent.$('#main-center').tabs('update', {
							tab: currTab,
							options: {
								content: content  // 新内容的URL
							}
						});
						parent.$('#main-center').tabs('close','修改轮播');
						$("#carouselList").datagrid("reload");
					});
            		$("#updateSysBannerForm").resetForm(); // 提交后重置表单
				}else{
					$.messager.alert("提示信息",resultJson.msg);
				};
            }
        });
        return false; // 阻止表单自动提交事件
	};

	//图片预览
	function PreviewImage(bannerUpdPicFile) {
		if (bannerUpdPicFile.value == "") {  
			$.messager.alert("提示信息","请上传图片");
	        return false;  
	    } 
        if (!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(bannerUpdPicFile.value)) {  
        	$.messager.alert("提示信息","图片类型必须是.gif,jpeg,jpg,png中的一种");
            bannerUpdPicFile.value = "";  
            return false;  
        }
	    if(bannerUpdPicFile){  
			if (window.navigator.userAgent.indexOf("MSIE")>=1 && !(navigator.userAgent.indexOf("MSIE 10.0") > 0)){    
				bannerUpdPicFile.select();
				var imgSrc = document.selection.createRange().text;
				var localImagId = document.getElementById("showBannerUpdPic");
				localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
				imgObjPreview.style.display = 'none';
				document.selection.empty();
      		}else{ 
                if(bannerUpdPicFile.files)  
                {  
                	$("#showBannerUpdPic").attr("src",window.URL.createObjectURL(bannerUpdPicFile.files[0]));  
                }  
             }
         }  
		return true;
	}
</script>
</body>
</html>

