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
    	<form id="updateForm">
    		<div style="width:auto;height:110px;" align="center">
	    		<table>
					<tr>
	    				<td style="width:80px" align="right">奖品ID：</td>
	    				<td >
	    					<input type="text" name="id" id="id" value="${drLuckDraw.id}" style="border-style:none" readonly="readonly"/>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td style="width:80px" align="right">转盘位置：</td>
	    				<td >
	    					<input type="text" name="type" value="${drLuckDraw.type}" style="border-style:none" readonly="readonly"/>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td style="width:80px" align="right">奖品名称：</td>
	    				<td>
	    					<input type="text" name="name" value="${drLuckDraw.name}" style="border-style:none" readonly="readonly"/>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td align="right">是否生效：</td>
	    				<td>
<%-- 	    					<input type="text" name="status" value="<c:if test="${drLuckDraw.status== 1}">是</c:if><c:if test="${drLuckDraw.status== 0}">否</c:if>" style="border-style:none" readonly="readonly"> --%>
	    					<select name="status" id="status"  class="easyui-combobox" style="width: 170px;">
			  					<option value="1" <c:if test="${drLuckDraw.status==1}"> selected="selected" </c:if>>是</option>  
			  					<option value="2" <c:if test="${drLuckDraw.status==2}"> selected="selected" </c:if> >否</option>  
	    					</select>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td align="right">价值：</td>
	    				<td>
	    					<input type="text" name="price" value="${drLuckDraw.price}" style="border-style:none" readonly="readonly"/>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td align="right">奖品类型：</td>
	    				<td>
	    					<input type="text" name="isfavourable" id="isFavourable" value="<c:if test="${drLuckDraw.isfavourable== 1}">实物</c:if><c:if test="${drLuckDraw.isfavourable== 2}">优惠券</c:if><c:if test="${drLuckDraw.isfavourable== 3}">积分</c:if><c:if test="${drLuckDraw.isfavourable== 4}">谢谢惠顾</c:if>" style="border-style:none" readonly="readonly"/>
	    				<td/>
	    			</tr>
	    			<tr>
	    				<td align="right">奖品总量：</td>
	    				<td>
	    					<input type="text"  name="totalCount" value="${drLuckDraw.totalcount}" style="border-style:none;" readonly="readonly"/>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td align="right">库存：</td>
	    				<td>
	    					<input type="text" id="prizeCount" name="prizecount" class="easyui-numberbox"  value="${drLuckDraw.prizecount}"/>
	    					<input type="hidden" id="giveCount" name="giveCount" value="${drLuckDraw.givecount}"/>
	    				</td>
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
    	var prizeCount=$("#prizeCount").val();
    	var giveCount=$("#giveCount").val();
    	var status=$('#status').combobox("getValue");
    	var id=$("#id").val();
//     	var reg=/^[0-9]+$/g;
		var reg = /^\+?[0-9]\d*$/;
    	if($('#isFavourable').val()!="谢谢惠顾"){
	    	if(!reg.test(prizeCount)){
	    		$.messager.alert("提示信息","库存不能小于0");
	    		return;
	    	}
    	}
    	var parameter={
    	    	id:id,
    	    	prizeCount:prizeCount,
    	    	giveCount:giveCount,
    	    	status:status
    	    };
    	$.ajax({
    		url:"${apppath}/luckDraw/savePrize.do",
			type:"POST",
			data:parameter, 
			success:function(result){
				if(result.success){
					$.messager.alert("提示信息",result.msg);
					$("#update").window("close");
					$("#updateForm").form("clear");
					$("#prizeList").datagrid("reload");
				}else{
					$.messager.alert("提示信息",result.errorMsg);
				}
			}
    	});
    }
    
    function closeDialog(){  
    	$("#prizeList").datagrid("reload");
    	$("#update").dialog("close");
    }
	</script>
</body>
</html>
