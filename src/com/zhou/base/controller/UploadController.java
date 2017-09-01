package com.zhou.base.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zhou.base.util.PropertiesUtils;

import net.coobird.thumbnailator.Thumbnailator;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping(value = "upload")
public class UploadController {

	private static final Logger LOGGER = Logger.getLogger(UploadController.class);

	@RequestMapping(value = "upload", method = RequestMethod.POST)
	@ResponseBody
	public String uploadFile(@RequestParam("file") CommonsMultipartFile file, HttpServletRequest request)
			throws JsonProcessingException {
		if (file.getSize() > 0) {
			String httpPath = createFileNameAndSave(request, file);
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("status", true);
			m.put("fileUrl", httpPath);
			ObjectMapper mapper = new ObjectMapper();
			String json = mapper.writeValueAsString(m);
			return json;
		}
		return "{}";
	}

	public String createFileNameAndSave(HttpServletRequest request, CommonsMultipartFile file) {

		boolean isCompress = true;
		if(file.getSize() < 1024 * 1024 * 0.5){			
			isCompress = false;
		}
		String datePath = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String originName = file.getOriginalFilename();
		String uuid = UUID.randomUUID().toString();
		String fileName = uuid + "." + originName.split("\\.")[1];
		String thumbFileName = uuid + "_thumb." + originName.split("\\.")[1];
		File folder = new File(getImgRootPath() + datePath);
		if (!folder.exists() && folder.mkdirs()) {
			LOGGER.info("create upload folder " + folder.getName() + " success ");
		}
		String targetFilePath = getImgRootPath() + datePath + File.separator + fileName;
		String targetThumbFilePath = getImgRootPath() + datePath + File.separator + thumbFileName;
		try {
			file.transferTo(new File(targetFilePath));
			if(isCompress){				
				Thumbnails.of(targetFilePath).scale(0.5f).outputQuality(0.5f).toFile(targetThumbFilePath);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return createImgHttpPath(datePath, isCompress?thumbFileName:fileName);
	}

	/**
	 * 创建图片的http连接
	 * 
	 * @param datePath
	 * @param fileName
	 * @return
	 */
	private String createImgHttpPath(String datePath, String fileName) {
		return getServerHttpPath() + "/uploadFile/" + datePath + "/" + fileName;
	}

	private String getImgRootPath() {

		String imgRootPath = null;
		String os = System.getProperty("os.name").toLowerCase();
		if (os.contains("windows")) {
			imgRootPath = PropertiesUtils.getProperties("project.properties").getProperty("uploadPath_windows");

		} else {
			imgRootPath = PropertiesUtils.getProperties("project.properties").getProperty("uploadPath_linux");
		}

		return imgRootPath;

	}

	private String getServerHttpPath() {
		String serverHttpPath = null;
		String os = System.getProperty("os.name").toLowerCase();
		if (os.contains("windows")) {
			serverHttpPath = PropertiesUtils.getPropertyValue("project.properties", "serverPath_local");

		} else {
			serverHttpPath = PropertiesUtils.getPropertyValue("project.properties", "serverPath_remote");

		}

		return serverHttpPath;
	}
}
