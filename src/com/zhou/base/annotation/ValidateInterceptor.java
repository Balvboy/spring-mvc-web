package com.zhou.base.annotation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.apache.log4j.Logger;
import org.springframework.util.StringUtils;
import org.springframework.web.method.HandlerMethod;

/**
 * 基于注解，对请求进行一些 验证
 * @author Administrator
 *
 */
public class ValidateInterceptor implements HandlerInterceptor {
	
	private static final Logger LOGGER =  Logger.getLogger(ValidateInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(((HandlerMethod)handler).getMethod().isAnnotationPresent(Interceptor.class)){
			Interceptor interceptor=(Interceptor)((HandlerMethod)handler).getMethod().getAnnotation(Interceptor.class);
			if(interceptor != null){
				switch(interceptor.validateType()){
				case SESSION:
					String sessionKey = interceptor.sessionKey();
					if(!StringUtils.isEmpty(sessionKey)){
						Object sessionValue =  request.getSession().getAttribute(sessionKey);
						if(sessionValue == null){
							LOGGER.warn(String.format("validate session failed , can not find value by sessionKey : %s ", sessionKey));
							response.sendRedirect("/login");  
							return false;
						}
						return true;
					}
					break;
				case MD5:
					break;
				case ORIGIN:
					break;
				case PARAM:
					break;
				default:
					break;
				}
			}
		}
		
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
