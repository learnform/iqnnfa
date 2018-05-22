<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@ include file="../../../common/include/util.jsp" %>
</head>
<body>
<table id="sysIpList" title="IP管理"
       class="easyui-datagrid" style="height:99%;width:99.9%"
       data-options="singleSelect:true,
	    fitColumns:true, url: '../access/getAccessControlList.do',
	    method:'post',rownumbers:true, 
	    pagination:true,toolbar:'#access_tools'">
    <thead>
    <tr>
        <th data-options="field:'id'" hidden="true">主键</th>
        <th data-options="field:'ip'" width="10%">IP地址</th>
         <th data-options="field:'name'" width="10%">创建人</th>
        <th data-options="field:'addTime'" formatter="formatDateBoxFull" width="20%">创建时间</th>
        <th data-options="field:'remark'" width="25%">备注</th>
        <th data-options="field:'_operate', align:'center'" width="10%" formatter="formatOper">操作</th>
    </tr>
    </thead>
</table>
<div id="access_tools" style="padding:5px;height:20px ">
    <form id="selectSysIpForm">
    	IP地址:<input id="searchInfoByIp" name="ip" class="easyui-textbox" size="15"
                    style="width:200px"/>
        &nbsp;&nbsp;
        <a id="searchActivityBtn" href="#" class="easyui-linkbutton" iconCls="icon-search">查询</a>
        <a id="resetDrProductInfo" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload">重置</a>
        &nbsp;&nbsp;
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="addSysIPDialog()">新增IP</a>
    </form>
</div>

<!-- 新增IP -->
	<div id="addSysIPDialog" class="easyui-dialog" title="新增IP"
		data-options="iconCls:'icon-edit',closed:true,modal:true,minimizable:false,resizable:true,maximizable:false,buttons:'#addSysIpBtn'"
		style="width:450px;height:250px;padding:40px;">
		<form id="addSysIPForm">
			<table align="center">
				<!-- <input type="text" name="type" hidden="hidden" value="1" readonly="readonly"/> -->
				<tr style="height: 8px;">
					<td  style="width:70px">IP地址:</td>
					<td><input type="text" name="ip" class="easyui-textbox" data-options="required:true"/></td>
				</tr>
				<tr style="height: 8px;">
				<td style="width:70px">备注:</td>
					<td><input type="text" name="remark" class="easyui-textbox" data-options="required:false" />
					</td></tr>
			</table>
		</form>
		<div id="#addSysIpBtn" align="center" style="margin-top:10px;">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="addSysIp()">添加</a>
		</div>
	</div>


<script>
	
	//查询按钮
	$('#searchActivityBtn').click(function(){
 		$('#sysIpList').datagrid({
			queryParams: {
				ip:$('#searchInfoByIp').val(),
			}
		}); 
	});
	
	
	//删除ip操作
	function delSysIp(index){
		$('#sysIpList').datagrid('selectRow',index);// 关键在这里 
	    var row = $('#sysIpList').datagrid('getSelected'); 
	$.ajax({
	     	url: "${apppath}/access/delSysIp.do?id="+row.id+"&ip="+row.ip,
	     	dataType:"json",  
	       	success:function(result){
				if(result.success){
					$.messager.alert("提示信息",result.msg);
					$("#sysIpList").datagrid("reload");
					$("#addSysIPDialog").dialog("close");
				}else{
					$.messager.alert("提示信息",result.errorMsg);
				}
			}	
	   	});
	}
    //添加基本操作链接
    function formatOper(val, row, index) {
        return '<a href="#" class="btn l-btn l-btn-small" onclick="delSysIp('+index+')">删除</a>';
    }
    
    
	//跳转到IP添加页面
	function addSysIPDialog(){  
		$("#addSysIPForm").form("reset");
		$("#addSysIPDialog").dialog("open");
	}
	//添加ip操作
	function addSysIp(){
	$.ajax({
         	url: "${apppath}/access/addSysIp.do",
           	type: 'POST',
           	data:$("#addSysIPForm").serialize(),  
           	success:function(result){
				if(result.success){
					$.messager.alert("提示信息",result.msg);
					$("#sysIpList").datagrid("reload");
					$("#addSysIPDialog").dialog("close");
				}else{
					$.messager.alert("提示信息",result.errorMsg);
				}
			}	
       	});
	}
</script>

</body>
</html>

