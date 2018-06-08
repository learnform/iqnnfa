<%@include file="/WEB-INF/jsp/common/include/Taglibs.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../../common/include/util.jsp"%>
<script type="text/javascript" src="${apppath}/js/common/jquery.form.js"></script>
</head>
<body>
	<div class="easyui-panel"
		style="width: 100%; height: 150px; padding: 10px;">
		<form id="ysFeedbackForm">
			<input type="hidden" id="id" name="id" value="${drMessageboard.id}" />
			<table style="height: 80%;">
				<tr>
					<td>留言内容：${drMessageboard.message}</td>
				</tr>
			</table>
		</form>
	</div>
	<c:if test="${drMessageboard.status == 0}">
		<div style="text-align: center; padding: 30px 60px 10px 0px">

			<a id="picAddBtn" href="javascript:void(0)"
				data-options="iconCls:'icon-save'" class="easyui-linkbutton"
				onclick="updateysFeedback()">通过</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a id="picAddBtn" href="javascript:void(0)"
				data-options="iconCls:'icon-save'" class="easyui-linkbutton"
				onclick="noupdateysFeedback()">不通过</a>

		</div>
	</c:if>

	<script type="text/javascript">
		//通过
		function updateysFeedback() {
			var id = $("#id").val();
			var validate = $("#ysFeedbackForm").form("validate");
			if (!validate) {
				return false;
			}
			$.ajax({
				type : 'post',
				url : '${apppath}/activity/updateDrMessageboard.do',
				data : {
					'id' : id
				},
				success : function(result) { // data 保存提交后返回的数据，一般为 json 数据
					var resultJson = jQuery.parseJSON(result);
					if (resultJson.success) {
						$.messager.alert("提示信息", resultJson.msg);
						$("#giveawardPrize").window("close");
						$("#getYsMessageboardList").datagrid("reload");
					} else {
						$.messager.alert("提示信息", resultJson.errorMsg);
					}
					;
					$("#ysFeedbackForm").resetForm(); // 提交后重置表单
				}
			});
			return false; // 阻止表单自动提交事件
		};
		//不通过
		function noupdateysFeedback() {
			var id = $("#id").val();
			var validate = $("#ysFeedbackForm").form("validate");
			if (!validate) {
				return false;
			}
			$.ajax({
				type : 'post',
				url : '${apppath}/activity/noupdateDrMessageboard.do',
				data : {
					'id' : id
				},
				success : function(result) { // data 保存提交后返回的数据，一般为 json 数据
					var resultJson = jQuery.parseJSON(result);
					if (resultJson.success) {
						$.messager.alert("提示信息", resultJson.msg);
						$("#giveawardPrize").window("close");
						$("#getYsMessageboardList").datagrid("reload");
					} else {
						$.messager.alert("提示信息", resultJson.errorMsg);
					}
					;
					$("#ysFeedbackForm").resetForm(); // 提交后重置表单
				}
			});
			return false; // 阻止表单自动提交事件
		};
	</script>
</body>
</html>

