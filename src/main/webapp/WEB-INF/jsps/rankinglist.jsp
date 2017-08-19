<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 
<div class="listpage">

<div class="container">
<span>
	<ul class="nav nav-tabs" role="tablist" >

		<li role="list" class="active" ty="hot-and"><a><span
				class="badge">1</span> 热门榜单</a></li>
		<li role="list" ty="ch-free"><a><span class="badge">2</span>中国榜</a></li>
		<li role="list" ty="usa-load"><a><span class="badge">3</span> 美国榜</a></li>
		
	</ul>
	</span>
</div>
	
	

	
	<div align="center" style="font-size: 25px" class="col-sm-12" >
	
	<ul class="tab">
	
		<li class="label label-success" role="list" ty="and"><a href="#" class="color1">Android榜</a></li>
		<li class="label label-warning" role="list" ty="ios"><a href="#" class="color2">iOS榜</a></li>
		<li class="label label-danger" role="list" ty="new"><a href="#" class="color3">新品榜</a></li>
		
	</ul>	
		
	</div>

	
	<div class="main"  align="center">

		<div class="content"></div>

    <button class="btn btn-primary btn-lg more"type="button">更多</button>
	</div>
</div>


<script type="text/javascript">
	$(function() {
		var pn=1;
		var ty="hot-and";
		$(".main").on("click",".more",function(){
			pn++;
			getList(ty,pn);
			
		});
		
		
		getList("hot-and",1);

		$(".listpage").on("click","li[role='list']",function() {
					$(this).addClass("active").siblings("li[role='list']")
							.removeClass("active");

					ty = $(this).attr("ty");
					if(ty=="hot-and"){
						$(".tab").empty().append("<li class='label label-success' role='list' ty='and'><a href='#' class='color1'>Android榜</a></li>"+
								"<li class='label label-warning' role='list' ty='ios'><a href='#' class='color2'>iOS榜</a></li>"+
								"<li class='label label-danger' role='list' ty='new'><a href='#' class='color3'>新品榜</a></li>");
					}else if(ty=="ch-free"){
						$(".tab").empty().append("<li class='label label-success' role='list' ty='free'><a href='#' class='color1'>免费榜</a></li>"+
								"<li class='label label-warning' role='list' ty='pay'><a href='#' class='color2'>付费榜</a></li>"+
								"<li class='label label-danger' role='list' ty='pop'><a href='#' class='color3'>畅销榜</a></li>");
					}else if(ty=="usa-load"){
						$(".tab").empty().append("<li class='label label-success' role='list' ty='load'><a href='#' class='color1'>下载榜</a></li>"+
								"<li class='label label-warning' role='list' ty='usa-new'><a href='#' class='color2'>新品榜</a></li>"+
								"<li class='label label-danger' role='list' ty='rev'><a href='#' class='color3'>营收榜</a></li>");
					}
					pn=1;
					getList(ty,pn);
					return false;
				});
		//列表
		function getList(ty,p) {
			$.ajax({
				url : "${ctp }/game/list",
				data : "ty=" + ty+"&pn="+p,
				type : "post",
				dataType : "json",
				beforeSend : function() {
					index = layer.load();
				},
				success : function(pageInfo) {
					if(p<=pageInfo.pages){
						if(p==1){
							num=1;
							$(".content").empty();
						}
					showPagesToTable($(".content"), pageInfo);
					
					}
					if(p==pageInfo.pages){
						$(".more").remove();
					}else{
						if($(".more").size()==0){
							$(".main").append(" <button class='btn btn-primary btn-lg more'type='button'>更多</button>");
						}

					}
				
					layer.close(index);
				},
				error : function(a) {
					alert("失败了");
				}
			})
		}
		var num = 1;
		function showPagesToTable(tab, pageInfo) {
			$.each(pageInfo.list,function() {
				console.log(this)
				var tabs=this.tab.split("-");
				var tabs_a="";
				 for (var i = 0; i < tabs.length; i++) {
						tabs_a+= "<a class='btn btn-xs btn-default tabs_a' href='${ctp}/game/tab?tabs="+tabs[i]+"'>"+tabs[i]+"</a>";
						
					}
				
								var tr = $("<tr></tr>")
										.append(
												"<div class='card'><table><tr><td><div class='card-block'>"
														+"<h4>NO."+ (num++)+"</h4>"
														+ "<h3 class='card-title'>"
														+ this.name
														+ "</h3><p class='card-text'>游戏介绍："+this.introduce
														+ "</p><p class='card-text'><small class='text-muted'>Last updated 3 mins ago</small></p></div><p>"
														+"<div class='card-tags'>"+tabs_a+"</div>"
														+ "<a href='${ctp}/game/game?id="+this.id+"' class='btn btn-primary btn-lg singlegame'>详情</a></p></td><td>"
														+ "<img class='card-img-top' src='images/2.jpg' width=auto height=150 data-src='holder.js/50%x60/' alt='Card image cap' />"
														+ "</td><td><img class='card-img-top' src='"+this.imgurl+"' width=auto height=150 data-src='holder.js/50%x60/' alt='Card image cap'>"
														+ "</td></tr></table></div>");
								tab.append(tr);

							});
		}
		
		
	});

	
</script>

