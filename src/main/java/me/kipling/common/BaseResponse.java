package me.kipling.common;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.http.HttpStatus;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.SerializeConfig;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.serializer.SimpleDateFormatSerializer;

/**
 * 基础响应类
 * 
 * @author Kipling
 * 
 * @version 1.0
 *
 */
public class BaseResponse implements Serializable {

	private static final long serialVersionUID = -6943333396113496600L;

	private static SerializeConfig mapping = new SerializeConfig();

	private static final String DEFAULT_DATEFORMAT = "yyyy-MM-dd HH:mm:ss";

	static {
		mapping.put(Date.class, new SimpleDateFormatSerializer(DEFAULT_DATEFORMAT));
	}

	/**
	 * 正确响应信息
	 */
	private Object result;

	/**
	 * 状态代码，200：成功， 500：服务端错误
	 */
	private Integer code;

	/**
	 * 错误信息
	 */
	private String msg;

	public Object getResult() {
		return result;
	}

	public void setResult(Object result) {
		this.result = result;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	/**
	 * 获取响应实体列表
	 * 
	 * @param clazz
	 *            类的字节码
	 * @return 响应实体列表
	 */
	public <T> List<T> getEntitys(Class<T> clazz) {
		List<T> responseList = new ArrayList<T>();
		if (code == HttpStatus.OK.value() && !String.valueOf(result).equals("[]")) {
			responseList = JSON.parseArray(JSON.toJSONString(result), clazz);
		}
		return responseList;
	}

	/**
	 * 获取响应实体
	 * 
	 * @param clazz
	 *            类的字节码
	 * @return 响应实体
	 */
	public <T> T getEntity(Class<T> clazz) {
		if (code == HttpStatus.OK.value() && result != null) {
			return JSON.parseObject(JSON.toJSONString(result), clazz);
		}
		return null;
	}

	/**
	 * 返回对象的序列化串或错误信息
	 */
	@Override
	public String toString() {
		if (HttpStatus.OK.value() == code) {
			return JSON.toJSONString(this, SerializerFeature.WriteMapNullValue);
		} else {
			return code + ":" + msg;
		}
	}

	/**
	 * 判断该响应是否成功
	 * 
	 * @return 结果
	 */
	@JSONField(serialize = false)
	public boolean isSuccess() {
		return HttpStatus.OK.value() == code;
	}
}