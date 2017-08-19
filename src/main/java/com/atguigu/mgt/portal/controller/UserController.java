package com.atguigu.mgt.portal.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.mgt.manager.bean.TGames;
import com.atguigu.mgt.manager.bean.TType;
import com.atguigu.mgt.manager.bean.TUsers;
import com.atguigu.mgt.portal.bean.MgtReturn;
import com.atguigu.mgt.portal.service.GameService;
import com.atguigu.mgt.portal.service.UserService;
import com.atguigu.project.HttpClientUtil;
import com.atguigu.project.MD5Util;
import com.atguigu.project.RemoteSever;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@RequestMapping("/users")
@Controller
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	GameService gameService;

	/**
	 * 
	 * @return
	 */
	@RequestMapping("/getusergames")
	public String getUserGames() {

		return "auth/gamebrief";
	}

	/**
	 * 用戶登出
	 * 
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout() {

		Subject loginUser = SecurityUtils.getSubject();
		loginUser.logout();
		return "redirect:/index.jsp";
	}

	/**
	 * 到个人中心页面
	 * 
	 * @return
	 */
	@RequestMapping("/personnelcenter")
	public String personnelCenter() {

		return "users/personnelcenter";
	}

	/**
	 * 进行礼仪考试页面
	 * 
	 * @return
	 */
	@RequestMapping("/exam.html")
	public String exam() {

		return "users/exam";
	}

	/**
	 * 到账户选择页面,从数据库中拿出所有的数据进行遍历 并跳转到账户选择页面
	 * 
	 * @return
	 */
	@RequestMapping("/profile.html")
	public String editInfo(Model model, HttpSession session) {

		TUsers loginUser = (TUsers) session.getAttribute("loginUser");

		if (loginUser.getCertification() != 1) {
			return "users/personnelcenter";
		}

		String url = RemoteSever.getRemoteSever() + "/profile";
		String result = HttpClientUtil.httpGetRequest(url);

		try {
			MgtReturn<List<TType>> value = new ObjectMapper().readValue(
					result.getBytes(),
					new TypeReference<MgtReturn<List<TType>>>() {
					});
			if (value.getCode() == 1) {
				model.addAttribute("list", value.getContent());
				return "users/account";
			} else {
				return "redirect:/users/personnelcenter";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/users/personnelcenter";
		}
	}

	/**
	 * 跳转到设置页面
	 * 
	 * @return
	 */
	@RequestMapping("/settings")
	public String toSettings() {

		return "users/setting";
	}

	/**
	 * 重置密码
	 * 
	 * @param passwd
	 * @return
	 */
	@RequestMapping("/resetPswd")
	public String resetPswd(@RequestParam("passwd") String passwd,
			@RequestParam("token") String token, Model model) {

		System.out.println(passwd);
		System.out.println(token);

		String url = RemoteSever.getRemoteSever() + "/resetPswd";
		Map<String, Object> params = new HashMap<>();
		params.put("passwd", passwd);
		params.put("token", token);

		MgtReturn<TUsers> value = null;
		try {
			String result = HttpClientUtil.httpPostRequest(url, params);

			try {
				value = new ObjectMapper().readValue(result.getBytes(),
						new TypeReference<MgtReturn<TUsers>>() {
						});
				if (value.getCode() == 1) {
					model.addAttribute("msg", value.getMsg());

				} else {
					model.addAttribute("msg", value.getMsg());
				}
			} catch (IOException e) {
				model.addAttribute("msg", "密码重置链接失效了,请重新操作!");
				e.printStackTrace();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			model.addAttribute("msg", "密码重置失败,请重新操作!");
		}

		return "redirect:/login.jsp";
	}

	/**
	 * 跳转到重置密码页面
	 * 
	 * @return
	 */
	@RequestMapping("/toResetPswdPage")
	public String toResetPswdPage() {

		return "users/resetpswd";
	}

	/**
	 * 向注册邮箱发送重置密码邮件
	 * 
	 * @param email
	 * @return
	 */
	@RequestMapping("/findpswd")
	public String getBackPswd(String email) {

		String url = RemoteSever.getRemoteSever() + "/findpswd";

		Map<String, Object> params = new HashMap<>();
		params.put("email", email);
		String result = null;
		try {
			result = HttpClientUtil.httpPostRequest(url, params);

			MgtReturn<TUsers> readValue = new ObjectMapper().readValue(
					result.getBytes(), new TypeReference<MgtReturn<TUsers>>() {
					});
			if (readValue.getCode() == 1) {
				System.out.println("重置密码邮件发送成功!");
			} else {
				System.out.println("邮箱不存在!!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/login.jsp";
	}

	/**
	 * 到找回密码页面
	 * 
	 * @return
	 */
	@RequestMapping("/togetbackpswd")
	public String toFindpwdPage() {

		return "findpwd";
	}

	/**
	 * 用户登陆完成
	 * 
	 * @param user
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/login")
	public String login(@RequestParam("loginAcct") String loginAcct,
			@RequestParam("passwd") String passwd,Model model,
			HttpServletRequest request) {
		
	
		
		Subject currentUser = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(loginAcct,
				MD5Util.digest16(passwd));

		if (!currentUser.isAuthenticated()) {
			// 将用户名和密码重新封装为用户对象
			try {
				HttpSession session = request.getSession();
				currentUser.login(token);
				TUsers loginUser = userService.getUserByLoginAcct(loginAcct);
				session.setAttribute("loginUser", loginUser);

				// 查出所有玩过的游戏
				List<TGames> games = gameService.getAllGamesByUserId(loginUser
						.getUserId());
				if (games != null && games.size() > 0) {
					session.setAttribute("playedGames", games.get(0));
					session.setAttribute("gameNum", games.size());
				}

				// 查出所有的fans数量
				List<TUsers> fans = userService.getFansByUserId(loginUser
						.getUserId());
				if (fans != null && fans.size() > 0) {
					session.setAttribute("fans", fans);
					session.setAttribute("fanNum", fans.size());
				}

				// 查出所有关注的数量
				List<TUsers> focus = userService.getAllFocusByUserId(loginUser
						.getUserId());
				if (focus != null && focus.size() > 0) {
					session.setAttribute("focus", focus);
					session.setAttribute("focusNum", focus.size());
				}

			} catch (AuthenticationException ae) {
				System.out.println("login failed" + ae.getMessage());
				return "forward:/login.jsp";
			}
			return "forward:/index.jsp";
		} else {
			TUsers user = (TUsers) currentUser.getPrincipal();
			if (!user.getLoginAcct().equals(loginAcct)) {
				currentUser.logout();
				try {
					HttpSession session = request.getSession();
					currentUser.login(token);
					TUsers loginUser = userService
							.getUserByLoginAcct(loginAcct);
					session.setAttribute("loginUser", loginUser);
					if (session.getAttribute("playedGames") == null) {
						List<TGames> games = gameService
								.getAllGamesByUserId(loginUser.getUserId());
						if(games != null && games.size() > 0) {
							session.setAttribute("userGames", games);
							session.setAttribute("playedGames", games.get(0));
							session.setAttribute("gameNum", games.size());
						}
					}
					if (session.getAttribute("fans") == null) {

						List<TUsers> fans = userService.getFansByUserId(loginUser.getUserId());
						if(fans != null && fans.size() > 0) {
							session.setAttribute("fans", fans);
							session.setAttribute("fanNum", fans.size());
						}
					}
					if (session.getAttribute("focus") == null) {
						List<TUsers> focus = userService
								.getAllFocusByUserId(loginUser.getUserId());
						if (focus != null && focus.size() > 0) {
							session.setAttribute("focus", focus);
							session.setAttribute("focusNum", focus.size());
						}
					}
					return "forward:/index.jsp";
				} catch (AuthenticationException e) {
					e.printStackTrace();
					return "redirect:/login.jsp";
				}
			}
			return "redirect:/login.jsp";
		}
	}

	/**
	 * 登陸方法(内部调用方法)
	 * 
	 * @param currentUser
	 * @param loginAcct
	 * @param password
	 * @return
	 */
	private String login(Subject currentUser, String loginAcct, String password) {
		String result = "login";
		UsernamePasswordToken token = new UsernamePasswordToken(loginAcct,
				password);
		token.setRememberMe(false);
		try {
			currentUser.login(token);
			result = "success";
		} catch (UnknownAccountException uae) {
			result = "failure";
		} catch (IncorrectCredentialsException ice) {
			result = "failure";
		} catch (LockedAccountException lae) {
			result = "failure";
		} catch (AuthenticationException ae) {
			result = "failure";
		}
		return result;
	}

	/**
	 * ajax验证用户名是否可用
	 * 
	 * @param loginAcct
	 * @param model
	 */
	@ResponseBody
	@RequestMapping(value = "/verifyLoginAcct", produces = "text/plain;charset=UTF-8")
	public String verifyLoginAcct(String loginAcct, Model model) {

		if (loginAcct == null || "".equals(loginAcct.trim())) {
			return "用户名不能为空!!";
		}
		if (loginAcct.trim().length() < 5 || loginAcct.trim().length() > 13) {
			return "用户名不能小于5位或大于13位";
		}

		String url = RemoteSever.getRemoteSever() + "/verifyLoginAcct";
		Map<String, Object> params = new HashMap<>();
		params.put("loginAcct", loginAcct);

		String response = null;
		MgtReturn<TUsers> readValue = null;

		try {
			response = HttpClientUtil.httpGetRequest(url, params);
			try {
				readValue = new ObjectMapper().readValue(response.getBytes(),
						new TypeReference<MgtReturn<TUsers>>() {
						});
				if (readValue.getCode() == 1) {
					return "用户名可以使用";
				} else {
					return "用户名已经被占用!!";
				}
			} catch (Exception e) {
				e.printStackTrace();
				return "用户名已经被占用!";
			}
		} catch (Exception e) {
			e.getStackTrace();
			return "用户名不能使用!";
		}
	}

	/**
	 * 邮箱ajax验证
	 * 
	 * @param email
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/verifyEmail", produces = "text/plain;charset=UTF-8")
	public String verifyEmail(@RequestParam("email") String email, Model model) {

		System.out.println("receive the ajax request ... ...");

		if (email == null || "".equals(email.trim())) {
			return "邮箱名不能为空";
		}

		String url = RemoteSever.getRemoteSever() + "/verifyEmail";
		Map<String, Object> params = new HashMap<>();
		params.put("email", email);

		String response = null;
		MgtReturn<TUsers> readValue = null;
		try {
			response = HttpClientUtil.httpPostRequest(url, params);
			try {
				readValue = new ObjectMapper().readValue(response.getBytes(),
						new TypeReference<MgtReturn<TUsers>>() {
						});

				if (readValue.getCode() == 1) {
					return "邮箱可以使用";
				} else {
					return "邮箱已经被占用!";
				}
			} catch (Exception e) {
				e.printStackTrace();
				return "邮箱不能使用";
			}
		} catch (Exception e) {
			e.getStackTrace();
			return "邮箱不能使用";
		}
	}

	/**
	 * 用户注册
	 * 
	 * @param user
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/registUser")
	public String registUser(TUsers user, Model model, HttpSession session) {

		String url = RemoteSever.getRemoteSever() + "/registUser";

		System.out.println(user);

		Map<String, Object> params = new HashMap<>();
		params.put("loginAcct", user.getLoginAcct());
		params.put("email", user.getEmail());
		params.put("userName", user.getUserName());
		params.put("passwd", user.getPasswd());
		String response = null;
		MgtReturn<TUsers> result = null;
		try {
			response = HttpClientUtil.httpPostRequest(url, params);
			System.out.println(response);
			try {
				result = new ObjectMapper().readValue(response.getBytes(),
						new TypeReference<MgtReturn<TUsers>>() {
						});
				model.addAttribute("registmsg", result.getMsg());

			} catch (Exception e) {
				e.printStackTrace();
				return "forward:/regist.jsp";
			}

			if (result.getCode() == 1) {
				return "redirect:/login.jsp";
			} else {
				return "forward:/regist.jsp";
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return "forward:/regist.jsp";
		}
	}
}
