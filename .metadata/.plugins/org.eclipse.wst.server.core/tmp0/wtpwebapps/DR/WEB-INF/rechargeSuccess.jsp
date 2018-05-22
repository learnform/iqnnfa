<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>七彩格子</title>
</head>
<body>
<input id="success" value="${br.success}"  type="hidden"/>
<input id="errorCode" value="${br.errorCode}"   type="hidden"/>
<input id="amount" value="${br.map.amount}"   type="hidden"/>
<script type="text/javascript">
	location.href="/index/myAccount/rechargeSuccess?success="+'${br.success}'
						+"&errorCode="+'${br.errorCode}'+
						"&amount="+'${br.map.amount}';
</script>
</body>
</html>

