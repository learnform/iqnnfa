<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/include/Taglibs.jsp" %>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="内容描述">
<meta name="author" content="作者">
<link rel="stylesheet" type="text/css" href="${apppath }/css/work.css" />
<link rel="stylesheet" type="text/css" href="${apppath }/css/common.css" />
<script src="${apppath }/js/easyUI/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
	if(window!=top){
		top.location.href=location.href;
	}
</script>
</head>
<body>
<div class="login-wrap">
	<h1 class="logo">
    	<a href="http://www.77color.com/" target="_Blank"><img src="${apppath }/images/login-logo.png" /></a>
    </h1>
    <div class="title">管理系统<i>Management System</i></div>
    <div class="login-box">
    	<form id="loginForm" action="${apppath }/user/doLoginUser.do" id="loginForm"  method="post">
        	<label class="username"><i></i>
	        	<p>用户名</p>
	        	<input id="loginId" type="text" name="loginId"/>
        	</label>
        	<span id="loginText" style="display: none;color: #fe6a6a">请输入用户名</span>
            <label class="passwd"><i></i>
            	<p>密 &nbsp; 码</p>
            	<input id="password" type="password" name="password"/>
            </label>
           	<span id="pwdText" style="display: none;color: #fe6a6a">请输入密码</span>
            <div class="code-wrap">
            	<label class="code"><i></i>
	            	<p>验证码</p>
	            	<input id="randCode" name="randCode" type="text" />
            	</label>
            	<img src="${apppath }/user/validateCode.do" onclick="this.src=this.src+'?'" />
            </div>
           	<span id="codeText" style="display: none;color: #fe6a6a"></span>
            <div class="sub-wrap">
            	<input class="sub" value="登 &nbsp; 录"  onclick="login()" type="button" />
            </div>  
        </form>
    </div>
</div>
<div class="foot-wrap"><span>@版权所有</span><a class="name" href="#">上海探禄网络科技有限公司</a></div>
</body>
<script type="text/javascript">
$(function(){
	$("#loginId").blur(function(){
		if($("#loginId").val().length <= 0){
			$("#loginText").show();
		}else{
			$("#loginText").hide();
		}
	});
	$("#password").blur(function(){
		if($("#password").val().length <= 0){
			$("#pwdText").show();
		}else{
			$("#pwdText").hide();
		}
	});
	$("#randCode").blur(function(){
		if($("#randCode").val().length <= 0){
			$("#codeText").html("请输入验证码");
			$("#codeText").show();
		}else{
			$("#codeText").hide();
		}
	});
});

	function login(){
		$("#codeText").css("display","none").html("");
		$("#pwdText").css("display","none");
		$("#loginText").css("display","none");
		var loginId = $("form input:eq(0)").val();
		var password =  $("form input:eq(1)").val();
		var loginErrorNums = $("#loginErrorNums").val();
		var randCode = $("#randCode").val();
		if(loginId == ""){
			$("#loginText").css("display","block");
			return;
		}
		if(password == ""){
			$("#pwdText").css("display","block");
			return;
		}
		if(randCode == ""){
			$("#codeText").css("display","block").html("请输入验证码");
			return;
		}
		$.ajax({
				url: "${apppath }/user/checkCode.do",
				type: "POST",
				dataType:"json",
				data:{"randCode":randCode},
				success: function(result){
					if(result.msg){
						$("#loginForm").submit();
					}else{
						$("#codeText").css("display","block").html("验证码不正确");
					};
				}
			});

		
	}
		jQuery(document).keydown(function (event) {
		    if(event.keyCode==13){
		    	login();
		    }
		 }); 
	</script>
</html>