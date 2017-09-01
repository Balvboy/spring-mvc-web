package com.zhou.base.dao;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.zhou.base.entity.User;

@Repository
public class BaseDao<T> {

	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Transactional
	public void add(T t) {
		hibernateTemplate.save(t);
	}

	@Transactional
	public T get(int id,Class clazz) {
		return (T) getSession().get(clazz, id);
	}

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Transactional
	public void delete(int id,Class clazz) {
		Session session = getSession();
		T t = get(id,clazz);
		session.delete(t);
	}
}
