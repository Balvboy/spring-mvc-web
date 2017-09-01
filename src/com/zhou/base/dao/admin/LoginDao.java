package com.zhou.base.dao.admin;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.zhou.base.dao.HibernateDao;
import com.zhou.base.entity.User;

@Repository("loginDao")
public class LoginDao extends HibernateDao<User, Serializable> implements ILoginDao{

	

	@Override
	public User login(String name, String password) {
		List<User> list = this.findByHql("select u from User u where u.name = ? and u.password = ?", name, password);
		if(list!=null&&list.size()==1){
			return (User)list.get(0);
		}
		return null;
	}
}
