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
    	<form id="addForm">
    		<div style="width:auto;height:110px;" align="center">
	    		<table>
	    			<tr>
	    				<td style="width:80px" align="right">转盘位置：</td>
	    				<td >
	    					<input type="text" name="type" id="type" class="easyui-textbox" data-options="required:true" />
	    				</td>
	    			</tr>
	    			<tr>
	    				<td style="width:80px" align="right">奖品名称：</td>
	    				<td>
	    					<input type="text" name="name" class="easyui-textbox" data-options="required:true"/>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td align="right">是否生效：</td>
	    				<td>
	    					<select id="status" name="status" class="easyui-combobox" style="width: 175px;">
		    					<option value="1" >是</option>  
			  					<option value="2" >否</option> 
	    					</select>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td align="right">价值：</td>
	    				<td>
	    					<input type="text" name="price" class="easyui-textbox" />
	    				</td>
	    			</tr>
	    			<tr>
	    				<td align="right">奖品类型：</td>
	    				<td>
	    					<select id="isFavourable" name="isfavourable" class="easyui-combobox" style="width: 175px;">
	    						<option value="请选择">请选择</option>
	    						<option value="1">实物</option>
	    						<option value="2">优惠券</option>
	    						<option value="3">积分</option>
	    						<option value="4">谢谢惠顾</option>
	    					</select>
	    				<td/>
	    			</tr>
	    			<tr id="count">
	    				<td align="right">奖品总量：</td>
	    				<td>
	    					<input type="text"  name="totalcount" id="totalcount" class="easyui-textbox" />
	    				</td>
	    			</tr>
	    			<tr hidden="true">
	    				<td align="right">已发放数量：</td>
	    				<td>
	    					<input type="hidden" id="givecount"  value="0" name="givecount" class="easyui-textbox" />
	    				</td>
	    			</tr>
	    			<tr>
	    				<td align="right">积分奖励：</td>
	    				<td>
	    					<input type="text" id="givepoints" name="givepoints" class="easyui-textbox" />
	    				</td>
	    			</tr>
	    			<tr>
	    				<td align="right">奖品提示：</td>
	    				<td>
	    					<input type="text" id="prompttext" name="prompttext" class="easyui-textbox" />
	    				</td>
	    			</tr>
	    			<tr>
	    				<td align="right">备注：</td>
	    				<td>
	    					<input type="text" id="remark" name="remark" class="easyui-textbox" />
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
    $(function(){
    	$("#isFavourable").combobox({
        	onChange: function (o,n) {
        		if(o==4){
        			$("#count").hide(); 
        		}else{
        			$("#count").show(); 
        		}
        	}
       	}); 
    });
    
    function save(){
//     	var reg=/^[0-9]+$/g;
    	var reg = /^\+?[0-9]\d*$/;
    	if(!reg.test($("#type").val())){
    		$.messager.alert("提示信息","请输入正确的位置");
    		return;
    	}
    	if($('#isFavourable').combobox("getValue")=="请选择"){
    		$.messager.alert("提示信息","请选择奖品类型");
    		return;
    	}
    	if($('#isFavourable').combobox("getValue")!=4){
	    	if(!reg.test($("#totalcount").val())){
	    		$.messager.alert("提示信息","请输入正确的总量");
	    		return;
	    	}
    	}
    	if(!reg.test($("#givepoints").val())){
    		$.messager.alert("提示信息","请输入正确的积分");
    		return;
    	}
    	$.ajax({
    		url:"${apppath}/luckDraw/insertPrize.do",
			type:"POST",
			data:$("#addForm").serialize(), 
			success:function(result){
				if(result.success){
					$.messager.alert("提示信息",result.msg);
					$("#update").window("close");
					$("#addForm").form("clear");
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
