package com.atguigu.mgt.portal.bean;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.atguigu.mgt.manager.bean.TUsers;
import com.atguigu.mgt.portal.service.UserService;

public class LoginShiroRealm extends AuthorizingRealm {

	@Autowired
	UserService userService;
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		
		
		
		return null;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		
		// 获取controlelr传过来的数据,将token转换为usernamepasswordtoken,或者直接获取username转换为String
		UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token;
		String loginAcct = usernamePasswordToken.getUsername();
		System.out.println(loginAcct + "***********************");
		System.out.println("query from the database... ...");
		// 从数据库查询要登陆的账户是否存在
		TUsers user = userService.getUserByLoginAcct(loginAcct);
		
		if(null == user) {
			throw new UnknownAccountException("用户不存在");
		}
		
		String passwd= user.getPasswd();
		AuthenticationInfo info = new SimpleAuthenticationInfo(user, passwd, this.getName());
		return info;
	}

	
}
