package me.kipling.common;

import me.kipling.common.util.PropertyUtil;

public class Constants {

	public static final String NONE_STR = "";
	
	public static final String COMMA_STR = ",";
	
	public static final String SUCCESS = "SUCCESS";
    
	//七牛token
	public static String QINIU_TOKEN = "";
	
	//七牛URL
	public static final String QINIUURL = PropertyUtil.getProperty("qiniuurl");
	
	public static final String STORE_URL = PropertyUtil.getProperty("store_add_url");
	
	public static final String STORE_ATTRIBUTE_URL = PropertyUtil.getProperty("store_attribute_url");
	
	public static final String STORE_BRAND_URL = PropertyUtil.getProperty("store_brand_url");
	
	public static final String STORE_BRANDDESIGNER_URL = PropertyUtil.getProperty("store_branddesigner_url");
	
	public static final String BRAND_ADD_URL = PropertyUtil.getProperty("brand_add_url");
	
	public static final String STORE_GETALL_URL  = PropertyUtil.getProperty("store_getAll_url");
	
	public static final String GOOD_ADD_URL =  PropertyUtil.getProperty("good_add_url");
	
	public static final String DESIGNER_ADD_URL = PropertyUtil.getProperty("designer_add_url");
	
	public static final String CIRCLE_ADD_URL = PropertyUtil.getProperty("circle_add_url");
	
	public static final String CIRCLE_TYPE_URL = PropertyUtil.getProperty("circle_type_url");
	
	public static final String GOOD_ONE_SORTURL = PropertyUtil.getProperty("good_one_sorturl");
	
	public static final String GOOD_TWO_SORTURL = PropertyUtil.getProperty("good_two_sorturl");
	
	public static final String ONE_ONLY_URL = PropertyUtil.getProperty("one_only_url");
	
	//获取七牛token的地址
	public static final String QINIU_TOKEN_URL = PropertyUtil.getProperty("qiniu_token_url");
	
	public static final String CIRCLE_GET_ALL = PropertyUtil.getProperty("circle_get_all");
	
	public static final String GOODS_GET_ALL = PropertyUtil.getProperty("goods_get_all");
	
	public static final String GOODS_GET_ALL_SIZE = PropertyUtil.getProperty("goods_get_all_size");
	
	public static final String CIRCLE_SEND_ARTICLE = PropertyUtil.getProperty("circle_send_article");
	
	//html部分
	public static final String HTML1 ="<!DOCTYPE html> "+
			"<html lang=\"en\">"+
			"<head>"+
			"    <meta charset=\"UTF-8\">"+
			"    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\">"+
			"    <meta name=\"format-detection\" content=\"telephone=no\" />"+
			"    <meta name=\"apple-mobile-web-app-capable\" content=\"yes\">"+
			"    <meta name=\"referrer\" content=\"unsafe-url\">"+
			"    <meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\">"+
			"<style>"+
			"	html,body{"+
			"		margin:0;"+
			"		padding:0;"+
			"	}"+
			"	.edit_div{width:100%;}"+
			"	.edit_div p,.edit_div img{width:100%;}"+
			"	</style> "+
			"</head>"+
			"<body  class=\"edit_div\"> ";
	public static final String HTML2="</body></html>";
	
}