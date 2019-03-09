package com.atyou.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.atyou.util.JsonUtils;
import com.atyou.util.UploadUtil;



/**
 * 图片上传
 * @author Administrator
 *
 */
@Controller
public class PictureController {
	
	/*@Value("${IMAGE_SERVER_URL}")
	private String IMAGE_SERVER_URL;*/
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping("/pic/upload")
	@ResponseBody
	public String picUpload(MultipartFile uploadFile) throws Exception{
		try {
		
		//接受上传的文件
		
		//取扩展名
		String originalFilename = uploadFile.getOriginalFilename();
		String extName = originalFilename.substring(originalFilename.lastIndexOf(".")+1);
		//上传到图片服务器
		/*FastDFSClient fastDFSClient = new FastDFSClient("classpath:resource/client.conf");
		String url = fastDFSClient.uploadFile(uploadFile.getBytes(),extName);*/
		
		
		//先得到basepath文件的绝对路径
		String basePath = servletContext.getRealPath("/upload");//会上传到webapp下的upload文件夹
		String filename = UploadUtil.upload(uploadFile, basePath);
		System.out.println("/upload/"+filename);
		
				
				
		String url = "/upload/"+filename;
		//响应上传图片的URL
		Map result = new HashMap<>();
		result.put("error", 0);
		result.put("url", url);
		return JsonUtils.objectToJson(result);
		
		} catch (Exception e) {
			e.printStackTrace();
			Map result = new HashMap<>();
			result.put("error", 1);
			result.put("message", "图片上传失败");
			return JsonUtils.objectToJson(result);
		}
	}
}
