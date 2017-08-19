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
							<span>即刻加入游戏狂热者行列</span>
						</p>
					</div>
					<div class="main-body-login">
						<div class="phone-register">
							<form class="phone-captcha-form" role="form"
								action="https://www.taptap.com/auth/login" method="post">
								<input name="_token" type="hidden"
									value="Xy31QxSBqBNuoWCfOMjieB34lOn7zyxb4XBN9N7I">
								<div class="form-group">
									<input name="country_code" required="" type="hidden" value="Email">
									<span class="country-code">@</span> <input name="codeinput"
										class="phone-number" required="" type="text"
										placeholder="输入邮箱验证码" value="" autocomplete="off">
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
								<button disabled=""
									class="get-phone-captcha btn btn-primary btn-block"
									type="button" tap-action="login">获取验证码</button>
							</form>
						</div>
						<div class="third-account-wrapper">
							<div class="third-account-wrapper-item">
								<a class="weixinweb"
									href="https://www.taptap.com/social/weixinweb/connect">
									<div class="icon icon-weixinweb"></div> <span>微信</span>
								</a>
							</div>
							<div class="third-account-wrapper-item">
								<a class="qq" href="https://www.taptap.com/social/qq/connect">
									<div class="icon icon-qq"></div> <span>QQ</span>
								</a>
							</div>
							<div class="third-account-wrapper-item">
								<a class="facebook"
									href="https://www.taptap.com/social/facebook/connect">
									<div class="icon icon-facebook"></div> <span>Facebook</span>
								</a>
							</div>
							<div class="third-account-wrapper-item">
								<a href="https://www.taptap.com/auth/email/login">
									<div class="icon icon-email"></div> <span>邮箱帐号</span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>