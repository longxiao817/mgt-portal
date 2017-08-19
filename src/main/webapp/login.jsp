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
		
	
		$("#loginbtn").click(function() {
			
			var reminput = $("input[name='rememberme']").prop("checked");
			var rememberme;
			if(reminput) {
				rememberme = 1;
			} else {
				rememberme = 0;
			}
			alert(rememberme);
			
			$("#loginform").attr("action", "${ctp}/users/login?rememberme=" + remember);
			alert($("#loginform").attr("action"));
			$("#loginform").submit();
			return false;
		});
		
		
		$().ready(function() {
			$("#loginform").validate({
				rules : {
					loginAcct : {
						required : true,
						minlength : 5,
						maxlength : 13
					},
					passwd : {
						required : true,
						minlength : 5,
						maxlength : 13
					}
				},
				messages : {
					loginAcct : {
						required : "请输入登陆账号",
						minlength : "账号长度不能小于5字 符",
						maxlength : "账号长度不能大于13字 符"
					},
					passwd : {
						required : "请输入密码",
						minlength : "密码不能小于5个字 符",
						maxlength : "密码不能大于13个字 符"
					}
				}
			});
		})

	})
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
			<img alt="图片找不到了" src="${ctp }/images/user.png;"
				style="length: 20%; width: 20%">
		</div>

		<form id="loginform" action="${ctp}/users/login" method="post" class="form-group">
			<div class="form-group text-primary">
				<label for="text">Account:</label> <input type="text"
					class="form-control form-control-lg" name="loginAcct"
					id="loginAcct" value="">
			</div>
			<br>
			<div class="form-group text-primary">
				<label for="password">Password:</label> <input type="password"
					class="form-control form-control-lg" name="passwd" id="passwd"
					value="">
			</div>
			<br />
			<div class="form-group text-primary">
				<label for="remember-me"><input id="remember-me"
					name="rememberme" type="checkbox">RemeberMe</label>
			</div>
			<br />
			<div class="am-cf" style="text-align: center;">
				<label class="btn btn-success-outline btn-warning btn-sm pull-left"><a
					href="${ctp }/users/togetbackpswd">Find Password ^_^?</a></label> <input
					type="submit" id="loginbtn" value="Sign Up"
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