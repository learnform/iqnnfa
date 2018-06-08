<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@include file="../../common/common-css.jsp"%>
<%@include file="../../common/common-js.jsp" %>
<script type="text/javascript" src="../../js/jquery.form.js"></script>
</head>

<body>
	<div style="height: 100%;overflow-y: auto;">
		<br /> <br />
		<form
<%-- 			action="${pageContext.servletContext.contextPath }/background/user/updatePwd.html" --%>
			method="post" onsubmit="return updateUserPassword();">
			<table class="ttab" height="100" width="30%" border="0"
				cellpadding="0" cellspacing="1" align="center">
				<tr>
					<td height="30" colspan="4">
						<div align="center">
							<font color="blue" size="8"><b>修改密码</b>
							</font>
						</div></td>
				</tr>
				<tr>
					<td height="30" width="20%">
						<div align="right" class="STYLE1">请输入原密码：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							<input style="height: 20px;width: 200px;display: none" id="userId" name="userId" value="${userId}"/>
							<input style="height: 20px;width: 200px" type="password" id="oldPassword" name="oldPassword" />
						</div></td>
				</tr>
				<tr>
					<td height="30" width="20%">
						<div align="right" class="STYLE1">请输入新密码：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							<input style="height: 20px;width: 200px" id="userPassword" name="userPassword"
								type="password" />
						</div>
					</td>
				</tr>
				<tr>
					<td height="30" width="20%">
						<div align="right" class="STYLE1">请再次输入密码：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							<input style="height: 20px;width: 200px" type="password" id="userPasswordAgain" name="userPasswordAgain" />
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="padding: 10px">
						<div align="center">
<!-- 							<input type="button" value="修改" class="input_btn_style1" onclick="updateUserPassword()"/>  -->
							<sec:authorize ifAnyGranted="ROLE_sys_pwd_edit">
								<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="updateUserPassword()">修改</a>
							</sec:authorize>	
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		function updateUserPassword(){
			var userId =$("#userId").val();
			var oldPassword = $("#oldPassword").val();
			var userPassword = $("#userPassword").val();
			var userPasswordAgain = $("#userPasswordAgain").val();
			if(userPassword != userPasswordAgain){
				$.messager.alert("提示信息","两次密码不一样！");
				return false;
			}
			if(oldPassword == userPassword && oldPassword == userPasswordAgain){
				$.messager.alert("提示信息","原密码不能跟新密码一样！");
				return false;
			}
			$.ajax({
// 				data:{userPassword:userPassword,userId:$("#userId").val()},  
				url:"${pageContext.servletContext.contextPath}/background/user/savePwd.html?userId="+userId+"&userPassword="+userPassword+"&oldPassword="+oldPassword,
				type:"POST",
				success:function(status){
					if(status == 0){
						$.messager.alert("提示信息","登录密码修改成功！请重新登录！","",function(){
							top.location.href ="../login.html";
						});
                   	}else if(status == 1){
                   		$.messager.alert("提示信息","原登录密码不正确！请重新输入！");
                    }
				}
			});
		}
	</script>
</body>
</html>
