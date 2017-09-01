package com.zhou.base.annotation;

public enum ValidateType {

	/**
	 * 验证类型  session 表示需要对session中的状态进行验证，选择为session的时候需要制定sessionKey
	 */
	SESSION,
	
	/**
	 * 验证类型param，表示需要对请求中的参数进行验证,需要指定paramName，可以传多个
	 */
	PARAM,
	
	
	/**
	 * 表示限制来源IP地址，需要指定originIP，可以传多个
	 * 如果不能获取到IP地址，则认定为失败
	 */
	ORIGIN,
	
	/**
	 * 表示需要对参数进行md5验证，需要指定md5Result 和md5Order
	 */
	MD5;
}
