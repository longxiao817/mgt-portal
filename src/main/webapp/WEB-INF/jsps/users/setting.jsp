<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	pageContext.setAttribute("cttp", session.getServletContext()
			.getContextPath());
	pageContext.setAttribute("header", "UserSettings");
%>
<title>Login</title>
<%@ include file="/includes/js-file.jsp"%>
<%@ include file="/includes/css-main-file.jsp"%>
<link rel="stylesheet" href="https://assets.tapimg.com/style/base.css" />
<link rel="stylesheet"
	href="https://assets.tapimg.com/css/app-70bbadf0ab.css" />
<link rel="stylesheet"
	href="${ctp }/css/taptap1.css" />
	<link rel="stylesheet"
	href="${ctp }/css/taptap2.css" />
</head>
<body>

	<%@ include file="/includes/header.jsp"%>

	<section class="taptap-breadcrumb">
	<div class="container">
		<div class="row">
			<ol class="breadcrumb">
				<li><span>你的位置:</span></li>
				<li><a href="${ctp }/index.jsp">首页</a></li>

				<li><a href="${ctp }/users/personnelcenter">${loginUser.userName }的个人中心</a>
				</li>
				<li class="active"><span>用户设置</span></li>

				<span class="breadcrumb-end"></span>
			</ol>
		</div>
	</div>
	</section>
	<div class="container">
		<div class="row">
			<div class="col-sm-12"></div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<section class="auth-main">
				<div class="auth-main-heading">
					<h2 class="main-heading-title">用户设置</h2>
				</div>
				<div class="auth-main-body user-settings">
					<form action="https://www.taptap.com/settings" method="post">
						<input name="_token" type="hidden"
							value="CIZxE8CLbI2RJIPDGDgTufOLkbfwbS55lSmEfOJI">

						<div class="user-settings-section">
							<p class="settings-section-title">基本设置</p>
							<div class="settings-section-contents">
								<div class="form-group">
									<label for="timeline_switch">个性化推荐</label>
									<div class="pull-right">
										<label class="radio-inline"> <input
											name="timeline_switch" type="radio" checked="" value="1">
											开启
										</label> <label class="radio-inline"> <input
											name="timeline_switch" type="radio" value="0"> 关闭
										</label>
									</div>
								</div>
								<p>根据关注的用户与厂商显示更多游戏</p>
							</div>
						</div>
						<div class="user-settings-section">
							<p class="settings-section-title">消息设置</p>
							<div class="settings-section-contents">
								<span class="help-block">打开后将推送相应类型消息</span>
								<div class="form-group">
									<label for="notification_style_1">有人回复我</label>
									<div class="pull-right">
										<label class="radio-inline"> <input
											name="notification_style_1" type="radio" checked="" value="1">
											开启
										</label> <label class="radio-inline"> <input
											name="notification_style_1" type="radio" value="0">
											关闭
										</label>
									</div>
								</div>
								<div class="form-group">
									<label for="notification_style_2">有人赞了我</label>
									<div class="pull-right">
										<label class="radio-inline"> <input
											name="notification_style_2" type="radio" checked="" value="1">
											开启
										</label> <label class="radio-inline"> <input
											name="notification_style_2" type="radio" value="0">
											关闭
										</label>
									</div>
								</div>
								<div class="form-group">
									<label for="notification_style_3">有人关注我</label>
									<div class="pull-right">
										<label class="radio-inline"> <input
											name="notification_style_3" type="radio" checked="" value="1">
											开启
										</label> <label class="radio-inline"> <input
											name="notification_style_3" type="radio" value="0">
											关闭
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class="user-settings-section">
							<div class="settings-section-contents">
								<button class="btn btn-primary" type="submit">保存</button>
							</div>
						</div>
					</form>
				</div>
				</section>
			</div>
		</div>
	</div>

	<%@ include file="/includes/footer.jsp"%>
</body>
</html>