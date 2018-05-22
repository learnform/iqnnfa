<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp" %>
<script type="text/javascript" src="${apppath}/js/common/jquery.form.js"></script>
</head>
<body>
<div class="easyui-panel" style="width:100%;height:auto;padding:10px;">
	<form id="ysFeedbackForm">
		<input type="hidden" id="id" name="id" value="${ysFeedback.id}"/>
		<table>
			<tr>
				<td>
					姓名：${ysFeedback.content}
				</td>
			</tr>
			<tr>
				<td>
					联系方式：${ysFeedback.contactInformation}
				</td>
			</tr>
			<tr>	
					<td>提交时间：
						<fmt:formatDate value="${ysFeedback.feedbackTime}" type="date" dateStyle="long"/>
					</td>
			</tr>
			<tr>	
				<td>
					处理时间：
						<fmt:formatDate value="${ysFeedback.handleTime}" type="date" dateStyle="long"/>
				</td>
			</tr>
			<tr>	
				<td>
					处理结果：
					<c:if test="${ysFeedback.status=='0'}" >
						<textarea id="handleResult" name="handleResult" cols="30" rows="5" onblur="checkHandleResult();">${ysFeedback.handleResult}</textarea>
						<div class="handleResult_class" style="color:red;display: none;">处理结果不能为空！</div>
					</c:if>
					<c:if test="${ysFeedback.status=='1'}" >
						${ysFeedback.handleResult}
					</c:if>
					
				</td>
			</tr>
		</table>
	</form>
</div>
<c:if test="${ysFeedback.status=='0'}" >
	<div style="text-align:center;padding:30px 60px 10px 0px">
		<a id="picAddBtn" href="javascript:void(0)" data-options="iconCls:'icon-save'"
		class="easyui-linkbutton" onclick="updateysFeedback()">保存</a>
	</div>
</c:if>
<script type="text/javascript">
	function checkHandleResult(){
		var handleResult=$("#handleResult").val();
		if(handleResult!=""){
			$(".handleResult_class").hide();
		}
	}
	function dateTime(){//对于时间格式的转换
		var time = new Date( );//获得当前时间
		return time.format("yyyy-MM-dd");
	};
	function updateysFeedback(){
		var handleResult ;
		
		if(handleResult==""){
			$(".handleResult_class").show();
			return;
		}
		var id; 
		var validate = $("#ysFeedbackForm").form("validate");
		if(!validate){
			return false;
		}
		$("#ysFeedbackForm").ajaxSubmit({
			handleResult :$("#handleResult").val(),
			id:$("#id").val(),
			
            type: 'post', // 提交方式 get/post
            url: '${apppath}/feedBack/updateYsFeedback.do', // 需要提交的 url
            data: {
                'id': id,
                'handleResult': handleResult ,
                'handleTime':dateTime()
            },
            success: function(result) { // data 保存提交后返回的数据，一般为 json 数据
               	var resultJson = jQuery.parseJSON(result);
            	if(resultJson.success){
					$.messager.alert("提示信息",resultJson.msg);
					$("#updateysFeedbackWindow").window("close");
					$("#toPcFeedback").datagrid("reload");
				}else{
					$.messager.alert("提示信息",resultJson.errorMsg);
				};
            	$("#ysFeedbackForm").resetForm(); // 提交后重置表单
            }
        });
        return false; // 阻止表单自动提交事件
	};
</script>
</body>
</html>

