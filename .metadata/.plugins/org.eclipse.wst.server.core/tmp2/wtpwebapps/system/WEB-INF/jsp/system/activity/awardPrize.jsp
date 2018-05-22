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
	    				<td style="width:80px" align="right">用户名称：</td>
	    				<td >
	    					<input type="text" name="realName" value="${record.realName}" class="easyui-textbox" style="border-style:none" disabled="disabled"/>
	    					<input type="hidden" name="id" value="${record.id}" class="easyui-textbox" style="border-style:none" readonly="readonly"/>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td style="width:80px" align="right">手机号码：</td>
	    				<td >
	    					<input type="text" name="mobilePhone" value="${record.mobilePhone}" class="easyui-textbox" style="border-style:none" disabled="disabled"/>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td style="width:80px" align="right">状态：</td>
	    				<td>
	    					<select name="status" id="status"  class="easyui-combobox" style="width: 170px;" disabled="disabled">
<%-- 			  					<option value="1" <c:if test="${record.status==1}"> selected="selected" </c:if>>未中奖</option>   --%>
			  					<option value="2" <c:if test="${record.status==2}"> selected="selected" </c:if> >中奖待发放</option>  
			  					<option value="3" <c:if test="${record.status==3}"> selected="selected" </c:if>>已发奖</option>
	    					</select>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td align="right">快递单号：</td>
	    				<td>
	    					<input type="text" class="easyui-textbox" name="expressNo">
	    				</td>
	    			</tr>
	    			<tr>
	    				<td align="right">快递公司：</td>
	    				<td>
	    					<input type="text" class="easyui-textbox" name="expressName"/>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td align="right">备注：</td>
	    				<td>
<!-- 							<textarea name="remark" maxlength="51" rows="5" cols="100" style="width: 170px;height: 100px;"></textarea> -->
			<textarea cols="20" rows="5" name="remark" id="remark" class="easyui-validatebox" ></textarea>
<!-- 							<input class="easyui-textbox" name="remark" data-options="multiline:true" maxlength="50" style="width:170px;height:100px"> -->
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
    	$.ajax({
    		url:"${apppath}/luckDraw/saveRecord.do",
			type:"POST",
			data:$("#awardPrizeForm").serialize(), 
			success:function(result){
				if(result.success){
					$.messager.alert("提示信息",result.msg);
					$("#award").window("close");
					$("#prizeRecord").datagrid("reload");
				}else{
					$.messager.alert("提示信息",result.errorMsg);
				}
			}
    	});
    }
    
    function closeDialog(){  
    	$("#prizeRecord").datagrid("reload");
    	$("#award").dialog("close");
    }
	</script>
</body>
</html>
