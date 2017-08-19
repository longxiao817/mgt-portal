<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="listpage">

	<div class="container">
		<span>
	</div>

	<div class="main review" align="center">

		<div class="content">
			<div class="card" style="width: 45rem;">
				<table>
					<tr>
						<td>
							<div class="card-block">
								<a><img class="card-img-top" align="left"
									src="${game.imgurl}" width=auto height=150></a>
						</td>
						<td>
							<div>
								<h4 class="card-title">
									<a style="font-size: 30px" href="" class="card-link">${game.name }</a>
								</h4>
							</div>

							<p class="card-text">
							<h2>${game.introduce }</h2>
							</p>
						</td>
						<td><footer class="text-right">
								<small class="text-muted"> <cite title="Source Title">
								
										<h4>版本号:${game.version },更新内容:${game.gameupdate }</h4>
								</cite>
								</small>
								
								<div align="center">
									<a href="#" class='btn btn-primary btn-lg'>安装</a>
								</div>
							</footer></td>
						</div>
						</td>
					</tr>
				</table>
			</div>

				<div class="card" style="width: 45rem;" align="left">
				<div class="container">
					<span>
				<ul class="nav nav-tabs" role="tablist" >
			
					<li flag="0" role="gamelist" class="active" style="width: 15rem;"><a href="${ctp}/game/game?id=${game.id }"><span
							class="badge"></span>详情</a></li>							
					<li flag="1" role="gamelist" style="width: 15rem;"><a href="${ctp}/game/game1?id=${game.id }"><span class="badge"></span>评价</a></li>
					<li flag="2" role="gamelist" style="width: 15rem;"><a><span class="badge"></span>论坛</a></li>
					
				</ul>
					</span>
					
				
						<div class="coms">
							<div class='coms'><div>游戏详细介绍：${game.introduce }</div>
							<div>游戏大小 ：${game.size }</div>
							<div class='imgUrls'>游戏画面：</div>
						</div>
					
				
				</div>
			</div>


		</div>
	</div>
</div>


<script type="text/javascript">
	$(function() {
		
		showdetails();
		
		function showdetails(){
			
			var imgsUrl="${game.imgurls}";
			var imgstr = imgsUrl.split(",", 100);
			
			$.each(imgstr,function(){
				
				$(".imgUrls").append("<img width=auto height=150  src='${ctp}"+this+"'>");
			})

		}
		$(".content").on("click","li[role='gamelist']",function(){
			$(this).addClass("active").siblings("li[role='gamelist']")
			.removeClass("active");
		/* 	var flag = $(this).attr("flag");
			var href=this.find("a").prop("href");
					$.post(href,function(data){
						showdetails();
					}
					return false; */
		})
		
		
	});
</script>

