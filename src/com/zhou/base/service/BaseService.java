package com.zhou.base.service;

import java.util.Random;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhou.base.dao.BaseDao;
import com.zhou.base.entity.User;

@Service
public class BaseService {

	@Autowired
	private BaseDao<User> baseDao;
	
	@Transactional
	public void register(User user){
		baseDao.add(user);
	}
	
	public User findUserById(int id){
		return baseDao.get(id,User.class);
	}
	
	@Transactional
	public void delete(int id){
		baseDao.delete(id,User.class);
	}
}
