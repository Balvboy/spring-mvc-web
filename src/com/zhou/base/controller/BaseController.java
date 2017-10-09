package com.zhou.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/")
public class BaseController {
	
	@RequestMapping
	public String home() {
		System.out.println("/");
		return "index";
	}
	
	
	@RequestMapping(value = "index")
	public String index() {
		System.out.println("index");
		return "index";
	}
	
}
