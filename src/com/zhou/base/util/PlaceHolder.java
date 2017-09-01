package com.zhou.base.util;

import org.apache.commons.lang.StringUtils;

public class PlaceHolder {

	private String text ;
	
	public PlaceHolder(String originText){
		this.text = originText;
	}
	
	public String place(String... holders ){
		if(StringUtils.isEmpty(text)){
			return "";
		}
		return text;
	}
	
	public static void main(String[] args) {
		
		System.out.println(String.format("abc{}abc", "ssss"));
		
	}
	
}
