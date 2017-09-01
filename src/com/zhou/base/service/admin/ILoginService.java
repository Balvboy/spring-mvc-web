package com.zhou.base.service.admin;

import javax.servlet.http.HttpServletRequest;

import com.zhou.base.entity.User;

public interface ILoginService {

	public User login(String name,String password);
	
	public void putUser(HttpServletRequest request,User u);


}
