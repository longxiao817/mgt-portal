<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="authBody" class="auth-main-body profile-edit">
	<form id="fileForm" class="form-horizontal" method="post"
		enctype="multipart/form-data">
		<div class="form-group">
			<label class="col-sm-5 control-label">昵称</label>
			<div class="col-sm-4">
				<input name="userName" class="form-control" id="nickname"
					type="text" value="${loginUser.userName }" disabled="disabled" />
			</div>
		</div>
		<c:forEach items="${certs }" var="cert">
			<div class="form-group">
				<label class="col-sm-5 control-label" for="cert1">${cert.certName }</label>
				<div class="col-sm-5">
					<input type="hidden" name="id" value="${cert.id }" /> <input
						type="file" name="file" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-5 control-label" for="cert1">预览</label>
				<div class="col-sm-5 imgShow"></div>
			</div>
		</c:forEach>
	</form>
</div>


