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
    <link rel="stylesheet" href="${ctx}/static/css/common.css" />
    <link rel="stylesheet" href="${ctx}/static/css/header_footer.css" />
    <link rel="stylesheet" href="${ctx}/static/css/con_css.css" />
    <script type="text/javascript" src="${ctx}/static/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/common.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/layer/layer.js"></script>
    <script type="text/javascript" src="static/js/jquery.form.js"></script>
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
        <div class="commodityAdd_div">
        <!-- 专题详情 -->
          <form id="frm" action="${ctx}/special_save" method="post" enctype="multipart/form-data">
	           <input type="hidden" name="labels" id="labels"/>
	           <input type="hidden" name="insImgTxts" id="insImgTxts"/>
            <div class="widthHeight overflowHidden shopAdd_option_div" style="padding: 5px 0 10px;">
                <p class="floatLeft fontColor commodity_option_title">专题详情</p>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title"><span>*&nbsp;</span>标题</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <input type="text" class="inputText width350" id="specialTitle" name="specialTitle" maxlength="50"/>
                    <p class="errorPrompt" id="specialTitleError" style="display: none;">报错提示</p>
                    <span>0/50</span>
                </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title"><span>*&nbsp;</span>图片</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv paddingTop3">
                    <p class="fontColor commodityFont_margin">文件格式JPG、JPEG、PNG，文件大小3M以内，长宽比为9:14，建议尺寸750PX*1000PX</p>
                    <div class="widthHeight overflowHidden">
                        <div class="commodity_imgDiv">
                            <div class="opacity_div">
                                <!-- <div class="opacity_div_back"></div> -->
                              <!--   <p>banner头图</p> -->
                            </div>
                            <img src="static/images/add_ico.png" id="specialPhotoImg" style="width: 20px; margin: 45px 0 0 0;" onclick='$("#specialPhoto").click();'/>
                        </div>
                        <input type="file" id="specialPhoto" name="specialPhoto" style="display: none;" onchange="setImagePreview(this,specialPhotoImg,0);"/>
                    </div>
                </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title">圈子</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
	               <select id="circleId" name="circleId" class="inputText width350">
	                  <option value="">--请选择--</option>
	                  <c:forEach items="${circleList}" var="item">
	                    <option value="${item.circleId}">${item.name}</option>
	                  </c:forEach>
	               </select>
                </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title"><span>*&nbsp;</span>简介</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv" >
                  <textarea class="commodity_textarea" id="specialDesc" name="specialDesc" ></textarea> 
                </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title"><span>*&nbsp;</span>图文详情</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv" id="txtImgDetail" >
                </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title">插入文本</p>
                <!--
                 <div class=" floatLeft fontColor shopAdd_option_conDiv widthHeight paddingTop3">
                    <input type="radio" name="promotionType1" class="inputRadio floatLeft" value="1" checked="checked" /><span class="radioName">文本</span>
                    <input type="radio" name="promotionType1" class="inputRadio" value="2" onclick="promotionTypeClick(1)" /><span class="radioName">图片</span>
                    <input type="radio" name="promotionType1" class="inputRadio" value="3" onclick="promotionTypeClick(2)"/><span class="radioName">商品</span>
                </div>
                -->
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div" name="txtDiv">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title"><span></span></p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <textarea class="commodity_textarea" ></textarea> 
                    <span onClick="addToTxt(this)">添加</span>
                </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title">插入图片</p>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title"></p>
                <div class="floatLeft fontColor shopAdd_option_conDiv paddingTop3">
                    <p class="fontColor commodityFont_margin">文件格式JPG、JPEG、PNG，文件大小3M以内，长宽比为9:14，建议尺寸750PX*1000PX</p>
                    <div class="widthHeight overflowHidden">
                        <div class="commodity_imgDiv">
                            <img src="static/images/add_ico.png" id="insPhotoImg" name="insPhotoImg" style="width: 20px; margin: 45px 0 0 0;" onclick="insPhotoImgClick(this)"/>
                        </div>
                        <input type="file" name="insPhoto" style="display: none;" onchange="setImagePreview(this,insPhotoImg,0);"/>
                       <span onClick="addToImg(this)">添加</span>
                    </div>
                </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title">插入商品</p>
                 <div class="floatLeft fontColor shopAdd_option_conDiv">
	             	<input type="button" value="选择商品" class="inputButton" id="selectGoods"/>
                </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title">标签</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <input type="text" class="inputText width350" id="specialLabel1" name="specialLabel" maxlength="6"/>
                    <span onclick="showLabel(1)">添加</span>
                </div>
             </div>
             <div class="widthHeight overflowHidden shopAdd_option_div" style="display: none;">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title"></p>
                <div class="floatLeft fontColor shopAdd_option_conDiv" >
                    <input type="text" class="inputText width350" id="specialLabel2"  name="specialLabel" maxlength="6" />
                    <span onclick="showLabel(2)">添加</span>
                </div>
             </div>
             <div class="widthHeight overflowHidden shopAdd_option_div" style="display: none;">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title"></p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <input type="text" class="inputText width350"  id="specialLabel3"  name="specialLabel" maxlength="6"/>
                </div>
            </div>
            <div class="widthHeight paddingBottom50 marginTop10">
                <input type="button" value="预览" class="inputButton shopAdd_btn" style="display: none"/>
                <input type="button" value="提交" class="inputButton shopAdd_btn" id="specialAddBtn" onclick="submitSpecial()" style="margin-left: 300px;"/>
            </div>
            </form>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
