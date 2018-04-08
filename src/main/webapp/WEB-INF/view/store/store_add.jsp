<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />
    <title>2.0平台后台</title>
    <meta name="keywords" content="2.0平台后台"/>
    <meta name="description" content="2.0平台后台"/>
    <link rel="stylesheet" href="static/css/common.css" />
    <link rel="stylesheet" href="static/css/header_footer.css" />
    <link rel="stylesheet" href="static/css/con_css.css" />
    <script type="text/javascript" src="static/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="static/js/jquery.form.js"></script>
    <script type="text/javascript" src="static/js/common.js"></script>
</head>
<body>
<!-- 头部 -->
<div class="header">
    <h1 class="header_h1">2.0平台后台</h1>
</div>
<!-- 内容 -->
<div class="con">
    <%@ include file="../common/menu.jsp"%>
    <!-- 右侧内容 -->
    <div class="rightCon">
    <form id="storeAddForm" action="${ctx}/store/save" method="post" enctype="multipart/form-data">
        <div class="shopAdd_div">
            <div class="widthHeight overflowHidden shopAdd_option_div" style="padding: 5px 0 10px;">
                <p class="floatLeft fontColor shopAdd_option_title"><span>*&nbsp;</span>选择店铺类型</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <input type="radio" name="shopType1" class="shopRadio" value="1" checked="checked"/>个人店铺
                    <input type="radio" name="shopType1" class="shopRadio" value="2" />企业店铺
                </div>
                <input type="hidden" name="shopType" id="shopType" class="shopRadio" value="" />
            </div>
            
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin shopAdd_option_title"><span>*&nbsp;</span>店铺类型</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <select id="shopAttributeTypeID" name="shopAttributeTypeID" class="inputText">
                       <option value="">请选择---</option>
                       <c:forEach items="${storeTypeList }" var="storeTypeVo">
                           <option value="${storeTypeVo.shopAllAttributeId}">${storeTypeVo.name}</option>
                       </c:forEach>
                    </select>
                    
                </div>
            </div>
            
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin shopAdd_option_title"><span>*&nbsp;</span>店铺名称</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <input type="text" name="shopName" id="shopName" class="inputText" maxlength="20"/>
                    <p class="errorPrompt" id="shopNameError" style="display: none;">报错提示</p>
                </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin shopAdd_option_title"><span>*&nbsp;</span>联系方式</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <input type="text" name="mobilePhone" id="mobilePhone" class="inputText" maxlength="11" onchange="checkPhone('mobilePhone')"/>
                    <p class="errorPrompt" id="mobilePhoneError" style="display: none;">报错提示</p>
                </div>
            </div>
            
            <div class="widthHeight overflowHidden shopAdd_option_div" style="display: none;">
                <p class="floatLeft fontColor shopAdd_option_titleMargin shopAdd_option_title"><span>*&nbsp;</span>线下店铺地址</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                     <input type="text" name="xianAddress" id="xianAddress" class="inputText" maxlength="50"/>
                    <p class="errorPrompt" id="xianAddressError" style="display: none;">报错提示</p>
                </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin shopAdd_option_title"><span>*&nbsp;</span>店铺介绍</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                     <textarea class="commodity_textarea" id="shopAbout" name="shopAbout"></textarea>
                    <p class="errorPrompt" id="shopDescError" style="display: none;">报错提示</p>
                </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
              <p class="floatLeft fontColor shopAdd_option_titleMargin shopAdd_option_title"><span>*&nbsp;</span>店铺logo</p>
              <div class="floatLeft fontColor shopAdd_option_conDiv">
                  <div class="shopAdd_imgDiv" >
                      <img src="static/images/add_ico.png" style="margin: 22px 0 0 0;" id="shopAvatarImg" onclick='$("#shopAvatar").click();'/>
                      <input type="file" id="shopAvatar" name="shopAvatar" style="display: none;" onchange="javascript:setImagePreview(this,shopAvatarImg);"/>
                  </div>
               </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
              <p class="floatLeft fontColor shopAdd_option_titleMargin shopAdd_option_title"><span>*&nbsp;</span>店铺图像</p>
              <div class="floatLeft fontColor shopAdd_option_conDiv">
                 <!--  <div class="shopAdd_imgDiv" >
                      <img src="static/images/add_ico.png" style="margin: 22px 0 0 0;" id="shopLogoImg" onclick='$("#shopLogo").click();'/>
                      <input type="file" id="shopLogo" name="shopLogo" style="display: none;" onchange="javascript:setImagePreview(this,shopLogoImg);"/>
                  </div> -->
                  <div class="widthHeight overflowHidden" >
                        <div class="commodity_imgDiv" onclick="$('#shopPhoto1').click();">
                            <div class="opacity_div"  >
                                <div class="opacity_div_back"></div>
                                <p ><span>*</span>详情页图片</p>
                            </div>
                            <img src="static/images/add_ico.png" id="commodityPhoto1Img" style="width: 20px; margin: 45px 0 0 0;" />
                            
                        </div>
                         <input type="file" id="shopPhoto1" name="shopPhoto2" style="display: none;" onchange="javascript:setImagePreview1(this,commodityPhoto1Img);"/>
                        
                         <div class="commodity_imgDiv" onclick="$('#shopPhoto2').click();">
                            <div class="opacity_div"  >
                                <div class="opacity_div_back"></div>
                                <p ><span>*</span>详情页图片</p>
                            </div>
                            <img src="static/images/add_ico.png" id="commodityPhoto2Img" style="width: 20px; margin: 45px 0 0 0;" />
                            
                        </div>
                         <input type="file" id="shopPhoto2" name="shopPhoto2" style="display: none;" onchange="javascript:setImagePreview1(this,commodityPhoto2Img);"/>
                        
                        
                        <div class="commodity_imgDiv" onclick="$('#shopPhoto3').click();">
                            <div class="opacity_div">
                                <div class="opacity_div_back"></div>
                                <p><span>*</span>详情页图片</p>
                            </div>
                            <img src="static/images/add_ico.png"  id="commodityPhoto3Img"  style="width: 20px; margin: 45px 0 0 0;"/>
                            
                        </div>
                         <input type="file" id="shopPhoto3" name="shopPhoto2"  style="display: none;" onchange="javascript:setImagePreview1(this,commodityPhoto3Img);"/>
                        <div class="commodity_imgDiv" onclick="$('#shopPhoto4').click();">
                            <div class="opacity_div">
                                <div class="opacity_div_back"></div>
                                <p><span>*</span>详情页图片</p>
                            </div>
                            <img src="static/images/add_ico.png" id="commodityPhoto4Img"  style="width: 20px; margin: 45px 0 0 0;"/>
                           
                        </div>
                          <input type="file" id="shopPhoto4" name="shopPhoto2" style="display: none;" onchange="javascript:setImagePreview1(this,commodityPhoto4Img);"/>
                    </div>
           
               </div>
            </div>
           
            <div class="contactInformation_div">
                <p class="fontColor">客服热线：021-611 9850/400-6288-359</p>
                <p class="fontColor">邮箱：laura.lu@jtshopping.com</p>
            </div>
            <div class="widthHeight">
                <input type="button" value="提交" id="storeAddBtn" onclick="btnSubmit();" class="inputButton shopAdd_btn"/>
            </div>
        </div>
    </form>
    </div>
