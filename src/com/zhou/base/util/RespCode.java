package com.zhou.base.util;

public enum RespCode {

	OK("1","ok"),ERROR("-1","error");
	
	private String code;
	
	private String desc;
	
	private RespCode(String code,String desc ){
		this.code = code;
		this.desc = desc;
	}
	
	public String getCode(){
		return this.code;
	}
	
	public String getDesc(){
		return this.desc;
	}
}
