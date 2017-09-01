package com.zhou.base.service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhou.base.dao.admin.ILoginDao;
import com.zhou.base.entity.User;

@Service
public class LoginService implements ILoginService{
	
	@Autowired
	private ILoginDao loginDao;
	
	@Override
	public User login(String name,String password){
		
		return this.loginDao.login(name, password);
	}

	@Override
	public void putUser(HttpServletRequest request,User u) {
		HttpSession session = request.getSession();
		session.setAttribute("sessionKey", u);
	}

}
