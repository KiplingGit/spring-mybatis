package me.kipling.common.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadBase.InvalidContentTypeException;
import org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.log4j.Logger;


/**
 * UEditor文件上传辅助类
 * 
 */
public class Uploader {

	private static final Logger logger = Logger.getLogger("microLog");
	// 输出文件地址
	private String url = "";
	// 上传文件名
	private String fileName = "";
	// 状态
	private String state = "";
	// 文件类型
	private String type = "";
	// 原始文件名
	private String originalName = "";
	// 文件大小
	private int size = 0;

	private HttpServletRequest request = null;
	private String title = "";

	// 保存路径
	private String savePath = "upload";
	// 文件允许格式
	private String[] allowFiles = { ".flv", ".rar", ".doc", ".docx", ".zip",
			".pdf", ".txt", ".swf", ".wmv", ".gif", ".png", ".jpg", ".jpeg",
			".bmp" };
	private String[] livingImageFiles = { "30", "31", "32", "33" };
	private String[] vediosAndAdvertiseFiles = { "vedios", "advertise" };

	// 文件大小限制，单位KB
	private int maxSize = 10000;

	private HashMap<String, String> errorInfo = new HashMap<String, String>();

	public Uploader(HttpServletRequest request) {
		this.request = request;
		HashMap<String, String> tmp = this.errorInfo;
		tmp.put("SUCCESS", "SUCCESS"); // 默认成功
		tmp.put("NOFILE", "未包含文件上传域");
		tmp.put("TYPE", "不允许的文件格式");
		tmp.put("SIZE", "文件大小超出限制");
		tmp.put("ENTYPE", "请求类型ENTYPE错误");
		tmp.put("REQUEST", "上传请求异常");
		tmp.put("IO", "IO异常");
		tmp.put("DIR", "目录创建失败");
		tmp.put("UNKNOWN", "未知错误");

	}

	public void uploadImageNoSave() throws Exception {
		boolean isMultipart = ServletFileUpload
				.isMultipartContent(this.request);
		if (!isMultipart) {
			this.state = this.errorInfo.get("NOFILE");
			return;
		}

		DiskFileItemFactory dff = new DiskFileItemFactory();
		dff.setRepository(new File(savePath));

		try {
			ServletFileUpload sfu = new ServletFileUpload(dff);
			sfu.setSizeMax(this.maxSize * 1024);
			sfu.setHeaderEncoding("utf-8");
			FileItemIterator fii = sfu.getItemIterator(this.request);
			while (fii.hasNext()) {
				FileItemStream fis = fii.next();
				if (!fis.isFormField()) {
					this.originalName = fis.getName().substring(
							fis.getName().lastIndexOf(
									System.getProperty("file.separator")) + 1);
					if (!this.checkFileType(this.allowFiles, this.originalName)) {
						this.state = this.errorInfo.get("TYPE");
						continue;
					}

					this.type = this.getFileExt(this.originalName);
					this.url = savePath + "/" + this.originalName;
					BufferedInputStream in = new BufferedInputStream(
							fis.openStream());
					String uploadPath = "";

					logger.info("上传图片的路径：" + uploadPath);
					FileOutputStream out = new FileOutputStream(new File(
							uploadPath + File.separator + originalName));
					BufferedOutputStream output = new BufferedOutputStream(out);
					Streams.copy(in, output, true);
					this.state = this.errorInfo.get("SUCCESS");

					// UE中只会处理单张上传，完成后即退出
					break;
				} else {
					String fname = fis.getFieldName();
					// 只处理title，其余表单请自行处理
					if (!fname.equals("pictitle")) {
						continue;
					}
					BufferedInputStream in = new BufferedInputStream(
							fis.openStream());
					BufferedReader reader = new BufferedReader(
							new InputStreamReader(in));
					StringBuffer result = new StringBuffer();
					while (reader.ready()) {
						result.append((char) reader.read());
					}
					this.title = new String(result.toString().getBytes(),
							"utf-8");
					reader.close();

				}
			}
		} catch (SizeLimitExceededException e) {
			this.state = this.errorInfo.get("SIZE");
			logger.error(e.getMessage());
		} catch (InvalidContentTypeException e) {
			this.state = this.errorInfo.get("ENTYPE");
			logger.error(e.getMessage());
		} catch (FileUploadException e) {
			this.state = this.errorInfo.get("REQUEST");
			logger.error(e.getMessage());
		} catch (Exception e) {
			this.state = this.errorInfo.get("UNKNOWN");
			logger.error(e.getMessage());
		}
	}

