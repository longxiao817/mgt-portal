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
%>
<title>Login</title>
<%@ include file="/includes/js-file.jsp"%>
<%@ include file="/includes/css-main-file.jsp"%>
<style type="text/css">
lable {
	color: orangered;
}

#favourite {
	list-style:  none;
	    margin-left:  50px;
}

  
  
 #favourite li  {
	display:  inline;
	line-height:  40px;
	font-size: xx-large;
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

	<%@ include file="/includes/header.jsp"%>

	<div class="container">
		<div class="container">
			<div class="row">
				<ol class="breadcrumb">
					<li><span>你的位置:</span></li>
					<li><a href="https://www.taptap.com">首页</a></li>
					<li class="active"><span>${loginUser.userName }的个人中心</span></li>
					<span class="breadcrumb-end"></span>
				</ol>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="col-sm-9">
						<div class="col-sm-3">
							<img title="${loginUser.userName }" alt="手机用户255400"
								src="${ctp }/images/usercenter.jpg"
								style="length: 100%; width: 100%;"> </a>
						</div>
						<div class="col-sm-6">
							<div class="header-left-text">
								<h1>${loginUser.userName }</h1>
								<span>${loginUser.userId }</span> <span
									class="passed-etiquette-exam ">礼仪</span>
								<p class="left-text-intro"></p>
								<div class="left-text-btns normal">
									<a class="btn btn-primary"
										href="https://www.taptap.com/profile">编辑资料</a> <a
										class="btn btn-primary" href="${ctp }/users/settings">用户设置</a>
									<a class="btn btn-primary" href="${ctp }/users/exam">礼仪考试</a>
								</div>
								<div class="left-text-btns admin"></div>
							</div>
						</div>
					</div>
					<div class="col-sm-3">
						<ul id="favourite" class="list-unstyled header-right-stats">
							<li><a href="https://www.taptap.com/user/8561245/played">
									<span class="right-stats-number">0</span> <span>玩过的游戏</span>
							</a></li>
							<li><a href="https://www.taptap.com/user/8561245/fans">
									<span class="right-stats-number">0</span> <span>粉丝</span>
							</a></li>
							<li><a href="https://www.taptap.com/user/8561245/following">
									<span class="right-stats-number">0</span> <span>关注</span>
							</a></li>
						</ul>
					</div>
					<br /> <br />
				</div>
			</div>
		</div>
		<br /> <br />
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="col-sm-9">
						<div class="taptap-page-main">
							<section class="user-home-body">
							<div class="section-title">
								<h3>
									玩过的游戏<span>(<a></a>)
									</span>
								</h3>
							</div>
							<hr />
							<p class="user-no-contents">暂无游戏</p>
							</section>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="taptap-page-side user-home-side">
							<div class="section-title">
								<h3>关注的用户</h3>
							</div>
							<hr />
							<p class="user-no-contents">你还没有关注其他人</p>
							<br /> <br />
							<div class="section-title-developer">
								<h3>关注的厂商</h3>
							</div>
							<hr />
							<p class="developer-no-contents">你还没有关注厂商</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<%@ include file="/includes/footer.jsp"%>
</body>
</html>