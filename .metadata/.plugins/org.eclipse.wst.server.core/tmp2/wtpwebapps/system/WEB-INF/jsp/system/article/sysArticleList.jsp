﻿<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${apppath }/js/easyUI/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${apppath }/js/easyUI/themes/icon.css">
<script type="text/javascript" src="${apppath }/js/easyUI/jquery.min.js"></script>
<script type="text/javascript" src="${apppath }/js/easyUI/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${apppath }/js/easyUI/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${apppath }/js/easyUI/validatebox.js"></script>
</head>
<body>
	<table id="articleList" title="文章列表 " 
	class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:true,
	    fitColumns:true, url: '${apppath }/article/articleList.do',
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#articleTools',onLoadSuccess:articleBtn">
		<thead>
	    <tr>
	    	<th data-options="field:'artiId'" width="10%" hidden="true">ID</th>
	    	<th data-options="field:'isrecommend'" width="10%" hidden="true">推荐</th>
	        <th data-options="field:'title'" width="20%">文章标题</th>
	        <th data-options="field:'proName'" width="10%">栏目</th>
	       	<th data-options="field:'ishead'" width="3%" formatter="formatIsHead">头条</th>
	       	<th data-options="field:'createName'" width="10%">创建人</th>	     
	       	<th data-options="field:'updateName'" width="10%">最后操作人</th>
	       	<th data-options="field:'updateTime'" width="10%" formatter="formatDate">最后编辑时间</th>	      	
			<th data-options="field:'createTime'" width="10%" formatter="formatDate">发布时间</th>
			<th data-options="field:'status'" width="3%" formatter="formatStatus">状态</th>
			<th data-options="field:'_operate',width:80,align:'center',formatter:formatOper" width="20%">基本操作</th>
	    </tr>
	    </thead>
	</table>
	<div id="articleTools" style="padding:5px;height:750">
	  	<form id="articleForm">
	  		所属栏目: <select  id="searchArticleProId" name="proId" style="width:100px;" class="easyui-combobox">
				 	<option value=''>全部</option>
					<c:forEach items="${sysProgram}" var="vt">
						<option value='${vt.proId}'>${vt.proName}</option>
					</c:forEach>
	           		</select>
	  		发布时间:<input id="searchArticleStartDate" name="startDate" class="easyui-datetimebox" style="width:150px"/>
	  		至<input id="searchArticleEndDate" name="endDate" class="easyui-datetimebox" style="width:150px"/>
	  		文章标题:<input id="searchArticleTitle" name="title" class="easyui-textbox"  size="15" style="width:200px"/>
			是否头条: <select  id="searchArticleIshead" name="ishead" style="width:100px;" class="easyui-combobox">
				 	<option value=''>全部</option>
					<option value='0'>否</option>
					<option value='1'>是</option>
	           		</select>
	    	<a id="searchArticleBtn" href="#" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	    	<a id=resetArticleBtn href="#" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="addArticleBtn()">新增文章</a>
	    </form>
	</div>
