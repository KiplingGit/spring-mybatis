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
        <div class="shopAdd_div">
            <div class="widthHeight overflowHidden shopAdd_option_div" style="padding: 5px 0 10px;">
                <p class="floatLeft fontColor shopAdd_option_title"><span>*&nbsp;</span>选择店铺类型</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <input type="radio" name="shopRadio" class="shopRadio" value="1" checked="checked"/>个人店铺
                    <input type="radio" name="shopRadio" class="shopRadio" value="0"/>企业店铺
                </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin shopAdd_option_title"><span>*&nbsp;</span>申请人姓名</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <input type="text" name="shopName" id="shopName" class="inputText" maxlength="20"/>
                    <p class="errorPrompt" id="shopNameError" style="display: none;">报错提示</p>
                </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin shopAdd_option_title"><span>*&nbsp;</span>联系方式</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <input type="text" name="shopContactWay" id="shopContactWay" class="inputText" maxlength="11" onchange="checkPhone('shopContactWay')"/>
                    <p class="errorPrompt" id="shopContactWayError" style="display: none;">报错提示</p>
                </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin shopAdd_option_title"><span>*&nbsp;</span>申请人身份证号码</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <input type="text" name="shopIdNumber" id="shopIdNumber" class="inputText" onchange="checkIdCard()" maxlength="20"/>
                    <p class="errorPrompt" id="shopIdNumberError" style="display: none;">报错提示</p>
                </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin shopAdd_option_title"><span>*&nbsp;</span>申请人身份证正反面</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <div class="shopAdd_imgDiv" >
                        <img src="static/images/add_ico.png" style="margin: 22px 0 0 0;" id="shopFrontIdImg" onclick='$("#shopFrontId").click();'/>
                        <input type="file" id="shopFrontId" name="shopFrontId" style="display: none;" onchange="javascript:setImagePreview(this,shopFrontIdImg);"/>
                    </div>
                    <div class="shopAdd_imgDiv shopAdd_imgMargin">
                        <img src="static/images/add_ico.png" style="margin: 22px 0 0 0;" id="shopOppositeIdImg"  onclick='$("#shopOppositeId").click();'/>
                        <input type="file" id="shopOppositeId" name="shopOppositeId" style="display: none"  onchange="javascript:setImagePreview(this,shopOppositeIdImg);"/>
                    </div>
                </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin shopAdd_option_title"><span>*&nbsp;</span>申请人手持身份证正面</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <div class="shopAdd_imgDiv">
                        <img src="static/images/add_ico.png" style="margin: 22px 0 0 0;" id="shopHoldIdImg" onclick='$("#shopHoldId").click();'/>
                        <input type="file"  name="shopHoldId" id="shopHoldId" style="display: none"  onchange="javascript:setImagePreview(this,shopHoldIdImg);"/>
                    </div>
                </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin shopAdd_option_title"><span>*&nbsp;</span>签署协议</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <input type="button" value="下载协议" class="inputButton"/>
                    <input type="button" value="上传协议" class="inputButton"/>
                </div>
            </div>

            <div class="contactInformation_div">
                <p class="fontColor">客服热线：021-611 9850/400-6288-359</p>
                <p class="fontColor">邮箱：laura.lu@jtshopping.com</p>
            </div>
			<form method="post"  action="http://upload.qiniu.com/" enctype="multipart/form-data">
			  <input name="key" type="hidden">
			  <input name="token" type="hidden" value="xVZswe2lD7ZyPJvmlgfgdH3z2YIKYBdoiqziM7zz:xD-x4DRiyIrh8F6794eEmnDcFD8=:eyJzY29wZSI6Imp0c2hvcHBpbmciLCJkZWFkbGluZSI6MTQ5NDg2OTMyNH0=">
			  <input name="file" type="file" />
			  <input name="crc32" type="hidden" />
			  <input name="accept" type="hidden" />
			  <input type="submit" value="提交"/>
			</form>
            <div class="widthHeight">
                <input type="button" value="提交" onclick="submit();" class="inputButton shopAdd_btn"/>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="static/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="static/js/common.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$("#menu_1").addClass("li_active");
});

function submit(){
	if($("#shopName").val() == ""){
		alert("申请人姓名不能为空");
		return false;
	}
	if($("#shopContactWay").val() == ""){
		alert("联系方式不能为空");
		return false;
	}
	
	if($("#shopIdNumber").val() == ""){
		alert("申请人身份证号码不能为空");
		return false;
	}
	if($("#shopFrontId").val() == ""){
		alert("申请人身份证正反面为空");
		return false;
	}
	if($("#shopOppositeId").val() == ""){
		alert("申请人身份证正反面为空");
		return false;
	}
	if($("#shopHoldId").val() == ""){
		alert("申请人身份证正反面为空");
		return false;
	}
	alert("提交成功！");
	location.href='${ctx}/store_list';
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
</script>
</html>