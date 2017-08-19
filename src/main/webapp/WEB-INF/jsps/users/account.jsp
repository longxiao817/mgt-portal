<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Info| Living For Games</title>
<%@ include file="/includes/js-file.jsp"%>
<%@ include file="/includes/css-main-file.jsp"%>
<script type="text/javascript" src="${ctp }/plugin/jstep/ystep.js"></script>
<link rel="stylesheet" href="${ctp }/plugin/jstep/css/ystep.css">
<link rel="stylesheet" href="${ctp }/css/taptap2.css" />
<link rel="stylesheet" href="${ctp }/css/taptap1.css" />
<!-- 引入jquery -->
<script src="${ctp }/plugin/jstep/jquery.min.js"></script>
<!-- 引入ystep插件 -->
<script src="${ctp }/plugin/jstep/ystep.js"></script>
<script type="text/javascript">
	$(function() {
		$(".thumbnail").click(function() {
			$('.seltype').remove();
			$(this).prepend('<div class="glyphicon glyphicon-ok seltype"></div>');
		});

		// 到基本信息添加頁面
		$("#stepbtn").click(function() {
			var step = $("#stepbtn").attr("step");
			if (step == "one") {
				var aEle = $(".seltype").parent("a");
				var acctType = aEle.attr("act_type");
				var url = $(this).attr("url");
				$(this).attr("acctType", acctType);
				// 				alert($(this).attr("acctType"));
				if (aEle.length == 1) {
					//找到加了表示的a连接
					$
							.ajax({
								url : url,
								success : function(data) {
									$(".ystep2").setStep(2);
									$("input[name='userType']")
											.val(acctType);
									$("#stepbtn").attr("step",
											"two");
									$(".ajaxbody").empty()
											.append(data);
								},
								error : function(data) {
									alert(123456);
								}
							});
				} else {
					layer.msg("请先选择账户类型哦！");
				}
			} else if (step == "two") {
				alert($("#select_day").val());
				var type = $(this).attr("acctType");
				var fd = $("#basicinfo").serialize();
				$("input[name='userType']").val(type);
				$.ajax({
					url : "${ctp }/auth/saveinfo?userType="
							+ type,
					data : fd,
					success : function(data) {
						$(".ystep2").setStep(3);
						$("#stepbtn").attr("step", "three");
						$(".ajaxbody").empty().append(data);
					},
					error : function(data) {
						alert(123456);
					}
				});
			} else if (step == "three") {

				var fd = new FormData($("#fileForm")[0]);
				var loginAcct = "${loginUser.loginAcct}";
				alert(loginAcct);
				$.ajax({url : "http://127.0.0.1:8081/mgt-restapi/savecertinfo?loginAcct="
									+ loginAcct,
							data : fd,
							method : "post",
							contentType : false,
							processData : false,
							success : function(data) {
								console.log(data);
								$.ajax({url : "${ctp}/auth/emailpage.html",
											success : function(res) {
												$(".ystep2").setStep(4);
												$("#stepbtn").attr("step","four");
												$(".ajaxbody").empty().append(res);
											}
										});
							}
						})
			} else if (step == "four") {
				
				var email = $("#emailinput").val();
				$.ajax({
					url : "${ctp}/auth/confirmemail?email=" + email,
					success : function(res) {
						$(".ystep2").setStep(5);
						$("#stepbtn").attr("step","five");
						$(".ajaxbody").empty().append(res);
					}
				});
			} else if (step == "five") {
				
				var code = $("#codeinput").val();
				$.ajax({
					url : "${ctp}/auth/codeconfirm/code=" + code,
					success :function(res) {
						$(".ystep2").setStep(6);
						$(this).remove();
						$(".ajaxbody").empty().append(res);
					}
				});
			}
			//发送请求；
		});

		//根据jQuery选择器找到需要加载ystep的容器
		//loadStep 方法可以初始化ystep
		$(".ystep2").loadStep({
			size : "large",
			color : "green",
			steps : [ {
				title : "账户选择",
				content : "选择当前用户的账户类型"
			}, {
				title : "基本信息",
				content : "个人基本信息"
			}, {
				title : "证件信息",
				content : "上传实名制的身份信息"
			}, {
				title : "保密邮箱",
				content : "输入注册时使用的保密邮箱"
			}, {
				title : "验证码验证",
				content : "输入保密邮箱的验证码"
			}, {
				title : "人工审核",
				content : "等待人工进行审核"
			}, {
				title : "审核结束",
				content : "发送审核结果通知"
			} ]
		});
		$(".ystep2").setStep(1);

		//为文件选择项绑定事件；
		$("input[type='file']")
				.change(
						function(event) {
							//alert("aa");
							//拿到图片项。进行显示
							//1、回调函数需要获取到事件对象
							//2、可以用事件对象得到很多信息
							var files = event.target.files; //this.files[0]
							var file;
							if (files && files.length > 0) {
								file = files[0];
							}
							var reg = /image*/;
							if (!reg.test(file.type)) {
								alert("请选择一个图片");
								//不是图片将val置空
								$(this).val("");
								return false;
							}
							;

							var URL = window.URL || window.webkitURL;
							//创建一个临时的url地址
							var imgURL = URL.createObjectURL(file);
							alert(imgURL);
							$(this)
									.nextAll("div.imgShow")
									.empty()
									.append(
											"<img src='"+imgURL+"' style='width:400px;height:240px;'/>");
							//console.log(file);
						});
	});
</script>
<style type="text/css">
#footer {
	padding: 15px 0;
	background: #fff;
	border-top: 1px solid #ddd;
	text-align: center;
}

.seltype {
	position: absolute;
	margin-top: 70px;
	margin-left: 10px;
	color: red;
}

#stepbtn {
	color: #fff;
}
</style>
</head>
<body>

	<%@ include file="/includes/header.jsp"%>

	<div class="container">
		<div class="row">
			<ol class="breadcrumb">
				<li><span>你的位置:</span></li>
				<li><a href="${ctp }/index.jsp">首页</a></li>
				<li><a href="${ctp }/users/personnelcenter.html">${loginUser.userName }的个人中心</a>
				</li>
				<li class="bg-active"><span>实名认证</span></li>
				<span class="breadcrumb-end"></span>
			</ol>
		</div>
		<!-- ystep容器 -->
		<br />
		<div class="ystep2" style="text-align: center;"></div>
		<div class="ajaxbody">
			<div class="auth-main-body profile-edit">
				<div style="padding-top: 10px;">
					<div class="row">
						<c:forEach items="${list }" var="type">
							<div class="col-xs-6 col-md-3">
								<h2>${type.typeName }</h2>
								<!--  当前页面-->
								<a class="thumbnail" act_type="${type.typeName }"> <img
									alt="100%x180" src="${ctp }/${type.url}"
									data-holder-rendered="true"
									style="height: 180px; width: 100%; display: block;">
								</a>
							</div>
						</c:forEach>
					</div>

				</div>
				<!-- /container -->
			</div>
		</div>
		<div class="ajaxdiv col-sm-12">
			<button step="one" id="stepbtn" acctType="" type="button"
				class="btn btn-success btn-lg btn-block" url="${ctp}/auth/editinfo.html">下一步</button>
		</div>
	</div>
	<%@ include file="/includes/footer.jsp"%>

</body>
</html>