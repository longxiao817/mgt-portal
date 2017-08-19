<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<section class="auth-main">
				<div class="auth-main-body login">
					<h1 class="auth-main-title">保密邮箱验证</h1>
					<div class="main-body-header">
						<p>
							<span>即刻加入游戏狂热者行列<br>
							</span>
						</p>
					</div>
					<div class="main-body-login">
						<div class="phone-register">
							<form class="phone-captcha-form" id="emailform"
								action="https://www.taptap.com/auth/login" method="post">
								<input name="_token" type="hidden"
									value="Xy31QxSBqBNuoWCfOMjieB34lOn7zyxb4XBN9N7I">
								<div class="form-group">
									<input name="country_code" required="" type="hidden" value="Email">
									<span class="country-code">@</span> <input id="emailinput" name="email"
										class="phone-number" type="text"
										placeholder="输入保密邮箱" value="" autocomplete="off">
									<p class="help-block error">
										<span>!</span> <span class="error-tip"></span>
									</p>
								</div>
								<div class="help-block">
									<p class="pull-right">
										<a href="${ctp }/regist.jsp">没有账号?
											去注册&gt;</a>
									</p>
								</div>
							</form>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>