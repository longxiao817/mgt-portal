package com.atguigu.mgt.portal.controller;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.atguigu.mgt.manager.bean.TCert;
import com.atguigu.mgt.manager.bean.TUsers;
import com.atguigu.mgt.portal.bean.ScwReturn;
import com.atguigu.mgt.portal.service.CertService;
import com.atguigu.mgt.portal.service.UserService;
import com.atguigu.project.HttpClientUtil;
import com.atguigu.project.RemoteSever;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@RequestMapping("/auth")
@Controller
public class AuthController {

	@Autowired
	UserService userService;

	@Autowired
	CertService certService;

	/**
	 * 确认验证码
	 * 
	 * @param code
	 * @return
	 */
	@RequestMapping("/codeconfirm/{code}")
	public String codeConfirm(@PathVariable("code") String code,
			HttpSession session) {

		TUsers loginUser = (TUsers) session.getAttribute("loginUser");
		if (loginUser.getCertification() != 1) {
			return "users/personnelcenter";
		}

		Integer userId = loginUser.getUserId();
		String url = RemoteSever.getRemoteSever() + "/codeconfirm";
		Map<String, Object> params = new HashMap<>();
		params.put("code", code);
		params.put("userId", userId);
		String res;
		try {
			res = HttpClientUtil.httpGetRequest(url, params);

			try {
				ScwReturn<Object> value = new ObjectMapper().readValue(
						res.getBytes(), new TypeReference<ScwReturn<Object>>() {
						});
				if (value.getCode() == 1) {
					return "auth/finish";
				} else {
					return "auth/codeconfirm";
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
				return "auth/codeconfirm";
			}

		} catch (URISyntaxException e) {
			e.printStackTrace();
			return "auth/codeconfirm";
		}
	}

	/**
	 * 输入注册时的保密邮箱进行验证,并发送验证邮件
	 * 
	 * @param email
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/confirmemail")
	public String sendEmail(@RequestParam("email") String email, Model model,
			HttpSession session) {

		TUsers loginUser = (TUsers) session.getAttribute("loginUser");
		if (loginUser.getCertification() != 1) {
			return "users/personnelcenter";
		}
		
		if (!email.equals(loginUser.getEmail())) {
			model.addAttribute("sendmsg", "保密邮箱输入有误,请重新输入!");
			return "auth/emailconfim";
		} else {

			String url = RemoteSever.getRemoteSever() + "/sendEmail";
			Map<String, Object> params = new HashMap<>();
			String res = null;
			ScwReturn<Object> value = null;
			params.put("email", email);
			params.put("userId", loginUser.getUserId());
			params.put("userName", loginUser.getUserName());
			try {
				res = HttpClientUtil.httpPostRequest(url, params);
				try {
					value = new ObjectMapper().readValue(res.getBytes(),
							new TypeReference<ScwReturn<Object>>() {
							});

					if (value.getCode() == 1) {
						model.addAttribute("sendmsg",
								"我们已经向您的邮箱发送了验证邮件,请注意查收!点击下一步继续");
						return "auth/codeconfirm";
					} else {
						model.addAttribute("sendmsg", "保密邮箱输入有误,请重新输入!");
						return "auth/emailconfim";
					}
				} catch (Exception e) {
					model.addAttribute("sendmsg", "保密邮箱输入有误,请重新输入!");
					return "auth/emailconfim";
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				model.addAttribute("sendmsg", "发生验证错误,请重新输入!");
				return "auth/emailconfim";
			}
		}
	}

	/**
	 * 资质上传成功后再次发送ajax添加输入保密邮箱页面
	 * 
	 * @return
	 */
	@RequestMapping("/emailpage.html")
	public String toEmailPage(HttpSession session) {
		
		TUsers loginUser = (TUsers) session.getAttribute("loginUser");
		if (loginUser.getCertification() != 1) {
			return "users/personnelcenter";
		}
		
		return "auth/emailconfim";
	}

	/**
	 * 保存用户基本信息
	 * 
	 * @param user
	 * @param birth_day
	 * @param birth_month
	 * @param birth_year
	 * @param session
	 * @return
	 */
	@RequestMapping("/saveinfo")
	public String saveBasicInfo(TUsers user, Integer birth_day,
			Integer birth_month, Integer birth_year, Model model,
			HttpSession session) {

		TUsers loginUser = (TUsers) session.getAttribute("loginUser");
		if (loginUser.getCertification() != 1) {
			return "users/personnelcenter";
		}
		
//		SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd HH-mm-ss");
		@SuppressWarnings("deprecation")
		Date date = new Date(birth_year, birth_month, birth_day);
		user.setBirth(date);
		user.setUserId(loginUser.getUserId());

		System.out.println(user.getBirth() + "-" + user.getGender()
				+ user.getPhone() + user.getUserType() + user.getRealName()
				+ user.getIdCard());

		Map<String, Object> params = new HashMap<String, Object>();
		String url = RemoteSever.getRemoteSever() + "/savebaseinfo";
		params.put("userType", user.getUserType());
		params.put("birth", user.getBirth());
		params.put("gender", user.getGender());
		params.put("phone", user.getPhone());
		params.put("realName", user.getRealName());
		params.put("idCard", user.getIdCard());
		params.put("userId", user.getUserId());
		String res = null;
		ScwReturn<List<TCert>> value = null;
		try {
			res = HttpClientUtil.httpPostRequest(url, params);
			try {
				value = new ObjectMapper().readValue(res.getBytes(),
						new TypeReference<ScwReturn<List<TCert>>>() {
						});
				if (value.getCode() == 1) {
					session.setAttribute("certs", value.getContent());
					return "auth/certinfo";
				} else {
					return "redirect:/auth/editinfo.html";
				}
			} catch (Exception e) {
				e.printStackTrace();
				return "redirect:/auth/editinfo.html";
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return "redirect:/auth/editinfo.html";
		}

	}

	/**
	 * 从个人中心跳转实名信息页面
	 * 
	 * @return
	 */
	@RequestMapping("/editinfo.html")
	public String basicInfo(HttpSession session) {

		TUsers loginUser = (TUsers) session.getAttribute("loginUser");
		if (loginUser.getCertification() != 1) {
			return "users/personnelcenter";
		}
		
		return "auth/editinfo";
	}

}
