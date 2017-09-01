package com.zhou.base.service;

import java.util.Date;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhou.base.dao.HibernateDao;
import com.zhou.base.dao.Page;
import com.zhou.base.entity.ShowEntity;

@Service
public class ShowService {

	@Autowired
	private HibernateDao<ShowEntity, Integer> showDao;

	public void save(ShowEntity entity) {
		entity.setCreateTime(new Date());
		showDao.saveOrUpdate(entity);
	}

	public List<ShowEntity> listByType(int type) {
		return showDao.findAllByCriteria(ShowEntity.class,
				DetachedCriteria.forClass(ShowEntity.class).add(Restrictions.eq("type", type)));
	}

	public void pageByType(int type, Page<ShowEntity> page) throws ClassNotFoundException {

		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(ShowEntity.class);
		detachedCriteria.add(Restrictions.eq("type", type)).addOrder(Order.desc("createTime"));
		showDao.findPageByDetachedCriteria(detachedCriteria, page, "content");
	}

	public String getShowContent(int id) {

		String sql = "select content from showEntity s where s.id = " + id;
		List list = showDao.findAllBySql(sql);
		String content = "";
		if (list != null && list.size() > 0) {
			content = (String) list.get(0);
		}
		return content;
	}
	
	public ShowEntity getShowById(int id){
		return showDao.findUniqueByDetachedCriteria(DetachedCriteria.forClass(ShowEntity.class).add(Restrictions.eq("id", id)));
	}
	
	public void deleteShowById(int id){
		showDao.delete(ShowEntity.class, id);
	}
}
