<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="listpage">

	<div class="container">
		<span>
	</div>

	<div class="main review" align="center">
		<h1>${tab_name }类</h1>
		<div class="content" >	
			
			<div class="card-columns" align="center">
				<c:forEach items="${info.list}" var="list">
				
					 <div class="card">
						<div class="card-block">
							<a href="${ctp}/game/game?id=${list.id }" class='singlegame'><img class="card-img-top" align="left" src="${ list.imgurl}" width=auto height=150></a>
							<div>
								<h4 class="card-title">
									<a style="font-size: 30px" href="${ctp}/game/game?id=${list.id }" class="card-link singlegame">${list.name }</a>
								</h4>
							</div>
						</div>
						<div class="card-block">
							<p class="card-text">
								<h2>${list.introduce }</h2>
							</p>
							</br>
							<footer class="text-right">
								<small class="text-muted"> <cite title="Source Title">
										<h4>版本号:${list.version },更新内容:${list.gameupdate }</h4>
								</cite>
								</small>
							</footer>
						</div>
					</div> 
				</c:forEach>
			
			</div>
			
				
		</div>

		
	</div>
</div>


<script type="text/javascript">
	$(function() {
		var pn=1;
		
		$(window).scroll(function(){
		  　　var scrollTop = $(this).scrollTop();
		  　　var scrollHeight = $(document).height();
		  　　var windowHeight = $(this).height();
		  　　if(scrollTop + windowHeight == scrollHeight){
			  
				  　　　pn++;
					$.post("${ctp}/game/tab1?tabs=${sessionScope.tab_name}&pn="+pn,function(data){
						
						if(pn<=data.pages){
							console.log(data.list);
							$.each(data.list,function() {
								console.log(this);
								$(".card-columns").append(
										"<div class='card'><div class='card-block'>"
										+"<a href='${ctp}/game/game?id="+this.id+"' class='singlegame' href='"+this.url+"'><img class='card-img-top' align='left' src='"+this.imgurl+"' width=auto height=150></a>"
										+"<div><h4 class='card-title'><a style='font-size: 30px' href='${ctp}/game/game?id="+this.id+"' class='card-link singlegame'>"+this.name+"</a>"
										+"</h4></div></div><div class='card-block'><p class='card-text'><h2>"+this.introduce+"</h2>"
										+"</p></br><footer class='text-right'><small class='text-muted'> <cite title='Source Title'>"
										+"<h4>版本号:${list.version },更新内容:"+this.gameupdate+"</h4></cite></small></footer></div></div>"
								);
								
							});
						}
					
					});
		  　　}
		  });
			
			
		
		
		
	});
</script>

