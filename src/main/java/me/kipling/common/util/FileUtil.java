package me.kipling.common.util;

import java.io.ByteArrayInputStream;
import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import me.kipling.common.Constants;

/**
 * 文件操作工具类
 * 
 * @author daizl
 * 
 */
public class FileUtil {
	private static final Log logger = LogFactory.getLog(FileUtil.class);

	/**
	 * 获取文件的扩展名
	 * 
	 * @param fileName
	 * @return
	 */
	public static String getFileSuffix(String fileName) {
		if (fileName.contains(".")) {
			return fileName.substring(fileName.lastIndexOf("."));
		}
		return Constants.NONE_STR;
	}

	/**
	 * 创建文件到默认文件夹下
	 * 
	 * @param file
	 * @return
	 */
	public static String createFile(CommonsMultipartFile file) {
		return createFile(file, Constants.NONE_STR);
	}
	
	
	/**
	 * 保存文件到默认文件夹下
	 * 
	 * @param file
	 * @return
	 */
	public static String saveFile(HttpServletRequest request,String fileName) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		CommonsMultipartFile fileImg = (CommonsMultipartFile) multipartRequest.getFile(fileName);
		return FileUtil.createFile(fileImg);
	}

	/**
	 * 将文件保存到指定文件夹下
	 * 
	 * @param file
	 * @param path
	 * @return
	 */
	public static String createFile(CommonsMultipartFile file, String path) {
		if (file != null&&file.getSize()>0) {
			String originalFilename = file.getOriginalFilename();
			// 文件扩展名
			String suffix = getFileSuffix(originalFilename);
			String fileName = StringTools.getBillno() + suffix;
			// 文件保存统一文件夹
			String realPath = "d:\\images";
			// 判断文件夹是否存在
			//File pathFile = new File(realPath + File.separator + path);
			File pathFile = new File(path);
			if (!pathFile.exists()) {
				pathFile.mkdirs();
			}
			try {
				FileUtils.copyInputStreamToFile(
						new ByteArrayInputStream(file.getBytes()), new File(
								pathFile.getAbsolutePath(), fileName));
				return fileName;
			} catch (Exception e) {
				logger.error("文件[" + file.getName() + "]上传失败,堆栈轨迹如下", e);
			}
		}
		return Constants.NONE_STR;
	}

	/**
	 * 根据路径删除指定的目录或文件，无论存在与否
	 * 
	 * @param sPath
	 *            要删除的目录或文件
	 * @return 删除成功返回 true，否则返回 false。
	 */
	public static boolean deleteFolder(String sPath) {
		boolean flag = false;
		File file = new File(sPath);
		// 判断目录或文件是否存在
		if (!file.exists()) { // 不存在返回 false
			return flag;
		} else {
			// 判断是否为文件
			if (file.isFile()) { // 为文件时调用删除文件方法
				return deleteFile(sPath);
			} else { // 为目录时调用删除目录方法
				return deleteDirectory(sPath);
			}
		}
	}

	/**
	 * 删除单个文件
	 * 
	 * @param sPath
	 *            被删除文件的文件名
	 * @return 单个文件删除成功返回true，否则返回false
	 */
	public static boolean deleteFile(String sPath) {
		boolean flag = false;
		File file = new File(sPath);
		// 路径为文件且不为空则进行删除
		if (file.isFile() && file.exists()) {
			file.delete();
			flag = true;
		}
		return flag;
	}

	/**
	 * 删除目录（文件夹）以及目录下的文件
	 * 
	 * @param sPath
	 *            被删除目录的文件路径
	 * @return 目录删除成功返回true，否则返回false
	 */
	public static boolean deleteDirectory(String sPath) {
		// 如果sPath不以文件分隔符结尾，自动添加文件分隔符
		if (!sPath.endsWith(File.separator)) {
			sPath = sPath + File.separator;
		}
		File dirFile = new File(sPath);
		// 如果dir对应的文件不存在，或者不是一个目录，则退出
		if (!dirFile.exists() || !dirFile.isDirectory()) {
			return false;
		}
		boolean flag = true;
		// 删除文件夹下的所有文件(包括子目录)
		File[] files = dirFile.listFiles();
		for (int i = 0; i < files.length; i++) {
			// 删除子文件
			if (files[i].isFile()) {
				flag = deleteFile(files[i].getAbsolutePath());
				if (!flag)
					break;
			} // 删除子目录
			else {
				flag = deleteDirectory(files[i].getAbsolutePath());
				if (!flag)
					break;
			}
		}
		if (!flag)
			return false;
		// 删除当前目录
		if (dirFile.delete()) {
			return true;
		} else {
			return false;
		}
	}
}
