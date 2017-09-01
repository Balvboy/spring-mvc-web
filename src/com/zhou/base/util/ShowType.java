package com.zhou.base.util;

public enum ShowType {

	HUGEIMG(1, "头条内容"), PRODUCT(2, "产品介绍"), HOTNEWS(3, "热点新闻") ,ACTION(4,"公司动态"); 

	private int type;

	private String name;

	private ShowType(int type, String name) {
		this.type = type;
		this.name = name;
	}

	public int typeValue() {
		return this.type;
	}

	public String nameValue() {
		return this.name;
	}

	public static ShowType valueOf(int type) {
		switch (type) {
		case 1: {
			return ShowType.HUGEIMG;
		}
		case 2: {
			return ShowType.PRODUCT;
		}
		case 3: {
			return ShowType.HOTNEWS;
		}
		case 4: {
			return ShowType.ACTION;
		}
		default:
			return HUGEIMG;
		}
	}
}
