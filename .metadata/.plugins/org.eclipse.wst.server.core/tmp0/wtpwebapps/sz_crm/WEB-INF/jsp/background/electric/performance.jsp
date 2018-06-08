<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
	<%@ include file="../../common/util.jsp" %>
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/js/easyUI/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/js/easyUI/themes/icon.css">
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/utils/jquery.form.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div id="importPerformanceDialog" class="easyui-dialog" title="导入Excel"
		data-options="iconCls:'icon-edit',closed:false,modal:true,minimizable:false,resizable:true,maximizable:false,buttons:'#importPerformanceDialogBtn'"
		style="width:420px;height:200px;padding:15px;">
		<form id="importPerformanceForm" enctype="multipart/form-data">
			<table align="center">
				<tr>
					<td>Excel文件</td>
					<td colspan="2">
						<input id="importPerformanceFile" type="file" name="file" onchange="verifyFile(this)"/>
					</td>
				</tr>
			</table>
		</form>
		<form id="outputPerformanceForm" enctype="multipart/form-data">
				<table align="center">
					<tr>
						<td>起始时间</td>
						<td colspan="2">
							<input id="startDate"  name="startDate" class="easyui-datebox"/>
						</td>
					</tr>
					<tr>
						<td>截止时间</td>
						<td colspan="2">
							<input id="endDate"  name="endDate" class="easyui-datebox"/>
						</td>
					</tr>
					<%--<input id="path"  name="path" type="hidden"/>--%>
				</table>
			</form>
		<div id="importPerformanceDialogBtn">
			<a id="importPerformance" href="javascript:void(0)" class="easyui-linkbutton" >导入</a>
			<a id="outputPerformance" href="javascript:void(0)" class="easyui-linkbutton" >导出</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeDialog()">取消</a>
		</div>
	</div>
		
<script type="text/javascript">
	
	//上传excel
	$('#importPerformance').click(function(){
		$("#importPerformanceForm").ajaxSubmit({
			url:"${apppath}/performance/inputPerformance.html",
			type:"POST",
			data:$("#importPerformanceForm").serialize(),
            success:function(result){
//				$("#path").val(result);
                $.messager.alert("操作", '成功导入:' + result +'条数据！');
			}
		});
	});

    $('#outputPerformance').click(function(){
//        var a =$('#importPerformanceFile').val();
//        var arr = a.split('\\');
        window.location.href="${apppath}/performance/outPerformance.html?startDate="+$('#startDate').datebox('getValue')+
            "&endDate="+$('#endDate').datebox('getValue');
//			+ "&path="+$('#path').val()+"&fileName="+arr[arr.length-1];
    });

	//验证文件
	function verifyFile(obj) {
		if (obj.value == "") {  
			$.messager.alert("提示信息","请上传文件");
	        return false;  
	    } 
        if (! /\.(xls|xlsx)$/.test(obj.value)) {  
        	$.messager.alert("提示信息","文件类型必须是Excel");
            obj.value = "";  
            return false;  
        }
    	return true;  
	}
</script>
</body>
</html>