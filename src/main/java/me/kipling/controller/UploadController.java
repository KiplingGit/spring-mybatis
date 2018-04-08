package me.kipling.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSONObject;

import me.kipling.common.Constants;
import me.kipling.common.util.PropertyUtil;

/**
 * 文件上传处理类
 * 
 * @author Kipling
 *
 */
@Controller
@Scope("prototype")
@RequestMapping("/uploadFile")
public class UploadController {
	
	private static final Log log = LogFactory.getLog(UploadController.class);

	@RequestMapping("/upload")
	public String upload(@RequestParam MultipartFile[] myfiles, HttpServletRequest request) throws IOException {
		// 如果只是上传一个文件，则只需要MultipartFile类型接收文件即可，而且无需显式指定@RequestParam注解
		// 如果想上传多个文件，那么这里就要用MultipartFile[]类型来接收文件，并且还要指定@RequestParam注解
		// 并且上传多个文件时，前台表单中的所有<input
		// type="file"/>的name都应该是myfiles，否则参数里的myfiles无法获取到所有上传的文件
		for (MultipartFile myfile : myfiles) {
			if (myfile.isEmpty()) {
				System.out.println("文件未上传");
			} else {
				/*System.out.println("文件长度: " + myfile.getSize());
				System.out.println("文件类型: " + myfile.getContentType());
				System.out.println("文件名称: " + myfile.getName());
				System.out.println("文件原名: " + myfile.getOriginalFilename());
				System.out.println("========================================");*/
				// 如果用的是Tomcat服务器，则文件会上传到{服务发布位置}\\WEB-INF\\upload\\文件夹中
				String realPath = request.getSession().getServletContext().getRealPath("/WEB-INF/upload");
				// 这里不必处理IO流关闭的问题，因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉，我是看它的源码才知道的
				FileUtils.copyInputStreamToFile(myfile.getInputStream(),
						new File(realPath, myfile.getOriginalFilename()));
			}
		}
		return "test/uploadSuccess";
	}

	@RequestMapping("/upload1")
	@ResponseBody
	public String upload1(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 如果只是上传一个文件，则只需要MultipartFile类型接收文件即可，而且无需显式指定@RequestParam注解
		// 如果想上传多个文件，那么这里就要用MultipartFile[]类型来接收文件，并且还要指定@RequestParam注解
		// 并且上传多个文件时，前台表单中的所有<input
		// type="file"/>的name都应该是myfiles，否则参数里的myfiles无法获取到所有上传的文件
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Iterator<String> item = multipartRequest.getFileNames();
		while (item.hasNext()) {
			String fileName = (String) item.next();
			MultipartFile file = multipartRequest.getFile(fileName);
			System.out.println(file.getOriginalFilename());

		}
		System.out.println(request.getParameter("content"));
		return "1";
	}

	/*@RequestMapping("/upload2")
	@ResponseBody
	public String upload2(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 如果只是上传一个文件，则只需要MultipartFile类型接收文件即可，而且无需显式指定@RequestParam注解
		// 如果想上传多个文件，那么这里就要用MultipartFile[]类型来接收文件，并且还要指定@RequestParam注解
		// 并且上传多个文件时，前台表单中的所有<input>
		// type="file"/>的name都应该是myfiles，否则参数里的myfiles无法获取到所有上传的文件
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Iterator<String> item = multipartRequest.getFileNames();
		String imgPath = "";
		String saveUrl = request.getContextPath() + "/attached/";
		System.out.println(saveUrl);
		System.out.println("---------request.getServletPath()---------" + request.getServletPath());
		System.out.println("---------request.request.getRequestURL()---------" + request.getRequestURL());
		System.out.println("---------request.request.getRequestURI()---------" + request.getRequestURI());
		System.out.println("---------根目录所对应的绝对路径---------" + request.getServletPath());
		System.out.println("---------文件的绝对路径 ---------"
				+ request.getSession().getServletContext().getRealPath(request.getRequestURI()));
		System.out.println(
				"---------当前web应用的绝对路径  ---------" + request.getSession().getServletContext().getRealPath("/"));
		while (item.hasNext()) {
			String fileName = (String) item.next();
			MultipartFile file = multipartRequest.getFile(fileName);
			// 上传图片
			imgPath = FileUtil.createFile((CommonsMultipartFile) file, saveUrl);
			System.out.println(imgPath);
		}
		System.out.println(request.getParameter("content"));
		PrintWriter out = response.getWriter();
		// 发送给 kindeditor
		JSONObject obj = new JSONObject();
		obj.put("error", 0);
		obj.put("url", saveUrl + "/" + imgPath);
		out.println(obj.toJSONString());
		return null;
	}*/
	
/*	@SuppressWarnings("restriction")
	@RequestMapping("/upload2")
	@ResponseBody
	public String upload2(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 如果只是上传一个文件，则只需要MultipartFile类型接收文件即可，而且无需显式指定@RequestParam注解
		// 如果想上传多个文件，那么这里就要用MultipartFile[]类型来接收文件，并且还要指定@RequestParam注解
		// 并且上传多个文件时，前台表单中的所有<input>
		// type="file"/>的name都应该是myfiles，否则参数里的myfiles无法获取到所有上传的文件
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Iterator<String> item = multipartRequest.getFileNames();
		String imgPath = "";
			
		String base64Str = "";
		String suffix = "";
		sun.misc.BASE64Encoder enc = new sun.misc.BASE64Encoder();
		while (item.hasNext()) {
			String fileName = (String) item.next();
			MultipartFile file = multipartRequest.getFile(fileName);
			byte[] bytes = file.getBytes();
			if(bytes.length>0){
				base64Str = enc.encode(bytes);
				suffix = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
				base64Str = "data:image/"+suffix+";base64," + base64Str;
			}
			// 上传图片
			imgPath = FileUtil.createFile((CommonsMultipartFile)file);
			System.out.println(imgPath);
		}
		System.out.println(request.getParameter("content"));
		String saveUrl = request.getContextPath() + "/attached/";
		System.out.println(saveUrl);
		PrintWriter out = response.getWriter(); 
		// 发送给 kindeditor
		JSONObject obj = new JSONObject();
		obj.put("error", 0);
		//obj.put("url", saveUrl + "/" + imgPath);			
		obj.put("url", base64Str);
		out.println(obj.toJSONString());
		return null;
	}*/
	
	@RequestMapping("/upload2")
	public void upload2(HttpServletRequest request, HttpServletResponse response) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Iterator<String> item = multipartRequest.getFileNames();
		String imgKey = Constants.NONE_STR;
		try {
			while (item.hasNext()) {
				String fileName = (String) item.next();
				MultipartFile file = multipartRequest.getFile(fileName);
				//imgKey = QiNiuUtil.uploadFile(file.getInputStream(),0);
			}
			PrintWriter out = response.getWriter();
			JSONObject obj = new JSONObject();
			obj.put("error", 0);
			obj.put("url", PropertyUtil.getProperty("qinniu_img_src") + imgKey);
			out.println(obj.toJSONString());
		} catch (Exception e) {
			log.error("UploadController method upload2 occured error", e);
		}
	}
}