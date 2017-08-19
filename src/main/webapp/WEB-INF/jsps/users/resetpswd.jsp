<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<%@ include file="/includes/js-file.jsp"%>
<%@ include file="/includes/css-main-file.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#resetBtn").click(function() {
			var token = "${param.token}";
			alert(token);
			$("#resetform").attr("action", "${ctp}/users/resetPswd?token=" + token);
		});
	});
</script>
<style type="text/css">
lable {
	color: orangered;
}
</style>
</head>
<body>

	<%@ include file="/includes/header.jsp"%>

	<div id="background"
		style="position: absolute; z-index: -1; width: 100%; height: 100%; top: 0px; left: 0px;">
		<img style="opacity: 0.7;" src="" width="100%" height="100%" />
	</div>
	
	<div class="container">
		<div style="text-align: center;">
			<img alt="图片找不到了" src="${ctp }/images/user.png;" style="length:20%; width:20%">
		</div>
		
		<form id="resetform" action="${ctp}/users/resetPswd" method="post" class="form-group">
			<div class="form-group text-primary">
				<label for="text">Password:</label> <input type="password"
					class="form-control form-control-lg" name="passwd"
					id="loginAcct" value="">
			</div>
			<br />
			<div class="form-group text-primary">
				<label for="text">Re-Password:</label> <input type="password"
					class="form-control form-control-lg" name="re-passwd"
					id="loginAcct" value="">
			</div>
			<br />
			<div class="am-cf" style="text-align: center;">
				<label class="btn btn-success-outline btn-warning btn-sm pull-left"><a
					href="${ctp }/users/Sign In">Sign In ^_^?</a></label> <input
					type="submit" id="resetBtn" value="Reset"
					class="btn btn-success btn-lg"> <label
					class="btn btn-success-outline btn-warning btn-sm pull-right"><a
					href="${ctp }/regist.jsp">Sign Up^_^?</a></label>
			</div>
		</form>
		<hr>
	</div>

	<%@ include file="/includes/footer.jsp"%>
</body>
</html>