	public void upload() throws Exception {
		boolean isMultipart = ServletFileUpload
				.isMultipartContent(this.request);
		if (!isMultipart) {
			this.state = this.errorInfo.get("NOFILE");
			return;
		}

		DiskFileItemFactory dff = new DiskFileItemFactory();
		dff.setRepository(new File(savePath));

		try {
			ServletFileUpload sfu = new ServletFileUpload(dff);
			sfu.setSizeMax(this.maxSize * 1024);
			sfu.setHeaderEncoding("utf-8");
			FileItemIterator fii = sfu.getItemIterator(this.request);
			while (fii.hasNext()) {
				FileItemStream fis = fii.next();
				if (!fis.isFormField()) {
					this.originalName = fis.getName().substring(
							fis.getName().lastIndexOf(
									System.getProperty("file.separator")) + 1);
					if (!this.checkFileType(this.allowFiles, this.originalName)) {
						this.state = this.errorInfo.get("TYPE");
						continue;
					}

					this.type = getFileExt(this.originalName);
					// 生成新文件名
					this.fileName = getName(this.originalName);
					this.url = savePath + "/" + this.fileName;
					BufferedInputStream in = new BufferedInputStream(
							fis.openStream());
					String uploadPath = "";

					logger.info("上传图片的路径：" + uploadPath);
					FileOutputStream out = new FileOutputStream(new File(
							uploadPath + File.separator + fileName));
					BufferedOutputStream output = new BufferedOutputStream(out);
					Streams.copy(in, output, true);
					this.state = this.errorInfo.get("SUCCESS");

					// UE中只会处理单张上传，完成后即退出
					break;
				} else {
					String fname = fis.getFieldName();
					// 只处理title，其余表单请自行处理
					if (!fname.equals("pictitle")) {
						continue;
					}
					BufferedInputStream in = new BufferedInputStream(
							fis.openStream());
					BufferedReader reader = new BufferedReader(
							new InputStreamReader(in));
					StringBuffer result = new StringBuffer();
					while (reader.ready()) {
						result.append((char) reader.read());
					}
					this.title = new String(result.toString().getBytes(),
							"utf-8");
					reader.close();

				}
			}
		} catch (SizeLimitExceededException e) {
			this.state = this.errorInfo.get("SIZE");
			logger.error(e.getMessage());
		} catch (InvalidContentTypeException e) {
			this.state = this.errorInfo.get("ENTYPE");
			logger.error(e.getMessage());
		} catch (FileUploadException e) {
			this.state = this.errorInfo.get("REQUEST");
			logger.error(e.getMessage());
		} catch (Exception e) {
			this.state = this.errorInfo.get("UNKNOWN");
			logger.error(e.getMessage());
		}
		// savePicFileAttr(originalName, size, title, originalName, state, "");
	}

	/**
	 * 保存图片文件属性
	 * 
	 * @param fileName
	 * @param fileSize
	 * @param fileDesc
	 * @param filePath
	 * @param state
	 * @param fileContent
	 */
	public void savePicFileAttr(String fileName, int fileSize, String fileDesc,
			String filePath, String state, String fileContent) {
/*		HttpSession session = request.getSession(true);
		Integer attrId = (Integer) session.getAttribute("attrId");
		Integer graphicsId = (Integer) session.getAttribute("graphicsId");
		Integer owerId = (Integer) session.getAttribute("owerId");
		String owerType = (String) session.getAttribute("owerType");

		ServiceLocator serviceLocator = ServiceLocator.getInstance();
		Connection conn = null;
		PreparedStatement sta = null;
		ResultSet rs = null;
		try {
			conn = serviceLocator.getDBConn();
			sta = conn
					.prepareStatement("insert into tb_micro_file_attr (attrId,graphicsId,fileName,owerId,owerType,fileSize,fileDesc,filePath,createTime,state,fileContent) values (?,?,?,?,?,?,?,?,now(),?,?)");
			sta.setInt(1, attrId);
			sta.setInt(2, graphicsId);
			sta.setString(3, fileName);
			sta.setInt(4, owerId);
			sta.setString(5, owerType);
			sta.setInt(6, fileSize);
			sta.setString(7, fileDesc);
			sta.setString(8, filePath);
			sta.setString(9, state);
			sta.setString(10, fileContent);

			sta.executeUpdate();
		} catch (SQLException ex) {
			ex.printStackTrace();
			// 写入异常日志
		} finally {
			ClearDBResource.closeResultSet(rs);
			ClearDBResource.closeStatment(sta);
			ClearDBResource.closeConnection(conn);
		}*/

	}

	private String suffixFileName(String fileDescription) {
		if (fileDescription == null)
			return "";

		if (fileDescription.indexOf(".") > 0) {
			fileDescription = fileDescription.substring(0,
					fileDescription.lastIndexOf("."));
		}
		return fileDescription;
	}

	/**
	 * 文件类型判断
	 * 
	 * @param fileName
	 * @return
	 */
	private boolean checkFileType(String[] allowFileArray, String fileName) {
		Iterator<String> type = Arrays.asList(allowFileArray).iterator();
		while (type.hasNext()) {
			String ext = type.next();
			if (fileName.toLowerCase().endsWith(ext)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 获取文件扩展名
	 * 
	 * @return string
	 */
	private String getFileExt(String fileName) {
		return fileName.substring(fileName.lastIndexOf("."));
	}

	/**
	 * 依据原始文件名生成新文件名
	 * 
	 * @return
	 */
	private String getName(String fileName) {
		Random random = new Random();
		return random.nextInt(10000) + System.currentTimeMillis()
				+ this.getFileExt(fileName);
	}

	/**
	 * 根据传入的虚拟路径获取物理路径
	 * 
	 * @param path
	 * @return
	 * @throws IOException
	 */
	private String getPhysicalPath(String roomName, String fileName,
			String uploadImageType) throws IOException {

		String uploadPath = "";
		String uploadDir = null;

		if (uploadImageType != null) {
			uploadDir = uploadPath + File.separator + roomName + File.separator
					+ uploadImageType;
		} else {
			uploadDir = uploadPath + File.separator + roomName + File.separator
					+ "electphoto";
		}

		String filePath = uploadDir + File.separator + fileName;

		File imageDir = new File(uploadDir);
		if (!imageDir.exists()) {
			imageDir.mkdirs();
		}
		return filePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public void setAllowFiles(String[] allowFiles) {
		this.allowFiles = allowFiles;
	}

	public void setMaxSize(int size) {
		this.maxSize = size;
	}

	public int getSize() {
		return size;
	}

	public String getUrl() {
		return this.url;
	}

	public String getFileName() {
		return this.fileName;
	}

	public String getState() {
		return this.state;
	}

	public String getTitle() {
		return this.title;
	}

	public String getType() {
		return this.type;
	}

	public String getOriginalName() {
		return this.originalName;
	}

	public void setSize(int size) {
		this.size = size;
	}

}
