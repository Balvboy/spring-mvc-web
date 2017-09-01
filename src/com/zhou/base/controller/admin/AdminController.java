package com.zhou.base.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zhou.base.annotation.Interceptor;
import com.zhou.base.annotation.ValidateType;
import com.zhou.base.entity.ShowEntity;
import com.zhou.base.service.ShowService;
import com.zhou.base.util.ShowType;

@Controller
@RequestMapping(value = "admin")
public class AdminController {

	@Autowired
	private ShowService showService;

	@Interceptor(validateType = ValidateType.SESSION, sessionKey = "sessionKey")
	@RequestMapping
	public String home() {
		return "admin/home";
	}

	@RequestMapping(value = "save")
	public String save(ShowEntity entity) {
		showService.save(entity);
		return "redirect:/admin";
	}

	@RequestMapping(value = "list")
	public String list(int type, ModelMap modelMap) {
		ShowType showType = ShowType.valueOf(type);
		List<ShowEntity> list = showService.listByType(type);
		modelMap.put("list", list);
		modelMap.put("type", type);
		modelMap.put("typeName", showType.nameValue());
		return "admin/showList";
	}

	@RequestMapping(value = "showDel")
	public String showDel(int id, int type) {
		showService.deleteShowById(id);
		return "redirect:/admin/list?type=" + type;
	}

	@RequestMapping(value = "showUpdate")
	public String showUpdate(int id, ModelMap modelMap) {
		ShowEntity entity = showService.getShowById(id);
		modelMap.put("show", entity);
		return "admin/showUpdate";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(ShowEntity entity) {
		showService.save(entity);
		return "redirect:/admin";
	}

}
