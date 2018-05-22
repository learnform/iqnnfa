<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp"%>
</head>
<body>
    <div style="width:auto;height:99%;padding:1px;">
    	<form id="awardPrizeForm">
    		<div style="width:auto;height:110px;" align="center">
	    		<table>
					<tr>
	    				<td style="width:80px" align="right">奖品ID：</td>
	    				<td >
	    					<input type="text" name="luckDrawId" id="luckDrawId" value="${drLuckDraw.id}" class="easyui-textbox" style="border-style:none" disabled="disabled"/>
	    				</td>
	    			</tr>
	    			<tr hidden="true">
	    				<td colspan="2">
	    					<input type="hidden" name="id" id="id" value="${drLuckDraw.configId}" class="easyui-textbox" style="border-style:none" disabled="disabled"/>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td style="width:80px" align="right">奖品类型：</td>
	    				<td >
	    					<input type="text" name="type" value="${drLuckDraw.type}" class="easyui-textbox" style="border-style:none" disabled="disabled"/>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td style="width:80px" align="right">奖品名称：</td>
	    				<td>
	    					<input type="text" class="easyui-textbox" value="${drLuckDraw.name}" name="name" disabled="disabled">
	    				</td>
	    			</tr>
	    			<tr>
	    				<td align="right">库存数量：</td>
	    				<td>
	    					<input type="text" class="easyui-textbox" value="${drLuckDraw.prizecount}" name="prizeCount" disabled="disabled">
	    				</td>
	    			</tr>
	    			<tr>
	    				<td align="right">已抽数量：</td>
	    				<td>
	    					<input type="text" class="easyui-textbox" value="${drLuckDraw.givecount}" name="giveCount" disabled="disabled"/>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td align="right">奖品总量：</td>
	    				<td>
							<input type="text" class="easyui-textbox" value="${drLuckDraw.totalcount}" name="totalCount" disabled="disabled"/>
	    				<td/>
	    			</tr>
	    			<tr>
	    				<td align="right">第一次抽奖几率：</td>
	    				<td>
							<input type="text" class="easyui-textbox" value="${drLuckDraw.luckDrawIdRateFirst}" id="luckDrawIdRateFirst" name="luckDrawIdRateFirst"/>
	    				<td/>
	    			</tr>
	    			<tr>
	    				<td align="right">第二次抽奖几率：</td>
	    				<td>
							<input type="text" class="easyui-textbox" value="${drLuckDraw.luckDrawRateSecord}" id="luckDrawRateSecord" name="luckDrawRateSecord"/>
	    				<td/>
	    			</tr>
	    			<tr align="center">
	    				<td colspan="2"><a href="javascript:void(0)" class="easyui-linkbutton" onclick="save()">保存</a>
	    				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeDialog()">取消</a></td>
	    			</tr>
	    		</table>
    		</div>
    	</form>
    </div>
    <script type="text/javascript">
    function save(){
    	var first=$("#luckDrawIdRateFirst").val();
    	var second=$("#luckDrawRateSecord").val();
    	var luckDrawId =$("#luckDrawId").val();
    	var id = $("#id").val();
    	var parameter={
    			first:first,
    			luckDrawId:luckDrawId,
    			second:second,
    			id:id
    	    };
    	$.ajax({
    		url:"${apppath}/luckDraw/saveConfig.do",
			type:"POST",
			data:parameter, 
			success:function(result){
				if(result.success){
					$.messager.alert("提示信息",result.msg);
					$("#update").window("close");
					$("#configList").datagrid("reload");
				}else{
					$.messager.alert("提示信息",result.errorMsg);
				}
			}
    	});
    }
    
    function closeDialog(){  
    	$("#update").dialog("close");
    }
	</script>
</body>
</html>
