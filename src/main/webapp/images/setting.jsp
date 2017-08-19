<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	pageContext.setAttribute("cttp", session.getServletContext()
			.getContextPath());
	pageContext.setAttribute("header", "UserSettings");
%>
<title>Login</title>
<%@ include file="/includes/js-file.jsp"%>
<%@ include file="/includes/css-main-file.jsp"%>

<style type="text/css">
lable {
	color: orangered;
}

#favourite {
	list-style:  none;
	    margin-left:  50px;
}

  
  
 #favourite li  {
	display:  inline;
	line-height:  40px;
	font-size: xx-large;
}

 #favourite li span {
	color: green;
	font-size: xx-large;
	display:  inline;
	line-height:  40px;
}
  
</style>
</head>
<body>

	<%@ include file="/includes/header.jsp"%>


			

	<%@ include file="/includes/footer.jsp"%>
</body>
</html>