var ctx = "${ctx}";
$('#selectGoods').on('click', function(){
	layer.open({
	  type: 2,
	  title: '选择商品',
	  maxmin: true,
	  shadeClose: false, //点击遮罩关闭层
	  area : ['900px' , '400px'],
	  content: ctx + "/special_choice_page",
	});
});
function showLabel(num){
	if(num < 3){
		var id = "specialLabel" + (num + 1);
		var div = $("#" + id).parent().parent();
		if(!div.is(':visible')){
			div.show();
		}
	}
}
function addToTxt(obj){
	var txt = $(obj).prev().val();
	 if($.trim(txt) == ""){
		 return;
	 }
	//var divs = $("#txtImgDetail").find("div[name='txtImgDiv']"); style="text-align: left"
	var html = "<div name=\"txtImgDiv\" flag='0'>";
	    html+= "<p class=\"floatLeft fontColor\" style=\"font-size:14px;text-align: left\" name=\"detailTxt\" >"+txt+"</p>";
	    html+= "<span onClick=\"delDetailTxt(this)\" style=\"margin-left: 20px;\">删除</span>";
	    html+= "</div>";
    $("#txtImgDetail").append(html);
    $(obj).prev().val("");
}
function delDetailTxt(obj){
	$(obj).parent().remove();
}
function addToImg(obj){
	if($(obj).prev().val() == ""){
		return;
	}
	var id = new Date().getTime();
	var sourceImg = $(obj).prev().prev().children();
	var imgSrc = sourceImg.attr("src");
	sourceImg.attr("src","static/images/add_ico.png");
	sourceImg.attr("style","width: 20px; margin: 45px 0 0 0");
	var html = "<div name=\"txtImgDiv\" flag='1' id='div_"+ id+"'>";
	    html+= "<img src='"+imgSrc+"' name=\"detailImg\" style=\"width: 100px; margin: 20px 0px 0px; height: 90px;\" />";
	    html+= "<span onClick=\"delDetailImg(this)\" style=\"margin-left: 20px;\">删除</span>";
	    html+= "</div>";
	$("#txtImgDetail").append(html);
	$(obj).prev().clone(true).removeAttr("onchange").attr("name","detailImgPhoto").appendTo("#div_" + id);
	$(obj).val("");
}
function delDetailImg(obj){
	$(obj).parent().remove();
}
function delDetailGoods(obj){
	$(obj).parent().remove();
}
function insPhotoImgClick(obj){
	$(obj).parent().next().click();
}
function addImg(obj){
	var div = $(obj).parent().parent().parent();
	div.after(div.prop('outerHTML'));
	var img = div.next().find("img");
	img.attr("src","static/images/add_ico.png");
	img.attr("style","width: 20px; margin: 45px 0 0 0");
}
function deleteImg(obj){
	if($("input[name='insPhoto']").length > 1){
		var div = $(obj).parent().parent().parent();
		div.remove();
	}
}
$(document).ready(function(){
	$("#menu_5").addClass("li_active");
	$("#menuT_1").text("运营管理");
	$("#menuT_2").text("专题添加");
});

