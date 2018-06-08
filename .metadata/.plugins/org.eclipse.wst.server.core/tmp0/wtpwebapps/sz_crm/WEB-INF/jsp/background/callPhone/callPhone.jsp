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
							<font color="blue" size="8"><b>拨打电话</b>
							</font>
						</div></td>
				</tr>
				<tr>
					<td colspan="4" style="padding: 10px">
						<div align="center">
							<div>
							    <iframe src="${pageContext.servletContext.contextPath }/ztth_wincall_kefu.jsp#ag_num=${agNum}&agentPhone='${agentPhone}'"  width="1200" height="1000"></iframe>
							</div>				
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
	</script>
</body>
</html>
