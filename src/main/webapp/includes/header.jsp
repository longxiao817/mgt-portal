<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--header-->
<div class="header">
	<div class="top-header">
		<div class="container">
			<div class="top-head">
				<ul class="header-in">
					<li><a href="#"> Help</a></li>
					<li><a href="contact.html"> Contact Us</a></li>
					<li><a href="#"> How To Use</a></li>
				</ul>
				<div class="search">
					<form>
						<input type="text" value="search about something ?"
							onFocus="this.value = '';"
							onBlur="if (this.value == '') {this.value = 'search about something ?';}">
						<input type="submit" value="">
					</form>
				</div>

				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!---->

	<div class="header-top">
		<div class="container">
			<div class="head-top">
				<div class="logo">

					<h1>
						<a href="index.html"><span> G</span>ames <span>C</span>enter</a>
					</h1>

				</div>
				<div class="top-nav">
					<span class="menu"><img src="images/menu.png" alt="">
					</span>

					<ul>
						<li role="presentation" class="active"><a class="color1"
							href="${ctp}/game/firstpage.html">首页</a></li>
						<li role="presentation"><a class="color2"
							href="${ctp}/game/rankinglist.html">排行榜</a></li>
						<li role="presentation"><a class="color3"
							href="${ctp}/game/reviews.html">安利墙</a></li>
						<li role="presentation"><a class="color4" href="404.html">发现</a></li>
						<li role="presentation"><a class="color5" href="blog.html">论坛</a></li>
						<li role="presentation"><a class="color6" href="contact.html">Contact</a></li>

						<c:if test="${!empty loginUser}">
							<!-- 登陆的div-->
							<div id="navbar" class="navbar-collapse collapse"
								style="float: right;">
								<ul class="nav navbar-nav">
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown"> <i
											class="glyphicon glyphicon-user"></i> ${loginUser.userName }<span
											class="caret"></span></a>
										<ul class="dropdown-menu" role="menu">
											<li><a href="${ctp }/users/personnelcenter.html"> <i
													class="glyphicon glyphicon-scale"></i> 个人中心
											</a></li>
											<li><a href="#"><i
													class="glyphicon glyphicon-comment"></i>我的收藏</a></li>
											<li class="divider"></li>
											<li><a href="#"><i
													class="glyphicon glyphicon-comment"></i>我的订单</a></li>
											<li class="divider"></li>
											<li><a href="${ctp }/users/logout"> <i
													class="glyphicon glyphicon-off"></i> 退出系统
											</a></li>
										</ul></li>
								</ul>
							</div>
						</c:if>
						<c:if test="${loginUser.userName == null }">
							<li role="presentation"><a class="color1"
								href="${ctp }/login.jsp">Login</a></li>
						</c:if>
						<div class="clearfix"></div>
					</ul>

					<!--script-->
					<script>
						$("span.menu").click(function() {
							$(".top-nav ul").slideToggle(500, function() {
							});
						});
					</script>

				</div>

				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</div>
