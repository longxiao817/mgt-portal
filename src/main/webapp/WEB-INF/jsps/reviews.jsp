<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/includes/css-file.jsp"%>
<title>安利墙</title>

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
			<div class="card-title text-center">
				<h1 style="color: blue">安利墙</h1>
				<p>看看大家都在做什么</p>
			</div>
			<div class="card-columns">
				 <c:forEach items="${comentars_info.list}" var="card">


					<div class="card">
						<div class="card-block">
							<div class="row">


								<a href="${ctp }/comentar/game?id=${card.game.id}"
									class="card-link"> <img class="card-img-top"
									src="${ctp }/${card.game.imgurl}" alt="" width="50"
									title="${card.game.name }">
								</a>

								<div>
									<h4 class="card-title">
										<a href="${ctp }/comentar/game?id=${card.game.id}"
											class="card-link">${card.game.name }</a>
									</h4>
								</div>
							</div>
						</div>
						<div class="card-block">

							<p class="card-text">
								<a href="${ctp }/comentar/reply?id=${card.comentar.id}"
									class="card-link">${card.comentar.usercomentar}</a>
							</p>
							<br>


							<footer class="text-right">
								<small class="text-muted"> <cite title="Source Title">
										<a href="${ctp }/comentar/reply?id=${card.comentar.id}"
										class="card-link">${card.user.userName } </a>
								</cite>
								</small>
							</footer>
						</div>
					</div>
				</c:forEach> 

				<%-- <tfoot>
					<tr>
						<td colspan="6" align="center">
							<ul class="pagination">
								<!-- 即使点击分页连接也应该带上查询条件的值 -->
								<!-- 给分页超链接绑定单击事件； -->
								<li><a href="${ctp}/comentar/list?pn=1">首页</a></li>
								<c:if test="${comentars_info.hasPreviousPage}">
									<li><a
										href="${ctp}/comentar/list?pn=${comentars_info.prePage}">上一页</a></li>
								</c:if>

								<!-- 遍历连续显示的页面 navigatepageNums : int[]-->
								<c:forEach items="${comentars_info.navigatepageNums}" var="pn">
									<c:if test="${pn == comentars_info.pageNum }">
										<li class="active"><a
											href="${ctp}/comentar/list?pn=${pn}">${pn } <span
												class="sr-only">(current)</span>
										</a></li>
									</c:if>
									<c:if test="${pn != comentars_info.pageNum }">
										<li><a href="${ctp}/comentar/list?pn=${pn}">${pn }</a></li>
									</c:if>
								</c:forEach>




								<c:if test="${comentars_info.hasNextPage}">
									<li><a
										href="${ctp}/comentar/list?pn=${comentars_info.nextPage}">下一页</a></li>
								</c:if>
								<li><a
									href="${ctp}/comentar/list?pn=${comentars_info.pages}">末页</a></li>
							</ul>
						</td>
					</tr>

				</tfoot>
 --%>


			</div>



		</div>

	</div>



	<script type="text/javascript">
	$("li[role='presentation']").click(function(){
		var href1 = $(this).find("a").attr("href1");
		window.location.href=href1;
		return false;
	});
	
		var pn = 1;
		
		$(window).scroll(function(event){  
		    var wScrollY = window.scrollY; // 当前滚动条位置    
		    var wInnerH = window.innerHeight; // 设备窗口的高度（不会变）    
		    var bScrollH = document.body.scrollHeight; // 滚动条总高度        
		    if (wScrollY + wInnerH >= bScrollH) {  
	    		pn++;
	    		alert(pn);
				$.ajax({
					url : "${ctp}/comentar/json",
					type : "get",
					data : "pn="+pn,
					success : function(result){
						//展示评论卡片
						
						 if(pn <= result.pages){
							 showComentarCard($(".card-columns"),result.list);
						}
						
					}
					
				});
			} 
		});
	
		//构建卡片
		function showComentarCard(divEle, data) {
			$.each(data,function() {
				var divCard = $("<div class='card'></div>")
					.append(
						"<div class='card-block'>"
							+ "<a href='#' class='card-link'> "
							+ "<img class='card-img-top' src='"+this.game.imgurl+"' alt='' width='50' title='"+this.name+"'>"
							+ "</a>"
							+ "<div>"
							+ "<h4 class='card-title'>"
							+ "<a href='#' class='card-link'>"
							+ this.game.name
							+ "</a>"
							+ "</h4></div>"
							+ "</div>"
							+ "<div class='card-block'>"
							+ "<p class='card-text'>"
							+ "<a href='#' class='card-link'>"
							+ this.comentar.usercomentar
							+ "</a>"
							+ "</p>"
							+ "</br>"
							+ "<footer class='text-right'>"
							+ "<small class='text-muted'> <cite title='Source Title'>"
							+ "<a href='#' class='card-link'>"+this.user.userName+"</a>"
							+ "</cite>"
							+ "</small>"
							+ "</footer>"
							+ "</div>");

					divEle.append(divCard);

					});

		}
	</script>
	<!--页脚-->
	<%@include file="/WEB-INF/includes/footer1.jsp"%>
</body>
</html>