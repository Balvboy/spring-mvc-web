package com.zhou.base.util;

import java.io.Serializable;


public class RespData implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String respCode="1";
	private String respDesc="操作成功！";
	private Object data; 
	
	public String getRespCode() {
		return respCode;
	}
	public void setRespCode(String respCode) {
		this.respCode = respCode;
	}
	
	public String getRespDesc() {
		return respDesc;
	}
	public void setRespDesc(String respDesc) {
		this.respDesc = respDesc;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	
	public static RespData create(RespCode code,Object data){
		RespData respData = new RespData();
		respData.setRespCode(code.getCode());
		respData.setRespDesc(code.getDesc());
		respData.setData(data);
		return respData;
	}

}
