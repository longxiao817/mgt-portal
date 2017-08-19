<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*,java.sql.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/includes/css-file.jsp"%>
<style type="text/css">
.icon {
	width: 1em;
	height: 1em;
	vertical-align: -0.15em;
	fill: currentColor;
	overflow: hidden;
	font-size: 20px;
}
</style>
<title>评论详情</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Games Center Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	
	
	
	

	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 







</script>

</head>
<body>
	<%@include file="/WEB-INF/includes/js-file1.jsp"%>
	<!--header-->
	<%@include file="/WEB-INF/includes/header.jsp"%>

	<!--content-->
	<!-- 卡片 -->
	<div class="review" style="background-color: #f2f2f2">
		<div class="container">
			<div class="row">
				<!-- 右移动 col-md-offset-1   -->
				<div class="col-sm-12 ">
					<div class="card text-center">
						<div class="card-block">
							<div class="row">
								<a href="#" class="card-img-top text-left"> <img
									class="img-rounded" alt="${user.userImage}"
									src="${ctp }/${user.userImage}" width="50">
								</a>
								<P>${user.userName }</P>
								<%-- <span>${user.userId }</span> --%>
								<div class="card-block text-left">
									<p class="card-text">
										<a href="${ctp }/single/game?id=${user.userId}"
											class="card-link" style="">${card.name}</a>
									</p>
									<p></p>
									<div class="row">
										<button id="attBtn" class="">关注</button>
									</div>
								</div>



								<div class="page-header-right">
									<ul class="">
										<li><a href="#" class=""> <span>玩过的游戏</span> <span
												class="right-stats-number">${games.size() }</span>
										</a></li>
										<li><a href="#" class=""> <span>粉丝</span> <span
												class="right-stats-number">0</span>
										</a></li>
										<li><a href="#" class=""> <span>关注</span> <span
												class="right-stats-number">0</span>

										</a></li>
									</ul>
								</div>

							</div>
							<br>
							<div class="row">
								<section class="user-home-body">

									<div class="col-sm-12 text-left">

										<div class="row ">
											<h3>玩过的游戏</h3>
											<small> (<a href="">${games.size() }</a>)
											</small>
										</div>

									</div>
									<ul class="list-unstyled user-apps">
										<c:forEach items="${ games}" var="game">

											<li><a href="#" class=""> <img class="card-img-top"
													alt="${game.imgurl}" src="${ctp }/${game.imgurl}"
													width="100">
											</a> <a href="#" class="">
													<p>${game.name }</p>
											</a></li>
										</c:forEach>
									</ul>


								</section>
							</div>
							<div class="text-left">
								<section class="user-home-body">

									<div class="section-title ">
										<h3>最近的评价</h3>
										<small> (<a href="">${games.size() }</a>)
										</small>
									</div>
									<ul class="list-unstyled user-reviews">
										<div class="row">
											<c:forEach items="${gameComentar }" var="gameComentar">
												<li><a href="#" class="review-item-icon"> <img
														alt="" src="${ctp }/${gameComentar.game.imgurl}">
												</a>
													<div class="review-item-text">
														<a href="" class="review-item-title">
															<h2>${gameComentar.game.name}</h2>
														</a>
														<p class="review-item-text"></p>
														<span class="item-text-score" sytle="width: 56px"></span>
														<div>
															<a href=""> <p1>${gameComentar.comentar.usercomentar}</p1>
															</a>
														</div>
													</div></li>
											</c:forEach>
										</div>
									</ul>
								</section>
							</div>
							<div class="text-left">
								<div class="row">


									<section class="">
										<div class="">
											<h3>最近的恢复</h3>
										</div>
									</section>
								</div>
							</div>
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>



	</div>
	<!--页脚-->
	<%@include file="/WEB-INF/includes/footer1.jsp"%>


	<script type="text/javascript">
		
	</script>




</body>
</html>