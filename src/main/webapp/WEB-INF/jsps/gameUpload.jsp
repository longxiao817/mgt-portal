<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/include/css-file.jsp"%>
<link rel="stylesheet" href="${ctp}/css/main.css">
<title>Insert title here</title>
</head>
<body>
	<form action="${ctp }/upload/game" enctype="multipart/form-data" method="post" class="submitForm">
		<input type="hidden" name="id">
		游戏名字:<input name="name"><br>
		上传游戏图标:<input type="file" name="icon">
		游戏介绍:<input name="introduce">
		游戏上传:<input type="file" name="gamefile">
		更新内容：<input name="gameupdate">
		游戏大小:<input name="size">
		游戏版本:<input name="version">
		游戏介绍图片:<input type="file" name="gameimg" multiple>
		游戏类型:<input type="checkbox" name="tab" value="动作类">动作类
				<input type="checkbox" name="tab" value="冒险类">冒险类
			<input id="submit" type="submit" value="提交">
	</form>
	
	
	
	<%@include file="/include/jquery-file.jsp"%>
	<script type="text/javascript">
	$(function(){
		$("#submit").click(function(){
			var url=$(".submitForm").prop("action");
			var params = $(".submitForm").serialize();
			//url单击的按钮的url
			alert("123");
			$.post(url, params,function([]){
				
			})
			
			return false;
		})
	})	
	
		
	</script>
</body>
</html>