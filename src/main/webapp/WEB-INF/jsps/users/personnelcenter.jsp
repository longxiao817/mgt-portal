<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<%@ include file="/includes/js-file.jsp"%>
<%@ include file="/includes/css-main-file.jsp"%>
<link rel="stylesheet" href="${ctp }/css/taptap2.css" />
<link rel="stylesheet" href="${ctp }/css/taptap1.css" />
<link rel="stylesheet" href="${ctp }/css/taptap3.css" />
<script type="text/javascript">
	$(function() {

		var userStatus = "${loginUser.certification}";
		// 		alert(userStatus);
		if (userStatus == 2) {
			$("#permanager a:first").prop("disabled", true);
		}

	});
</script>
<style type="text/css">
lable {
	color: orangered;
}

#favourite li  {
	li-style: none;
	display: inline;
	float: left;
	line-height: 40px;
	font-size: xx-large;
	display: inline;
	float: left;
	line-height: 40px;
}

 #favourite li span {
	color: green;
	font-size: xx-large;
	display:  inline;
	line-height:  40px;
}
  
</style>
</head>
<body>

	<%@ include file="/includes//header.jsp"%>
	<section class="taptap-breadcrumb">
	<div class="container">
		<div class="row">
			<ol class="breadcrumb">
				<li><span>你的位置:</span></li>
				<li><a href="${ctp }/index.jsp">首页</a></li>
				<li class="active"><span>${loginUser.userName }的个人中心</span></li>
				<span class="breadcrumb-end"></span>
			</ol>
		</div>
	</div>
	</section>

	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<section class="user-page-header">
				<div class="page-header-left">
					<a class="img-circle header-left-avatar"
						href="${ctp }/users/personnelcenter.html"> <img
						title="${loginUser.userName }" alt="${loginUser.userName }"
						src="${ctp }/images/gamer.jpg">
					</a>
					<div class="header-left-text">
						<h1>${loginUser.userName }</h1>
						<span>ID:${loginUser.userId }</span> <span
							class="passed-etiquette-exam ">礼仪</span>
						<p class="left-text-intro"></p>
						<div id="permanage" class="left-text-btns normal">
							<c:if test="${loginUser.certification == 1}">
								<a class="btn btn-primary" href="${ctp }/users/profile.html">实名认证</a>
							</c:if>
							<c:if test="${loginUser.certification == 2 }">
								<span class="btn btn-danger">实名认证中</span>
							</c:if>
							<c:if test="${loginUser.certification == 3 }">
								<span class="btn btn-danger">已实名</span>
							</c:if>
							<a class="btn btn-primary" href="${ctp }/users/settings">用户设置</a>
							<a class="btn btn-primary" href="${ctp }/users/exam.html">礼仪考试</a>
						</div>
						<div class="left-text-btns admin"></div>
					</div>
				</div>
				<div class="page-header-right">
					<ul class="list-unstyled header-right-stats">
						<li><a href="#"> <c:if test="${gameNum != null }">
									<span class="right-stats-number">${gameNum }</span>
								</c:if> <c:if test="${gameNum == null}">
									<span class="right-stats-number">0</span>
								</c:if> <span>玩过的游戏</span>
						</a></li>
						<li><a href="https://www.taptap.com/user/8561245/fans"> <c:if
									test="${fanNum != null }">
									<span class="right-stats-number">${fanNum }</span>
								</c:if> <c:if test="${fanNum == null}">
									<span class="right-stats-number">0</span>
								</c:if><span>粉丝</span>
						</a></li>
						<li><a href="https://www.taptap.com/user/8561245/following">
								<c:if test="${fanNum != null }">
									<span class="right-stats-number">${focusNum }</span>
								</c:if> <c:if test="${fanNum == null}">
									<span class="right-stats-number">0</span>
								</c:if> <span>关注</span>
						</a></li>
					</ul>
				</div>
				</section>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-12 clearfix">
				<div class="taptap-page-main">
					<section class="user-home-body">
					<div class="section-title">
						<h3>玩过的游戏</h3>
						<small>(<c:if test="${gameNum != null }">
								<a href="${ctp }/users/playedgames">${gameNum}</a>
							</c:if> <c:if test="${gameNum == null }">
								<a href="${ctp }/users/playedgames">0</a>
							</c:if>)
						</small>
					</div>
					<c:if test="${gameNum == null}">
						<p class="user-no-contents">暂无游戏</p>
					</c:if> 
					<c:if test="${gameNum != null }">
						<ul class="list-unstyled user-apps">
							<li><a href="#" class="app-item-icon"> <img
									src="${ctp }/images/games/game1.png" title="计算器: 游戏">
							</a> <a href="#" class="app-item-title">
									<h2>计算器: 游戏</h2> <span class="title-end"></span>
							</a></li>
							<li><a href="#" class="app-item-icon"> <img
									src="${ctp }/images/games/game2.png" title="沉迷旋转">
							</a> <a href="#">
									<h2>沉迷旋转</h2> <span class="title-end"></span>
							</a></li>
							<li><a href="#" class="app-item-icon"> <img
									src="${ctp }/images/games/game3.png" alt="仙境传说RO测试服（预言之地）"
									title="仙境传说RO测试服（预言之地）">
							</a> <a href="#" class="app-item-title">
									<h2>仙境传说RO测试服（预言之地）</h2> <span class="title-end"></span>
							</a> <span>游戏时长28小时36分钟</span></li>
							<li><a href="#" class="app-item-icon"> <img
									src="${ctp }/images/games/game4.png" alt="冰箱里的布丁被吃掉了 - 密室脱逃类游戏"
									title="冰箱里的布丁被吃掉了 - 密室脱逃类游戏">
							</a> <a href="#" class="app-item-title">
									<h2>冰箱里的布丁被吃掉了 - 密室脱逃类游戏</h2> <span class="title-end"></span>
							</a></li>
						</ul>
					</c:if> </section>
				</div>
				<div class="taptap-page-side user-home-side">
					<div class="section-title">
						<h3>关注的用户</h3>
					</div>
					<c:if test="${focusNum == 0 }">
						<p class="user-no-contents">你还没有关注其他人</p>
					</c:if>
					<c:if test="${focusNum != 0 }">
						<ul class="list-unstyled home-side-users">
							<c:forEach items="${focus }" var="focus">
								<li><a href="https://www.taptap.com/user/28330"
									class="user-item-avatar img-circle"><img
										src="${ctp }/images/gamer.jpg" alt=""> </a>
									<div class="side-users-container">
										<a href="https://www.taptap.com/user/28330"
											class="user-item-name">${focus.userName }</a>
										<p>ID:${focus.userId }</p>
									</div>
									<button class="btn btn-primary taptap-button-friendship"
										type="button" data-taptap-ajax="follow" data-id="28330"
										data-obj="user"
										data-url="https://www.taptap.com/ajax/friendship/follow">
										<span class="follow">关注</span>
									</button></li>
							</c:forEach>
						</ul>
					</c:if>
					<div class="section-title-developer">
						<h3>关注的厂商</h3>
					</div>
					<p class="developer-no-contents">你还没有关注厂商</p>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/includes/footer.jsp"%>
</body>
</html>