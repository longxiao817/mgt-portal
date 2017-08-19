<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	pageContext.setAttribute("pageInfo", "基本信息");
%>
<div class="auth-main-body profile-edit">
	<form id="basicinfo" class="form-horizontal"
		action="${ctp }/auth/saveinfo" method="post">
		<div class="form-group">
			<label class="col-sm-5 control-label">昵称</label>
			<div class="col-sm-4">
				<input name="nickname" class="form-control" id="nickname"
					type="text" value="${loginUser.userName }" disabled="disabled" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-5 control-label">生日</label>
			<div class="col-sm-4" style="display: inline;">
				<select name="birth_day" class="form-control" id="select_day">
					<option value="day" selected="selected">日</option>
					<c:forEach begin="1" end="31" varStatus="status">
						<option value="${status.index }">${status.index }</option>
					</c:forEach>
				</select> <select name="birth_month" class="form-control" id="select_month">
					<option value="month" selected="selected">月</option>
					<c:forEach varStatus="status" begin="1" end="12">
						<option value="${status.index }">${status.index }</option>
					</c:forEach>
				</select> <select name="birth_year" class="form-control col-sm-2"
					id="select_year">
					<option value="year">年</option>
					<c:forEach begin="1917" end="2017" varStatus="status">
						<option placeholder="年" value="${status.index }">${status.current }</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-5 control-label" for="gender">性别</label>
			<div class="col-sm-5">
				<select name="gender" class="form-control" id="gender">
					<option value="" selected="">-请选择-</option>
					<option value="male">男</option>
					<option value="female">女</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-5 control-label" for="mobile">手机号</label>
			<div class="col-sm-5">
				<input name="phone" class="form-control" id="mobilephone"
					type="text" value="">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-5 control-label" for="consignee_name">姓名</label>
			<div class="col-sm-5">
				<input name="realName" class="form-control" id="consignee_name"
					type="text" value="">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-5 control-label" for="consignee_address">身份证号</label>
			<div class="col-sm-5">
				<input name="idCard" class="form-control" id="consignee_address"
					type="text" value="">
			</div>
		</div>
	</form>
</div>
