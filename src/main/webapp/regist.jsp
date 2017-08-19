<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Regist | Living For Game</title>
<%@ include file="/includes/js-file.jsp"%>
<%@ include file="/includes/css-main-file.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#inputEmail3").blur(function() {
			var email = $("#inputEmail3").val();
			$.ajax({
				url : "${ctp}/users/verifyEmail?email=" + email,
				success : function(data) {
					$("form div:first div span").remove();
					$("form div:first div").append("<span style='color:red'>" + data + "</span>");
				},
				error : function(data) {
					console.log(data);
				}
			});
		});
		
		$("#inputLoginAccount3").blur(function() {
			var loginAcct = $(this).val();
			$.ajax({
				url : "${ctp}/users/verifyLoginAcct?loginAcct=" + loginAcct,
				success : function(data) {
					$("form div:eq(2) div span").remove();
					$("form div:eq(2) div").append("<span style='color:red'>" + data + "</span>");
				},
				error : function(data) {
					console.log(data);
				}
			});
		});
		
		$().ready(function() {

			 $("#signupForm").validate({
				 rules: {
					 loginAcct: {
						required: true, 
						minlength: 5,
						maxlength: 13
					 },
					 userName : {
						 required: true, 
						minlength: 5,
						maxlength: 13
					 },
					 email: {
						 required: true,
						 email: true
						 },
						 passwd: {
							 required: true,
							 minlength: 5,
							 maxlength : 13
						},re_password: {
							required: true,
							minlength: 5,
							maxlength : 13,
							equalTo: "#passwd"
						}
					},
					messages: {
						loginAcct: {
							required: "请输入登陆账号",
							minlength: "账号长度不能小于5字 符",
							maxlength : "账号长度不能大于13字 符"
						},
						userName : {
							required: "请输入昵称",
							minlength: "昵称长都不能小于5字 符",
							maxlength : "昵称长度不能大于13字 符"
						},
						email: {
							required: "请输入Email地址",
							email: "请输入正确的email地址",
						},
						passwd: {
							required: "请输入密码",
							minlength: "密码不能小于5个字 符",
							maxlength: "密码不能大于13个字 符"
						},re_password: {
							required: "请输入确认密码",
							minlength: "确认密码不能小于5个字符",
							equalTo: "两次输入密码不一致"
						}
					}
				});
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
			<img alt="图片找不到了" src="${ctp }/images/user.png;"
				style="length: 20%; width: 20%">
		</div>

		<form id="signupForm" class="form-horizontal" action="${ctp }/users/registUser">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" name="email" id="inputEmail3"
						placeholder="Email">
				</div>
			</div>
			<div class="form-group">
				<label for="inputAccount3" class="col-sm-2 control-label">LoginAccount</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="loginAcct" id="inputLoginAccount3"
						placeholder="loginAccount">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">UserName</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="userName" id="inputUserName3"
						placeholder="username">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword1" class="col-sm-2 control-label">Password</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" name="passwd" id="passwd"
						placeholder="Password">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword2" class="col-sm-2 control-label">Re-Password</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" name="re_password" id="re_password"
						placeholder="Re-Password">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<label> <input type="checkbox"> Remember me
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-success">Sign Up</button>
					<button id="signin" class="btn btn-warning btn-right"><a href="${ctp }/login.jsp">Sign In</a></button>
					<button id="findpswd" class="btn btn-warning btn-right"><a href="${ctp }/users/findpswd">Find Password</a></button>
				</div>
			</div>
		</form>
		<hr>
	</div>

	<%@ include file="/includes/footer.jsp"%>
</body>
</html>