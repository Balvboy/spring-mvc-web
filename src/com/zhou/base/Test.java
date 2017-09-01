package com.zhou.base;

import java.io.File;
import java.io.IOException;

import net.coobird.thumbnailator.Thumbnails;

public class Test {
	public static void main(String[] args) {
		
//		System.out.println(File.separator);
//		System.out.println(File.pathSeparator);
		
		try {
			Thumbnails.of("D:\\zhouyang\\bg\\vadim-sherbakov-277610.jpg").scale(1f).outputQuality(0.25f).toFile("D:\\zhouyang\\bg\\result2.jpg");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