function submitSpecial(){
	// 累计标签
	var labels = "";
	$("input[name='specialLabel']").each(function(index,domEle){
		var lel = $.trim($(domEle).val());
		if(labels == "" ){
			if(lel!=""){
				labels = lel;
			}
		}else{
			if(lel!=""){
				labels += "," + lel;
			}
		}
	})
	$("#labels").val(labels);
	// 构建文字，图片json串
	var insImgTxts = "";
	var jsonArr = new Array();
	$("div[name='txtImgDiv']").each(function(index,domEle){
		var div = $(domEle);
		var flag = div.attr("flag");
		var str = "";
		var jo;
		if(flag == 0){
			str = div.find("p[name=detailTxt]").text();
			jo = {type:0 ,value:str};
		}else if(flag==1){
			str = div.find("input[type=file][name=detailImgPhoto]").val();
			jo = {type:1 ,value:str.substring(str.lastIndexOf('\\')+1)};
		}else{
			str = div.attr("id").split("_");
			jo = {type:2 ,value:str[1]};
		}
		jsonArr.push(jo);
	})
	$("#insImgTxts").val(JSON.stringify(jsonArr));
/* 	if($("#specialTitle").val() ==""){
		alert("标题不能为空");
		return false;
	}
	if($("#specialPhoto").val() ==""){
		alert("图片不能为空");
		return false;
	}
	if($("#specialDesc").val() ==""){
		alert("图文详情不能为空");
		return false;
	}
	alert("提交成功！");
	*/
	$("#specialAddBtn").removeAttr("onclick");
	$("#frm").ajaxSubmit({
		type : 'post',
		url : ctx + "/special_save",
		success : function(responseText, statusText) {
			if(responseText==1){
				alert("专题添加成功！");
				location.href='${ctx}/special_list';
			}else{
				alert("专题添加失败！");
			}
		},
		error : function() {
			alert('操作失败!');
		}
	});
	
}
//下面用于图片上传预览功能
function setImagePreview(docObj, imgObjPreview,type) {

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
            if(type == "0"){
            	imgObjPreview.style.width = "100px";
			    imgObjPreview.style.height = "90px";
            	
            }else{
            	imgObjPreview.style.width = "182px";
				imgObjPreview.style.height = "102px";
            }
			
			 
			//imgObjPreview.src = docObj.files[0].getAsDataURL();
			//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
			 if(type == "0"){
				 imgObjPreview.style.marginTop="20px";
	            }else{
	             imgObjPreview.style.marginTop="0px";
	            }
			
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
//下面用于图片上传预览功能
function setImagePreview1(docObj,type) {
	//docObj			上传图片浏览触发控件
	//imgObjPreview		上传图片浏览区域控件
	var imgObjPreview = $(docObj).prev().prev().get(0); //获取前面一个图片元素
	
	if(docObj.files && docObj.files[0]){
		//检查上传文件格式s
		var last=docObj.value.match(/^(.*)(\.)(.{1,8})$/)[3];
        last=last.toUpperCase();
        if(last== "JPG" || last== "JPEG"||last== "PNG"||last== "GIF"){
			//火狐下，直接设img属性
            imgObjPreview.style.display = 'block';
            //必须设置初始大小
            if(type == "0"){
            	imgObjPreview.style.width = "100px";
			    imgObjPreview.style.height = "90px";
            	
            }else{
            	imgObjPreview.style.width = "182px";
				imgObjPreview.style.height = "102px";
            }
			
			 
			//imgObjPreview.src = docObj.files[0].getAsDataURL();
			//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
			 if(type == "0"){
				 imgObjPreview.style.marginTop="20px";
	            }else{
	             imgObjPreview.style.marginTop="0px";
	            }
			
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