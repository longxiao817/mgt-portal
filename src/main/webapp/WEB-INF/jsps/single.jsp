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
 
.round-corner-btn { 
	-moz-border-radius : 4px;
	-webkit-border-radius: 4px;
	-khtml-border-radius: 4px;
	border-radius: 4px;
	width: 200px;
	height: 40px;
	line-height: 40px;
	background: green;
	display: inline-block;
	color: white;
	text-align: center;
	cursor: pointer;
}

.avatar_size {
	font-size: 12px;
	text-align: center;
	margin-top: 4px;
}

.btn-hover {
	opacity: 0.8;
}

.adminbutton {
	border: #07A1EE 1px solid;
	background: #BFE7FA;
	height: 22px;
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
				<div class="col-sm-6 col-md-offset-3">
					<div class="card text-center">
						<div class="card-block">
							<div class="row">
								<a href="${ctp }/single/game?id=${game.id}"
									class="card-img-top text-left"> <img class="img-rounded"
									alt="${game.name}" src="${ctp }/${game.imgurl}" width="50">
								</a>
								<div class="card-block text-left">
									<p class="card-text">
										<a href="${ctp }/single/game?id=${game.id}" class="card-link"
											style="">${game.name}</a>
									</p>
									<p></p>

								</div>
								<div class="card-link">
									<button type="button" class="btn btn-link">分享</button>
								</div>
							</div>
							<span><br></span> <span><br></span> <span><br></span>
							<span><br></span>
							<div class="card-block">
								<a href="${ctp }/comentar/user?id=${user.userId}"><img
									class="img-circle" alt="" src="${ctp }/${user.userImage}"
									width="50"></a>
								<div>
									<a href="${ctp }/comentar/user?id=${user.userId}" class=""><h1>${user.userName }</h1></a>
									<span></span>
								</div>
								<ul class="list-group float:left ">
									<li class="list-group-item "><span> <fmt:formatDate
												type="date" value="${comentar.time }"
												pattern="yyyy年MM月dd HH:mm:ss"></fmt:formatDate>
									</span>
										<button class="">
											<span>举报</span>
										</button></li>
								</ul>

							</div>
							<div class="text-left">
								<p>${comentar.usercomentar }</p>
							</div>
							<div class="card-block">
								<button type="button" class="layui-btn layui-btn-primary ">
									<i class="layui-icon" style="font-size: 20px">&#xe60c;</i> <span>欢乐</span>
								</button>
								<button type="button" class="layui-btn layui-btn-primary zan">
									 
										<svg class="icon" aria-hidden="true">
  											<use xlink:href="#icon-zan" ></use>
										</svg>
										<span id="num"> </span>
										 
								</button>
								<button type="button" class="layui-btn layui-btn-primary zan">
										<svg class="icon" aria-hidden="true">
  											<use xlink:href="#icon-zan1" ></use>
										</svg> 
										<span id="number"> </span> 
								</button>
								<button type="button" id="replyBtn"
									class="layui-btn layui-btn-primary">
									<i class="layui-icon" style="font-size: 20px">&#xe63a;</i> 
									<span></span>
								</button>


							</div>
							<div class="row">
								<div class="card card-block">
									<h3 class="card-title">上一条评论</h3>
									<p class="card-text"></p>
								</div>
								<div class="card card-block">
									<h3 class="card-title">下一条评论</h3>
									<p class="card-text"></p>
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
		$(function(){
			$(".zan").click(function(){
				$(this).toggleClass("active");
				var className = $(this).attr("class");
				var num = parseInt($(">sapn",this).text());
				if(className == "active"){
					num +=1;
					$(">sapn",this).text("num");
				}
				
				
			});
			
			
				
				
			
		});
		
		$("#replyBtn").click(function(){
			//自定页
			layer.open({
				  type: 1, //Page层类型
				  area: ['500px', '300px'],
				  title: '你好，layer。',
				  shade: 0.6, //遮罩透明度
				  maxmin: true, //允许全屏最小化
				  anim: 1, //0-6的动画形式，-1不开启
				  content: '<div style="padding:50px;">这是一个非常普通的页面层，传入了自定义的html</div>',
				  btn: ['发表', '取消'],
			  		yes: function(index, layero){
			   		 //按钮【按钮一】的回调
			  		},
			  	  btn2: function(index, layero){
			    	//按钮【按钮二】的回调
			    
			    	//return false 开启该代码可禁止点击该按钮关闭
			  	}
			});    
		});
			
	</script>




</body>
</html>