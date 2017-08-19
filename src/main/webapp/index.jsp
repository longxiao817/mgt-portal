<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>index page for login test</h1>

<a href="${ctp }/shiro/success.jsp">success page</a>
<a href="${ctp }/shiro/test.jsp">test page</a>
<a href="${ctp }/users/personnelcenter">个人中心</a>


<a href="${ctp }/auth/prodeploy">process deployment</a>
<form action="${ctp }/auth/prodeploy" method="post">

	<input type="file" value="文件上传"/>
	<input type="submit" value="submit" />
</form>
</body>
</html>