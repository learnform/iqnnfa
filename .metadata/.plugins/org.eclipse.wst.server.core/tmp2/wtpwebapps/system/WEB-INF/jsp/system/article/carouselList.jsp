<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
<script type="text/javascript" src="../js/common/jquery.form.js"></script>
</head>
<body>
	<table id="carouselList" title="轮播列表 " 
	class="easyui-datagrid" style="height:99%;width:99.9%"
	data-options="singleSelect:true,iconCls: 'icon-edit',
	    fitColumns:true, url: '../banner/sysBannerList.do?code=7',
	    method:'post',rownumbers:true,
	    pagination:true,toolbar:'#sysBannerTools'">
		<thead>
	    <tr>
	    	<th data-options="field:'id'" width="10%" hidden="true">ID</th>
	        <th data-options="field:'title'" width="10%">名称</th>
	       	<th data-options="field:'sort',editor:'text'" formatter="formatImg" width="4%">排序</th>
			<th data-options="field:'imgUrl'" width="15%" formatter="formatPic">图片缩略图</th>
			<th data-options="field:'location'" width="10%">链接</th>
			<th data-options="field:'isIos'" width="10%" formatter="formatIOS">IOS</th>
			<th data-options="field:'isAndroid'" width="10%" formatter="formatAndroid">Android</th>
			<th data-options="field:'isH5'" width="10%" formatter="formatH5">H5</th>
			<th data-options="field:'_operate',width:80,align:'center',formatter:formatOper" width="10%">基本操作</th>
	    </tr>
	    </thead>
	</table>
	<div id="sysBannerTools" style="padding:5px;height:750">
		<form id="sysBannerForm">
	  		名称:<input id="searchSysBannerTitle" name="title" class="easyui-textbox"  size="15" style="width:200px"/>
			排序: <input id="searchSysBannerSort" name="sort" class="easyui-textbox"  size="15" style="width:200px"/>
	    	<a id="searchSysBannerBtn" href="#" class="easyui-linkbutton" iconCls="icon-search">查询</a>
	    	<a id=resetSysBannerBtn href="#" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="addSysBannerWindow()">新增轮播</a>
	    </form>
	</div>
	<div id="addSysBannerWindow" class="easyui-window"
		data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:false,maximizable:false" style="width:500px;height:560px;padding:10px;">
	</div>
	<div id="updateSysBannerWindow" class="easyui-window"
		data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:false,maximizable:false" style="width:500px;height:560px;padding:10px;">
	</div>