<script type="text/javascript">
	function articleBtn (){
			$('.articleBtn').linkbutton();
	}
	//时间格式
	function formatDate(value,row,index){ 
		if(value == null){
			return "";
		}
		var unixTimestamp = new Date(value);  
		return unixTimestamp.toLocaleString();  
	} 
	//重置按钮
	$('#resetArticleBtn').click(function(){
		$("#articleForm").form("reset");
		$("#articleList").datagrid("load", {});
	});
	//查询按钮
	$('#searchArticleBtn').click(function(){
 		$('#articleList').datagrid({
			queryParams: {
				startDate: $('#searchArticleStartDate').datebox('getValue'),
				endDate: $('#searchArticleEndDate').datebox('getValue'),
				title: $('#searchArticleTitle').val(),
				ishead: $('#searchArticleIshead').combobox("getValue"),
				proId: $('#searchArticleProId').combobox("getValue"),
			}
		}); 
	});
	
	//添加基本操作链接
	function formatOper(val,row,index){ 
		var articleOper = '<a href="#" class="articleBtn" onclick="showArticle('+index+')">查看</a>'+' ';
		if(row.status == 1){
			articleOper +='<a href="#" class="articleBtn" onclick="toArticleUpdate('+index+')">修改</a>'+' ';
			articleOper +='<a href="#" class="articleBtn" onclick="deleteArticle('+index+')">删除</a>'+' ';
		}
		if(row.status == 0){
			articleOper +='<a href="#" class="articleBtn" onclick="toArticleUpdate('+index+')">修改</a>'+' ';
			articleOper +='<a href="#" class="articleBtn" onclick="refuseAtricle('+index+')">拒绝</a>'+' ';
			articleOper +='<a href="#" class="articleBtn" onclick="recoverAtricle('+index+')">审核</a>'+' ';
		}
		if(row.status == 2){
			articleOper +='<a href="#" class="articleBtn" onclick="toArticleUpdate('+index+')">修改</a>'+' ';
			articleOper +='<a href="#" class="articleBtn" onclick="recoverAtricle('+index+')">恢复</a>'+' ';
		}
		if(row.isrecommend == 0 && row.status == 1){
			articleOper +='<a href="#" class="articleBtn" onclick="isrecommendArticle('+index+')">推荐</a>'+' ';
		}
		return articleOper;
	} 	
	
	//跳转文章修改页面
 	function toArticleUpdate(index){
		$('#articleList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#articleList').datagrid('getSelected'); 
		var mainTab = parent.$('#main-center');
		var detailTab = {
				title : "修改文章",
				content:"<iframe width='100%' height='100%' frameborder='0' src='${apppath}/article/toArticleUpdate.do?artiId="+row.artiId+"' ></iframe>",
				closable : true
		};
		var tab = mainTab.tabs("getSelected");
		var index = mainTab.tabs('getTabIndex',tab);
		/* if(index != 0){
			mainTab.tabs('close',index);
		} */
		mainTab.tabs("add",detailTab);
	} 
	
	//跳转文章显示页面
 	function showArticle(index){
		$('#articleList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#articleList').datagrid('getSelected'); 
		var mainTab = parent.$('#main-center');
		var detailTab = {
				title : "查看文章",
				content:"<iframe width='100%' height='100%' frameborder='0' src='${apppath}/article/showArticle.do?artiId="+row.artiId+"' ></iframe>",
				closable : true
		};
		var tab = mainTab.tabs("getSelected");
		var index = mainTab.tabs('getTabIndex',tab);
		/* if(index != 0){
			mainTab.tabs('close',index);
		} */
		mainTab.tabs("add",detailTab);
	} 
	
	//修改显示状态信息
	function formatStatus(value,row,index){
		if(row.status=="0"){
			return '审核中';
		}else if(row.status=="1"){
			return '已审核';
		}else if(row.status=="2"){
			return '已拒绝';
		}
	}
	
	//修改显示是否头条信息
	function formatIsHead(value,row,index){
		if(row.ishead=="0"){
			return '否';
		}else if(row.ishead=="1"){
			return '是';
		}
	}
	//跳转文章添加页面
	function addArticleBtn(){  
		var mainTab = parent.$('#main-center');
		var detailTab = {
				title : "添加文章",
				content:"<iframe width='100%' height='100%' frameborder='0' src='${apppath}/article/toArticleAdd.do' ></iframe>",
				closable : true
		};
		var tab = mainTab.tabs("getSelected");
		var index = mainTab.tabs('getTabIndex',tab);
		/* if(index != 0){
			mainTab.tabs('close',index);
		} */
		mainTab.tabs("add",detailTab);
	}
	
	function deleteArticle(index) {
		$('#articleList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#articleList').datagrid('getSelected'); 
        $.messager.confirm('操作提示', '确定要删除吗?', function(r){
        	if(r){
	            $.ajax({
	            	url: "${apppath}/article/deleteArticle.do?artiId="+row.artiId,
	                type: 'POST',
	               success:function(result){
						if(result.success){
							$.messager.alert("提示信息",result.msg);
							$("#articleList").datagrid("reload");
						}else{
							$.messager.alert("提示信息",result.errorMsg);
						}
					}
	            });
            }
        });
 	}
 	
 	function isrecommendArticle(index) {
 		$('#articleList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#articleList').datagrid('getSelected'); 
		$.ajax({
	       	url: "${apppath}/article/isrecommendArticle.do?artiId="+row.artiId,
	        type: 'POST',
	        success:function(result){
				if(result.success){
					$.messager.alert("提示信息",result.msg);
					$("#articleList").datagrid("reload");
				}else{
					$.messager.alert("提示信息",result.errorMsg);
				}
			}
       });
 	}
 	
 	function recoverAtricle(index) {
 		$('#articleList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#articleList').datagrid('getSelected'); 
		$.ajax({
	       	url: "${apppath}/article/recoverAtricle.do?artiId="+row.artiId,
	        type: 'POST',
	        success:function(result){
				if(result.success){
					$.messager.alert("提示信息",result.msg);
					$("#articleList").datagrid("reload");
				}else{
					$.messager.alert("提示信息",result.errorMsg);
				}
			}
       });
 	}
 	
 	function refuseAtricle(index) {
 		$('#articleList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#articleList').datagrid('getSelected'); 
		$.ajax({
	       	url: "${apppath}/article/refuseAtricle.do?artiId="+row.artiId,
	        type: 'POST',
	        success:function(result){
				if(result.success){
					$.messager.alert("提示信息",result.msg);
					$("#articleList").datagrid("reload");
				}else{
					$.messager.alert("提示信息",result.errorMsg);
				}
			}
       });
 	}
	
</script>
</body>
</html>

