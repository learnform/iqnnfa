<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <%@include file="../../common/common-css.jsp"%>
	<%@include file="../../common/common-js.jsp" %>
</head>
  
  <body>
  <div style="height: 100%;overflow-y: auto;">
<br/>
<br/>  
<form action="${pageContext.servletContext.contextPath }/background/user/update.html" method="post">
<input type="hidden" name="userId" value="${user.userId}">
		<table class="ttab" height="100" width="85%" border="0" cellpadding="0" cellspacing="1" align="center">
				<tr>
					<td height="30" colspan="4">
						<div align="center">
							<font color="blue" size="8"><b>修改信息</b>
							</font>
						</div></td>
				</tr>
				<tr>
					<td height="30" width="10%">
						<div align="right" class="STYLE1">用户名：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							<input style="height: 20px;width: 100px" name="userName" value="${user.userName}"/>
<!-- 							　　　所属角色：<select name="roleId"> -->
<!-- 							<option value="">选择角色</option> -->
<%-- 							<c:forEach var="key" items="${roles}"> --%>
<%-- 								<option value="${key.id}" <c:if test="${key.name eq user.roleName}">selected="selected"</c:if>>${key.name}</option> --%>
<%-- 							</c:forEach> --%>
<!-- 						</select> -->
						</div></td>
<!-- 					<td height="30" width="10%"> -->
<!-- 						<div align="right" class="STYLE1">密码：</div></td> -->
<!-- 					<td> -->
<!-- 					<div align="left" class="STYLE1" style="padding-left:10px;"> -->
<!-- 						<input style="height: 20px;width: 200px" name="userPassword" -->
<!-- 							type="password" /> -->
<!-- 							*用户登录的密码 -->
<!-- 					</div></td>	 -->
				</tr>
				<tr>
					<td height="30" width="10%">
						<div align="right" class="STYLE1">昵称：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							<input style="height: 20px;width: 200px" name="userNickname" value="${user.userNickname}"/>
						</div></td>
					<td height="30" width="10%">
						<div align="right" class="STYLE1">真实姓名：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							<input style="height: 20px;width: 200px" name="userRealname" value="${user.userRealname}"/>
						</div></td>
				</tr>
				<tr>
					<td height="30" width="10%">
						<div align="right" class="STYLE1">年龄：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							<input style="height: 20px;width: 200px" name="userAge" value="${user.userAge}"/>
						</div></td>
						<td height="30" width="10%">
						<div align="right" class="STYLE1">性别：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							<input style="height: 20px;width: 200px" name="userSex" value="${user.userSex}"/>
						</div></td>
				</tr>
				<tr>
					<td height="30" width="10%">
						<div align="right" class="STYLE1">地址：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							<input style="height: 20px;width: 200px" name="userAddress" value="${user.userAddress}"/>
						</div></td>
						<td height="30" width="10%">
						<div align="right" class="STYLE1">电话：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							<input style="height: 20px;width: 200px" name="userPhone" value="${user.userPhone}"/>
						</div></td>
				</tr>
				<tr>
					<td height="30" width="10%">
						<div align="right" class="STYLE1">分机号：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							<input style="height: 20px;width: 200px" name="agentPhone" value="${user.agentPhone}" maxlength="4"/>
						</div></td>
					<td height="30" width="10%">
						<div align="right" class="STYLE1">坐席号：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							<input style="height: 20px;width: 200px" name="agNum" value="${user.agNum}" />
						</div></td>	
				</tr>
				<tr>
					<td height="30" width="10%">
						<div align="right" class="STYLE1">邮箱：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							<input style="height: 20px;width: 200px" name="userMail" value="${user.userMail}"/>
						</div></td>
					<td height="30" width="10%">
						<div align="right" class="STYLE1">QQ：</div></td>
					<td>
						<div align="left" class="STYLE1" style="padding-left:10px;">
							<input style="height: 20px;width: 200px" name="userQQ" value="${user.userQQ}"/>
						</div></td>	
				</tr>
				<tr>
					<td height="30" width="10%">
						<div align="right" class="STYLE1">职位：</div></td>
					<td align="left" class="STYLE1" style="padding-left:10px;">
						<select id="roleType" name="roleId" onchange="roleChange()">
<!-- 							<option value="2" selected="selected">请选择</option> -->
							<option value="1" <c:if test="${user.roleId == 1 }" >selected="selected"</c:if>>系统管理员</option>
							<option value="2" <c:if test="${user.roleId == 2 }" >selected="selected"</c:if>>电销主管</option>
							<option value="3" <c:if test="${user.roleId == 3 }" >selected="selected"</c:if>>电销专员</option>
							<option value="4" <c:if test="${user.roleId == 4 }" >selected="selected"</c:if>>客服</option>
						</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<select id="leaderIds" name="leaderUid" style="display: none;">
						</select>
					</td>	
				</tr>
				<tr>
					<td colspan="4" style="padding: 10px">
						<div align="center">
							<input type="submit" value="　保　存　" class="input_btn_style1" /> <input
								id="backBt" type="button" value="　返　回　" class="input_btn_style1"
								onclick="javascript:window.location.href='javascript:history.go(-1)'" />
						</div></td>
				</tr>
			</table>
</form>
</div>
<script type="text/javascript">
$(function(){
	var roleId ="${user.roleId}";
	if(roleId=="3"){
		$("#leaderIds").css("display","inline");
		$.ajax({
			url:"${pageContext.servletContext.contextPath}/background/user/selectUser.html",
			type:"POST",
			success:function(data){
				var user = (eval("("+data+")"));
				$.each(user,function(i,item){
					$("#leaderIds").append("<option value='" + item.userId + "'>" + item.userName + "</option>");
				});
			}
		});
	}
})
	function roleChange(){
		$("#leaderIds").html("");
		var roleType =  $("#roleType").find("option:selected").val();
		console.log(roleType);
		if(roleType=="1" || roleType=="2"|| roleType=="4"){
			$("#leaderIds").css("display","none");
		}
		if(roleType=="3"){
			$("#leaderIds").css("display","inline");
			$.ajax({
	//				data:{userPassword:userPassword,userId:$("#userId").val()},  
				url:"${pageContext.servletContext.contextPath}/background/user/selectUser.html",
				type:"POST",
				success:function(data){
					var user = (eval("("+data+")"));
					$.each(user,function(i,item){
						$("#leaderIds").append("<option value='" + item.userId + "'>" + item.userName + "</option>");
					});
				}
			});
		}
	}
</script>
  </body>
</html>