</div>
</body>
<script type="text/javascript">
var ctx = "${ctx}";
$(document).ready(function(){
	$("#menu_1").addClass("li_active");
});
function btnSubmit(){
	
	$("#shopType").val($("input[name='shopType1'][checked]").val()); 
	
	if($("#shopName").val() == ""){
		alert("店铺名称不能为空");
		return false;
	}
	if($("#mobilePhone").val() == ""){
		alert("联系方式不能为空");
		return false;
	}
	if($("#shopAvatar").val() == ""){
		alert("店铺logo为空");
		return false;
	}
	if($("#shopPhoto1").val() == ""){
		alert("店铺图像为空");
		return false;
	}

	if($("#shopAttributeTypeID").val() == ""){
		alert("店铺类型为空");
		return false;
	}
	
	$("#storeAddBtn").removeAttr("onclick");
	$("#storeAddForm").ajaxSubmit({
		type : 'post',
		url : ctx + "/store/save",
		success : function(responseText, statusText) {
			if(responseText==1){
				alert("店铺添加成功！");
				location.href='${ctx}/store_list';
			}else{
				alert("店铺添加失败！");
			}
		},
		error : function() {
			alert('操作失败!');
		}
	});
}
function checkIdCard(){
	
	 var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/; 
    if(reg.test($("#shopIdNumber").val()) === false){
	   alert("身份证不合法请重新输入！");
	   $("#shopIdNumber").val("");
	   $("#shopIdNumber").focus();
    }
 }


