package com.zhou.base.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhou.base.dao.Page;
import com.zhou.base.entity.ShowEntity;
import com.zhou.base.service.ShowService;
import com.zhou.base.util.RespCode;
import com.zhou.base.util.RespData;

@Controller
@RequestMapping(value="show")
public class ShowController {

	@Autowired
	private ShowService showService;
	
	@RequestMapping(value = "showsByType")
	@ResponseBody
	public Object showsByType(int type,Page<ShowEntity> page) throws ClassNotFoundException{
		showService.pageByType(type, page);
		return RespData.create(RespCode.OK,page);
	}
	
	@RequestMapping(value = "showContent")
	@ResponseBody
	public Object getShowContent(int id){
		String content  = showService.getShowContent(id);
		return RespData.create(RespCode.OK,content);
	}
	
	@RequestMapping(value = "showContentView")
	public String showContent(int id,ModelMap modelMap){
		ShowEntity entity = showService.getShowById(id);
		modelMap.put("entity", entity);
		return "show";
	}
	
	
	
}
