<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<%@include file="/WEB-INF/includes/js-file.jsp"%>
<%@include file="/WEB-INF/includes/css-main-file.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Games Center Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<style>

/* 小火箭css */
#gotop1 {
    width: 80px;
    position: fixed;
    bottom: 90px;
    cursor: pointer;
    z-index: 99998;
    right: 50%;
    margin-right: -620px;
}

/* 小火箭悬停特效 */

#gotop1:hover {
    animation: rubberBand 1s;
}

@keyframes rubberBand {
  from {
    transform: scale3d(1, 1, 1);
  }

  30% {
    transform: scale3d(1.25, 0.75, 1);
  }

  40% {
    transform: scale3d(0.75, 1.25, 1);
  }

  50% {
    transform: scale3d(1.15, 0.85, 1);
  }

  65% {
    transform: scale3d(.95, 1.05, 1);
  }

  75% {
    transform: scale3d(1.05, .95, 1);
  }

  to {
    transform: scale3d(1, 1, 1);
  }
}

/* end 小火箭 */


</style>

<script >
	 $(function(){
			var show="null";
			if("${sessionScope.showpage}".length==0){
				show="firstpage.html"; 
			}else{
				show="${sessionScope.showpage}";
			}
			
			$.get("${ctp}/game/"+show,function(data){
			
				$(".pageContent").empty().append(data);
			});
			$("li[role='presentation']").click(function(){
				$(this).addClass("active").siblings("li[role='presentation']").removeClass("active");

				var href=$(this).find("a").attr("href");
			
				$.get(href,function(data){
				
					$(".pageContent").empty().append(data);
				});
				return false;
			}); 
			
			//点击标签a链接
			$(".pageContent").on("click","a.tabs_a",function(){
				var href = this.href;
				
				$.post(href,function(data){
					$(".pageContent").empty().append(data);
				});
				return false;
				
			});
			
			//游戏详情的a链接
			$(".pageContent").on("click","a.singlegame",function(){
				var href =this.href;
				$.post(href,function(data){
					$(".pageContent").empty().append(data);
				});
				return false;
			})
			
		
			// 返回顶部，绑定gotop1图标和gotop2文字事件
			$("#gotop1").click(function(e) {
			   TweenMax.to(window, 1.5, {scrollTo:0, ease: Expo.easeInOut});
			   var huojian = new TimelineLite();
				huojian.to("#gotop1", 1, {rotationY:720, scale:0.6, y:"+=40", ease:  Power4.easeOut})
				.to("#gotop1", 1, {y:-1000, opacity:0, ease:  Power4.easeOut}, 0.6)
				.to("#gotop1", 1, {y:0, rotationY:0, opacity:1, scale:1, ease: Expo.easeOut, clearProps: "all"}, "1.4");
			 });
	

		});
	 
	 
</script>

</head>
<body>
	<%@include file="/WEB-INF/includes/header.jsp"%>
	<!--json内容-->
	<div class="pageContent">
		<!-- 填充到此位置 -->
	</div>

	<!-- 右侧小火箭图标返回顶部 -->

	

	<!---->
	<%@include file="/WEB-INF/includes/footer.jsp"%>

</body>
</html>