function checkPhone(obj){
	 var reg = /^1[3|4|5|7|8][0-9]{9}$/; //验证规则
	 if(reg.test(document.getElementById(obj).value) === false){
		   alert("联系电话格式不正确！");
		   document.getElementById(obj).value="";
		   document.getElementById(obj).focus();
	     }
  }

//下面用于图片上传预览功能
function setImagePreview(docObj, imgObjPreview) {

	//docObj			上传图片浏览触发控件
	//imgObjPreview		上传图片浏览区域控件
	if(docObj.files && docObj.files[0]){
		//检查上传文件格式s
		var last=docObj.value.match(/^(.*)(\.)(.{1,8})$/)[3];
        last=last.toUpperCase();
        if(last== "JPG" || last== "JPEG"||last== "PNG"||last== "GIF"){
			//火狐下，直接设img属性
            imgObjPreview.style.display = 'block';
            //必须设置初始大小
			imgObjPreview.style.width = "182px";
			imgObjPreview.style.height = "102px";
			 
			//imgObjPreview.src = docObj.files[0].getAsDataURL();
			//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
			imgObjPreview.style.marginTop="0px";
		 } else{
	         alert("只能上传.JPG,.JPEG,GIF,PNG文件,请重新选择！");
			// for IE, Opera, Safari, Chrome
			if (docObj.outerHTML) {
				docObj.outerHTML = docObj.outerHTML;
			} else { // FF(包括3.5)
				docObj.value = "";
			}
			imgObjPreview.src = "${ctx}/static/images/add_ico.png";
            return false;
          }
	 }else{
		//IE下，使用滤镜
		docObj.select();
		//var imgSrc = document.selection.createRange().text;
		var localImagId = imgObjPreview;
		//必须设置初始大小
		/* localImagId.style.width = "150px";
		localImagId.style.height = "180px"; */
		//图片异常的捕捉，防止用户修改后缀来伪造图片
		try{
			localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
			localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
		}catch(e){
			alert("您上传的图片格式不正确，请重新选择!");
			return false;
		}
		imgObjPreview.style.display = 'none';
		document.selection.empty();
	}
	return true;
}

function setImagePreview1(docObj, imgObjPreview) {
	//docObj			上传图片浏览触发控件
	//imgObjPreview		上传图片浏览区域控件
	if(docObj.files && docObj.files[0]){
		//检查上传文件格式s
		var last=docObj.value.match(/^(.*)(\.)(.{1,8})$/)[3];
        last=last.toUpperCase();
        if(last== "JPG" || last== "JPEG"||last== "PNG"||last== "GIF"){
			//火狐下，直接设img属性
            imgObjPreview.style.display = 'block';
            //必须设置初始大小
			imgObjPreview.style.width = "100px";
			imgObjPreview.style.height = "90px";
			 
			//imgObjPreview.src = docObj.files[0].getAsDataURL();
			//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
			imgObjPreview.style.marginTop="20px";
		 } else{
	         alert("只能上传.JPG,.JPEG,GIF,PNG文件,请重新选择！");
			// for IE, Opera, Safari, Chrome
			if (docObj.outerHTML) {
				docObj.outerHTML = docObj.outerHTML;
			} else { // FF(包括3.5)
				docObj.value = "";
			}
			imgObjPreview.src = "${ctx}/static/images/add_ico.png";
            return false;
          }
	 }else{
		//IE下，使用滤镜
		docObj.select();
		//var imgSrc = document.selection.createRange().text;
		var localImagId = imgObjPreview;
		//必须设置初始大小
		/* localImagId.style.width = "150px";
		localImagId.style.height = "180px"; */
		//图片异常的捕捉，防止用户修改后缀来伪造图片
		try{
			localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
			localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
		}catch(e){
			alert("您上传的图片格式不正确，请重新选择!");
			return false;
		}
		imgObjPreview.style.display = 'none';
		document.selection.empty();
	}
	return true;
}

</script>
</html>