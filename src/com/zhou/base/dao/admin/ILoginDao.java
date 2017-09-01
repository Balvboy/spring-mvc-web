package com.zhou.base.dao.admin;

import com.zhou.base.entity.User;

public interface ILoginDao {

	public User login(String name,String password);
}