<script type="text/javascript">
	//列表编辑
	$.extend($.fn.datagrid.methods, {
	editCell: function(jq,param){
		return jq.each(function(){
			var fields = $(this).datagrid('getColumnFields',true).concat($(this).datagrid('getColumnFields'));
			for(var i=0; i<fields.length; i++){
				var col = $(this).datagrid('getColumnOption', fields[i]);
				col.editor1 = col.editor;
				if (fields[i] != param.field){
					col.editor = null;
				}
			}
			$(this).datagrid('beginEdit', param.index);
			for(var i=0; i<fields.length; i++){
				var col = $(this).datagrid('getColumnOption', fields[i]);
				col.editor = col.editor1;
			}
		});
		}
	});
	
	var editIndex = undefined;
	function endEditing(){
		if (editIndex == undefined){return true}
		if ($('#carouselList').datagrid('validateRow', editIndex)){
			$('#carouselList').datagrid('endEdit', editIndex);
			editIndex = undefined;
			return true;
		} else {
			return false;
		}
	}
	function onClickCell(index){
		if (endEditing()){
			$('#carouselList').datagrid('selectRow', index)
					.datagrid('editCell', {index:index,field:"sort"});
			var ed = $(carouselList).datagrid('getEditor', {index:index,field:"sort"});
			$(ed.target).focus();
			editIndex = index;
			$("input.datagrid-editable-input").bind("blur",function(evt){
				var afterSort= $("input.datagrid-editable-input").val();
		        save(index,afterSort);
		    });
		};
	}
	
	function save(index,afterSort){
		$('#carouselList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#carouselList').datagrid('getSelected'); 
	    $.ajax({
        	url: "${apppath}/banner/updateSort.do?id="+row.id+"&sort="+afterSort,
            type: 'POST',
           success:function(result){
				if(result.success){
					$("#carouselList").datagrid("reload");
				}else{
					$("#carouselList").datagrid("reload");
				}
			}
        });
	}
	
	//重置按钮
	$('#resetSysBannerBtn').click(function(){
		$("#sysBannerForm").form("reset");
		$("#carouselList").datagrid("load", {});
	});
	//查询按钮
	$('#searchSysBannerBtn').click(function(){
 		$('#carouselList').datagrid({
			queryParams: {
				title: $('#searchSysBannerTitle').val(),
				sort: $('#searchSysBannerSort').val()
			}
		}); 
	});
	
	//添加基本操作链接
	function formatOper(val,row,index){ 
		var articleOper="";
		if(row.status==1){
			articleOper += '<a href="#" class="btn l-btn l-btn-small" onclick="updateSysBannerWindow('+index+')">修改</a>'+' ';
			articleOper += '<a href="#" class="btn l-btn l-btn-small" onclick="deleteSysBanner('+index+')">删除</a>'+' ';
		}
		if(row.status==0){
			articleOper += '<a href="#" class="btn l-btn l-btn-small" onclick="recoverSysBanner('+index+')">恢复</a>'+' ';
		}
		return articleOper;
	} 	
	//跳转广告添加页面
	function addSysBannerWindow(){  
		var mainTab = parent.$('#main-center');
		var detailTab = {
				title : "添加轮播",
				content:"<iframe width='100%' height='100%' frameborder='0' src='${apppath}/banner/toCarouselAdd.do' ></iframe>",
				closable : true
		};
		var tab = mainTab.tabs("getSelected");
		var index = mainTab.tabs('getTabIndex',tab);
		/* if(index != 0){
			mainTab.tabs('close',index);
		} */
		mainTab.tabs("add",detailTab);
	}
	//跳转广告修改页面
	function updateSysBannerWindow(index){  
		$('#carouselList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#carouselList').datagrid('getSelected'); 
		var mainTab = parent.$('#main-center');
		var detailTab = {
				title : "修改轮播",
				content:"<iframe width='100%' height='100%' frameborder='0' src='${apppath}/banner/toCarouselUpdate.do?id="+row.id+"' ></iframe>",
				closable : true
		};
		var tab = mainTab.tabs("getSelected");
		var index = mainTab.tabs('getTabIndex',tab);
		/* if(index != 0){
			mainTab.tabs('close',index);
		} */
		mainTab.tabs("add",detailTab);
	}
	
	function deleteSysBanner(index) {
		$('#carouselList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#carouselList').datagrid('getSelected'); 
        $.messager.confirm('操作提示', '删除后不能恢复，确定要删除吗？', function(r){
        	if(r){
	            $.ajax({
	            	url: "${apppath}/banner/deleteCarousel.do?id="+row.id+"&imgUrl="+row.imgUrl,
	                type: 'POST',
	               success:function(result){
						if(result.success){
							$.messager.alert("提示信息",result.msg);
							$("#carouselList").datagrid("reload");
						}else{
							$.messager.alert("提示信息",result.errorMsg);
						}
					}
	            });
            }
        });
 	}
	
	
	function changeIos(index){
		$('#carouselList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#carouselList').datagrid('getSelected'); 
		var url = "${apppath}/banner/updateIos.do?id="+row.id+"&isIos="+row.isIos;
		$.ajax({
			url: url,
			dataType:"json",
			success:function(){
				$('#carouselList').datagrid('reload');
			}
	  	});
	}
	function changeAndroid(index){
		$('#carouselList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#carouselList').datagrid('getSelected'); 
		var url = "${apppath}/banner/updateAndroid.do?id="+row.id+"&isAndroid="+row.isAndroid;
		$.ajax({
			url: url,
			dataType:"json",
			success:function(){
				$('#carouselList').datagrid('reload');
			}
	  	});
	}
	function changeH5(index){
		$('#carouselList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#carouselList').datagrid('getSelected'); 
		var url = "${apppath}/banner/updateH5.do?id="+row.id+"&isH5="+row.isH5;
		$.ajax({
			url: url,
			dataType:"json",
			success:function(){
				$('#carouselList').datagrid('reload');
			}
	  	});
	}
	//展示隐藏
	function formatIOS(val,row,index){
		if(val==1){
			return '<a href="#" onclick="changeIos('+index+')" style="color:red;text-decoration:none">显示</a>';
		}else{
			return '<a href="#" onclick="changeIos('+index+')" style="color:blue;text-decoration:none">隐藏</a>';;
		}
	}
	
	function formatAndroid(val,row,index){
		if(val==1){
			return '<a href="#" onclick="changeAndroid('+index+')" style="color:red;text-decoration:none">显示</a>';
		}else{
			return '<a href="#" onclick="changeAndroid('+index+')" style="color:blue;text-decoration:none">隐藏</a>';;
		}
	}
	
	function formatH5(val,row,index){
		if(val==1){
			return '<a href="#" onclick="changeH5('+index+')" style="color:red;text-decoration:none">显示</a>';
		}else{
			return '<a href="#" onclick="changeH5('+index+')" style="color:blue;text-decoration:none">隐藏</a>';;
		}
	}
	
	function formatImg(val,row,index){
		return  row.sort+'<a href="#" id="edit'+index+'" onclick="onClickCell('+index+')">'
		+'<img style="width:15px; height:15px" src="${pageContext.servletContext.contextPath }/images/timg.jpg"></a>'
		+'<a href="#" style="display: none;" class="btn l-btn l-btn-small" id="save'+index+'" onclick="save('+index+')">保存</a>';
	}
	
	function formatPic(val,row,index){
		return  '<img src='+val+' id="showBannerUpdPic"  height="50" width="100"  /> ';
	}
 	
 	function recoverSysBanner(index) {
 		$('#carouselList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#carouselList').datagrid('getSelected'); 
		$.ajax({
	       	url: "${apppath}/banner/recoverSysBanner.do?id="+row.id,
	        type: 'POST',
	        success:function(result){
				if(result.success){
					$.messager.alert("提示信息",result.msg);
					$("#carouselList").datagrid("reload");
				}else{
					$.messager.alert("提示信息",result.errorMsg);
				}
			}
       });
 	}
	
</script>
</body>
</html>

