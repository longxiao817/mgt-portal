<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
							<li role="presentation"  class="active"><a class="color1" href1="${ctp}/index.jsp" href="${ctp}/game/firstpage.html">首页</a></li>
							<li role="presentation" ><a class="color2" href1="${ctp}/index.jsp" href="${ctp}/game/rankinglist.html">排行榜</a></li>
							<li ><a class="color3" href="${ctp }/comentar/list"">安利墙</a></li>
							<li role="presentation" ><a class="color4" href="404.html">发现</a></li>
							<li role="presentation" ><a class="color5" href="blog.html">论坛</a></li>
							<li role="presentation" ><a class="color6" href="contact.html">Contact</a></li>
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
	