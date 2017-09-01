package com.zhou.base.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.zhou.base.dao.HibernateDao;
import com.zhou.base.entity.SystemInfo;

//@Service
public class SystemInfoService {

	private static final Logger LOGGER = Logger.getLogger(SystemInfoService.class);
	
	private Map<String,String> map = new HashMap<>();
	
//	@Autowired
//	private HibernateDao<SystemInfo, Integer> systemInfoDao;
//
//	@Scheduled(fixedDelay= 1000 * 60 * 60 * 2)
//	public void init() {
//		List<SystemInfo> list = systemInfoDao.findAllByCriteria(SystemInfo.class, DetachedCriteria.forClass(SystemInfo.class));
//		for(SystemInfo info : list){
//			map.put(info.getPropName(), info.getPropValue());
//		}
//	}
//	
//	public String getPropValue(String propName){
//		return map.get(propName);
//	}

}
