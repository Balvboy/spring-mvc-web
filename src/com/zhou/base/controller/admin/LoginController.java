package com.zhou.base.controller.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zhou.base.entity.User;
import com.zhou.base.service.admin.ILoginService;

@Controller
@RequestMapping("login")
public class LoginController {
	
	@Autowired
	private ILoginService loginService;

	/**
	 * 跳转到登录页面
	 * 
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String loginInput() {
		return "admin/login";
	}

	/**
	 * 点击登录
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(method = RequestMethod.POST)
	public String login(HttpServletRequest request,HttpServletResponse response) {
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		User u = this.loginService.login(name, password);
		if(u!=null){
			this.loginService.putUser(request, u);
				return "redirect:"+request.getContextPath()+"/admin";
		}else{
			this.loginService.putUser(request, u);
			return "admin/login";
		}
	}

}
