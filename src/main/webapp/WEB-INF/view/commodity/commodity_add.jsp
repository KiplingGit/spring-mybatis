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
    <script type="text/javascript" src="static/js/jquery.form.js"></script>
    <link href="${ctx}/static/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css"/>
    <script src="${ctx}/static/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf-8" src="${ctx}/static/js/kindeditor/kindeditor.js"></script>  
    <script type="text/javascript" charset="utf-8" src="${ctx}/static/js/kindeditor/lang/zh_CN.js"></script>  
</head>
<body>
<!-- 头部 -->
<div class="header">
    <h1 class="header_h1">2.0平台后台</h1>
</div>

<!-- 内容 -->
<div class="con">
    <!-- 面包屑 
    <div class="widthHeight crumbs_div">
        <p class="crumbs_marginLeft">店铺管理</p>
        <span>-</span>
        <p>店铺列表</p>
    </div>
    <div class="leftMenu">
        <div class="leftMenu_loge">LOGE</div>
        <div class="widthHeight leftMenu_directory_div">
            <div class="widthHeight overflowHidden leftMenu_directoryTitle_div">
                <p class="floatLeft fontColor">店铺管理</p>
                <img src="static/images/leftMenu_right_ico.png" class="floatRight">
            </div>
            <ul class="widthHeight leftMenu_directoryCon_ul">
                <li>店铺审核</li>
                <li>店铺列表</li>
                <li>品牌管理</li>
                <li>设计师管理</li>
            </ul>
        </div>
        <div class="widthHeight leftMenu_directory_div">
            <div class="widthHeight overflowHidden leftMenu_directoryTitle_div">
                <p class="floatLeft fontColor">商品管理</p>
                <img src="static/images/leftMenu_down_ico.png" class="floatRight">
            </div>
            <ul class="widthHeight leftMenu_directoryCon_ul" style="display: block;">
                <li class="li_active">商品列表</li>
                <li>出售中的商品</li>
                <li>仓库中的商品</li>
                <li>历史商品</li>
            </ul>
        </div>
        <div class="widthHeight leftMenu_directory_div">
            <div class="widthHeight overflowHidden leftMenu_directoryTitle_div">
                <p class="floatLeft fontColor">运营管理</p>
                <img src="static/images/leftMenu_right_ico.png" class="floatRight">
            </div>
            <ul class="widthHeight leftMenu_directoryCon_ul">
                <li>专题</li>
            </ul>
        </div>
    </div>
 -->
 <%@ include file="../common/menu.jsp"%>
    <!-- 右侧内容 -->
    <div class="rightCon">
    <form id="commondityForm" action="${ctx}/commondity/insert" method="post" enctype="multipart/form-data">
        <div class="commodityAdd_div">
        <!-- 商品基本信息 -->
            <div class="widthHeight overflowHidden shopAdd_option_div" style="padding: 5px 0 10px;">
                <p class="floatLeft fontColor commodity_option_title">1.商品基本信息</p>
            </div>
          <input type="hidden" id="pages" value="${pages}"/>
          <input type="hidden" id="nextPage" value="${nextPage}"/>
          <input type="hidden" id="pageNum" value="${pageNum}"/>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title">店铺名称</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
	               <select id="shopId" name="shopId" class="inputText width350" onchange="getBrandList()">
	                  <option value="">请选择--</option>
	                  <c:forEach items="${shopList}" var="storeVo">
	                    <option value="${storeVo.shopId}">${storeVo.name}</option>
	                  </c:forEach>
	                  <c:if test="${nextPage ne 0 }">
	                     <option value="nextPage" onclick="nextPage()">下一页</option>
	                  </c:if>
	               </select>
                </div>
            </div>
             <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title"><span>*&nbsp;</span>品牌</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv paddingTop3">
                    <p class="fontColor commodityFont_margin">所属品牌必须申请通过后才能选择，未申请品牌请<a href="#">点击申请</a></p>
                    <select class="select_custom" id="shopBrandId" name="shopBrandId" onchange="getBrandDesignerList()">
                        <option value="">请选择品牌--</option>
                    </select>
                    <p class="errorPrompt" id="cpommodityBrandError" style="display:none; ">报错提示</p>
                </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title"><span>*&nbsp;</span>设计师</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv paddingTop3">
                    <p class="fontColor commodityFont_margin">所属品牌必须申请通过后才能选择，未申请品牌请<a href="#">点击申请</a></p>
                    <select class="select_custom" id="shopBrandDesignerId" name="shopBrandDesignerId" >
                        <option value="">请选择设计师--</option>
                    </select>
                </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title"><span>*&nbsp;</span>一级分类</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                     <select id="shopGoodsSortsIdOne" name="shopGoodsSortsIdOne" onchange="getTwoType()" class="inputText width350">
	                  <option value="">请选择--</option>
	                  <c:forEach items="${ctypeList1}" var="ctypeVo">
	                    <option value="${ctypeVo.shopGoodsSortsId}">${ctypeVo.name}</option>
	                  </c:forEach>
	                  </select>
                
                    <!-- <input type="text" class="inputText width350" id="shopGoodsSortsId"  name="shopGoodsSortsId" /> -->
                    <p class="errorPrompt" id="shopGoodsSortsIdError" style="display:none; ">报错提示</p>
                </div>
            </div>
            
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title"><span>*&nbsp;</span>二级分类</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                     <select id="shopGoodsSortsId" name="shopGoodsSortsId" class="inputText width350">
	                    <option value="">请选择--</option>
	                  </select>
                    <!-- <input type="text" class="inputText width350" id="shopGoodsSortsId"  name="shopGoodsSortsId" /> -->
                    <p class="errorPrompt" id="shopGoodsSortsIdError" style="display:none; ">报错提示</p>
                </div>
            </div>
            
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title"><span>*&nbsp;</span>商品名</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <input type="text" class="inputText width350" id="name" name="name" maxlength="50"/>
                    <p class="errorPrompt" id="nameError" style="display:none; ">报错提示</p>
                    <span>0/50</span>
                </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title">简述</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <input type="text" class="inputText width350" id="about" name="about" maxlength="50"/>
                    <p class="errorPrompt" id="aboutError" style="display:none; ">报错提示</p>
                    <span>0/50</span>
                </div>
            </div>
           <!--  <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title">货号</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <input type="text" class="inputText width350" id="cpommodityNo" name="cpommodityNo" />
                    <p class="errorPrompt" id="cpommodityNoError" style="display:none; " >报错提示</p>
                </div>
            </div> 
             <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title">价格（数字 分）</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <input type="text" class="inputText width350" id="priceFen" name="priceFen" />
                    <p class="errorPrompt" id="priceFenError" style="display:none; " >报错提示</p>
                </div>
            </div>-->
              <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title">库存（数字）</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <input type="text" class="inputText width350" id="stock" name="stock" />
                    <p class="errorPrompt" id="stockError" style="display:none; " >报错提示</p>
                </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title">显示现价</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <input type="text" class="inputText width350" id="priceFen" name="priceFen" />
                    <p class="errorPrompt" id="stockError" style="display:none; " >报错提示</p>
                </div>
            </div>
           <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title">原价最高</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <input type="text" class="inputText width350" id="priceOriginalHigh" name="priceOriginalHigh" />
                    <p class="errorPrompt" id="stockError" style="display:none; " >报错提示</p>
                </div>
            </div>
           <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title">原价最低</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <input type="text" class="inputText width350" id="priceOriginalLow" name="priceOriginalLow" />
                    <p class="errorPrompt" id="stockError" style="display:none; " >报错提示</p>
                </div>
            </div>
            <!-- <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title"><span>*&nbsp;</span>设计师</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv paddingTop3">
                    <p class="fontColor commodityFont_margin">设计师必须申请通过后才能选择，未申请设计师请<a href="#">点击申请</a></p>
                    <select class="select_custom" id="cpommodityDesigner" name="cpommodityDesigner">
                        <option>设计师</option>
                        <option>设计师1</option>
                        <option>设计师2</option>
                    </select>
                    <p class="errorPrompt" id="cpommodityDesignerError" style="display:none;">报错提示</p>
                </div>
            </div> -->
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title">促销设置</p>
                <div class=" floatLeft fontColor shopAdd_option_conDiv widthHeight paddingTop3">
                        <input type="radio" name="promotionType1" class="inputRadio floatLeft" value="1" checked="checked" /><span class="radioName">一口价</span>
                       
                        <input type="radio" name="promotionType1" class="inputRadio" value="2" onclick="promotionTypeClick(1)" /><span class="radioName">全款预售</span>
                        <input type="radio" name="promotionType1" class="inputRadio" value="3" onclick="promotionTypeClick(2)"/><span class="radioName">店铺限时购</span>
                        <input type="radio" name="promotionType1" class="inputRadio" value="4" onclick="promotionTypeClick(3)"/><span class="radioName">首页限时购</span>
                        
                </div>
                
                <input id="promotionType" name="promotionType" value="" type="hidden"/>
                <input id="promotionTime" name="promotionTime" value="" type="hidden"/>
                <input id="promotionLong" name="promotionLong" value="" type="hidden"/>
                
            </div> 
            <div class="widthHeight overflowHidden shopAdd_option_div" style="display: none;">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title">开始时间</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                <input type="text"  name="birthday" id="birthday" class=" inputText width350 Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" /> 
                    <p class="errorPrompt" id="stockError" style="display:none; " >报错提示</p>
                </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title">图片</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv paddingTop3">
                    <p class="fontColor commodityFont_margin">建议：透明PNG底色图片；文件格式，文件大小3M以内，长宽比为9:14，建议尺寸360PX*560PX</p>
                    <div class="widthHeight overflowHidden" ><!-- onclick="$('#commodityPhoto').click();" -->
                        <div class="commodity_imgDiv" onclick="$('#homeImg').click();">
                            <div class="opacity_div">
                                <div class="opacity_div_back"></div>
                                <p><span>*</span>商品首页</p>
                            </div>
                            <img src="static/images/add_ico.png" id="commodityPhotoImg"  style="width: 20px; margin: 45px 0 0 0;" />
                        </div>
                    </div>
             <input type="file" id="homeImg" name="homeImg" style="display: none;" onchange="javascript:setImagePreview(this,commodityPhotoImg);"/>
               <p class="fontColor" style="margin:20px 0 10px;">文件格式JPG、JPEG、PNG，文件大小3M以内，长宽比为9:14，建议尺寸750PX*1000PX</p>
                    <div class="widthHeight overflowHidden" >
                        <div class="commodity_imgDiv" onclick="$('#commodityPhoto0').click();">
                            <div class="opacity_div"  >
                                <div class="opacity_div_back"></div>
                                <p ><span>*</span>详情页图片</p>
                            </div>
                            <img src="static/images/add_ico.png" id="commodityPhoto1Img" style="width: 20px; margin: 45px 0 0 0;" />
                            
                        </div>
                         <input type="file" id="commodityPhoto0" name="commodityPhoto1" style="display: none;" onchange="javascript:setImagePreview(this,commodityPhoto1Img);"/>
                        <div class="commodity_imgDiv" onclick="$('#commodityPhoto2').click();">
                            <div class="opacity_div">
                                <div class="opacity_div_back"></div>
                                <p><span>*</span>详情页图片</p>
                            </div>
                            <img src="static/images/add_ico.png" id="commodityPhoto2Img"  style="width: 20px; margin: 45px 0 0 0;"/>
                            
                        </div>
                         <input type="file" id="commodityPhoto2"  name="commodityPhoto1"  style="display: none;" onchange="javascript:setImagePreview(this,commodityPhoto2Img);"/>
                        <div class="commodity_imgDiv" onclick="$('#commodityPhoto3').click();">
                            <div class="opacity_div">
                                <div class="opacity_div_back"></div>
                                <p><span>*</span>详情页图片</p>
                            </div>
                            <img src="static/images/add_ico.png"  id="commodityPhoto3Img"  style="width: 20px; margin: 45px 0 0 0;"/>
                            
                        </div>
                         <input type="file" id="commodityPhoto3"  name="commodityPhoto1" style="display: none;" onchange="javascript:setImagePreview(this,commodityPhoto3Img);"/>
                        <div class="commodity_imgDiv" onclick="$('#commodityPhoto4').click();">
                            <div class="opacity_div">
                                <div class="opacity_div_back"></div>
                                <p><span>*</span>详情页图片</p>
                            </div>
                            <img src="static/images/add_ico.png" id="commodityPhoto4Img"  style="width: 20px; margin: 45px 0 0 0;"/>
                           
                        </div>
                          <input type="file" id="commodityPhoto4"  name="commodityPhoto1" style="display: none;" onchange="javascript:setImagePreview(this,commodityPhoto4Img);"/>
                    </div> 
                </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title">商品属性</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv paddingTop3" >
                    <p class="fontColor commodityFont_margin fontSize14">请填写商品属性，增加商品曝光率</p>
                    
                    <div class="widthHeight overflowHidden">
                        <div class="floatLeft fontColor commodity_attribute_div">
                            <p><input type="text" class="inputText"  name ="details" style="width: 70px;" id="D0"/></p>
                            <input type="text" class="inputText" id="D0_details"/>
                        </div>
                        <div class="floatLeft fontColor commodity_attribute_div">
                            <p onclick="AddTxt(this)">添加</p><p onclick="delDetailTxt(this)">删除</p>
                        </div>
                    </div>
                   
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title">规格</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv paddingTop3">
                   <!-- <div class="widthHeight overflowHidden">
                        <div class="overflowHidden selected_div">
                            <input type="text" style="width: 50px;" class="floatLeft inputText" id=""/>
                            <input type="button" value="添加" onclick="$('#commodityPhoto5').click();" class="inputButton"/>
                            
                        </div>
                    </div>
                    <div class="widthHeight overflowHidden">
                        <div class="overflowHidden selected_div">
                            <img src="static/images/unselected_ico.png" class="floatLeft selected_img" alt="unselected_ico" style="margin: 2px 15px 0 0;"/>
                            <input type="text" class="floatLeft inputText" id=""/>
                            <input type="text" class="floatLeft inputText" id=""/>
                            <input type="button" value="添加" onclick="$('#commodityPhoto5').click();" class="inputButton"/>
                        </div>
                    </div> -->
                    <div id="div1">
	                    <p class="fontColor commodityFont_margin fontSize14" style="margin: 10px 0 0 0;">
	                      <input type="text" class="inputText width55" style="margin-top: 15px;" value="" id="stitle1"/>
	                      <input type="button" value="添加" onclick="buttonTitle(div2)" style="margin-top: 15px;" class="inputButton"/>
	                    </p>
	                    <div class="widthHeight overflowHidden">
	                        <div class="overflowHidden selected_div">
	                            <img src="static/images/unselected_ico.png" class="floatLeft selected_img" alt="unselected_ico" style="margin: 18px 15px 0 0;"/>
	                            <div class="floatLeft textCenter commodity_specifications_div">
	                                <input type="text" class="inputText width55" name="svaluediv1" id="AA_1" style="margin-top: 15px;"/>
	                            </div>
	                            <div id="sbodydiv1"></div>
	                            
	                            <div class="floatLeft textCenter commodity_specifications_div">
	                                 <input type="button" value="添加" onclick="bodyAdd(sbodydiv1,'1')" style="margin-top: 15px;" class="inputButton"/>
	                            </div>
	                        </div>
	                    </div>
                    </div>
                    
                    
                    <div id="div2" style="display: none;">
	                    <p class="fontColor commodityFont_margin fontSize14" style="margin: 10px 0 0 0;">

	                      <input type="text" class="inputText width55" style="margin-top: 15px;" value="" id="stitle2"/>
	                      <input type="button" value="添加" onclick="buttonTitle(div3)" style="margin-top: 15px;" class="inputButton"/>
	                    </p>
	                    <div class="widthHeight overflowHidden">
	                        <div class="overflowHidden selected_div">
	                            <img src="static/images/unselected_ico.png" class="floatLeft selected_img" alt="unselected_ico" style="margin: 18px 15px 0 0;"/>
	                            <div class="floatLeft textCenter commodity_specifications_div">
	                                <input type="text" class="inputText width55" name="svaluediv2" id="BB_1" style="margin-top: 15px;"/>
	                            </div>
	                            <div id="sbodydiv2"> </div>
	                            
	                            <div class="floatLeft textCenter commodity_specifications_div">
	                                 <input type="button" value="添加" onclick="bodyAdd(sbodydiv2,'2')" style="margin-top: 15px;" class="inputButton"/>
	                            </div>
	                            
	                        </div>
	                    </div>
                    </div>
                    
                     <div id="div3" style="display: none;">
	                    <p class="fontColor commodityFont_margin fontSize14" style="margin: 10px 0 0 0;">

	                      <input type="text" class="inputText width55" style="margin-top: 15px;" value="" id="stitle3"/>
	                      <input type="button" value="添加" onclick="buttonTitle(div4)" style="margin-top: 15px;" class="inputButton"/>
	                      
	                    </p>
	                    <div class="widthHeight overflowHidden">
	                        <div class="overflowHidden selected_div">
	                            <img src="static/images/unselected_ico.png" class="floatLeft selected_img" alt="unselected_ico" style="margin: 18px 15px 0 0;"/>
	                            <div class="floatLeft textCenter commodity_specifications_div">
	                                <input type="text" class="inputText width55" name="svaluediv3" id="CC_1" style="margin-top: 15px;"/>
	                            </div>
	                            <div id="sbodydiv3"> </div>
	                            
	                            <div class="floatLeft textCenter commodity_specifications_div">
	                                 <input type="button" value="添加" onclick="bodyAdd(sbodydiv3,'3')" style="margin-top: 15px;" class="inputButton"/>
	                            </div>
	                            
	                        </div>
	                    </div>
                    </div>
                    
                    <div id="div4" style="display:none;">
	                    <p class="fontColor commodityFont_margin fontSize14" style="margin: 10px 0 0 0;">

	                      <input type="text" class="inputText width55" style="margin-top: 15px;" value="" id="stitle4"/>
	                    </p>
	                    <div class="widthHeight overflowHidden">
	                        <div class="overflowHidden selected_div">
	                            <img src="static/images/unselected_ico.png" class="floatLeft selected_img" alt="unselected_ico" style="margin: 18px 15px 0 0;"/>
	                            <div class="floatLeft textCenter commodity_specifications_div">
	                                <input type="text" class="inputText width55" name="svaluediv4" id="DD_1" style="margin-top: 15px;"/>
	                            </div>
	                            <div id="sbodydiv4"> </div>
	                            
	                            <div class="floatLeft textCenter commodity_specifications_div">
	                                 <input type="button" value="添加" onclick="bodyAdd(sbodydiv4,'4')" style="margin-top: 15px;" class="inputButton"/>
	                            </div>
	                            
	                        </div>
	                    </div>
                    </div>
                    
                    <p class="fontColor commodityFont_margin fontSize14" style="margin: 10px 0 5px 0" onclick="buildGroup()">生成商品组合</p>
                    <p class="fontColor commodityFont_margin fontSize14" style="margin: 10px 0 5px 0;">商品组合</p>
                    <div class="widthHeight overflowHidden" id="goodsGroups">
                      <!--   <div class="overflowHidden selected_div">
                            <div class="floatLeft textCenter commodity_specifications_div">
                                <p class="fontColor fontSize14">颜色</p>
                                <input type="text" class="inputText width74"/>
                            </div>
                            <div class="floatLeft textCenter commodity_specifications_div">
                                <p class="fontColor fontSize14"><span class="floatNone colorRed margin0">*</span>出售价格(元)</p>
                                <input type="text" class="inputText width74"/>
                            </div>
                            <div class="floatLeft textCenter commodity_specifications_div">
                                <p class="fontColor fontSize14">原价(元)</p>
                                <input type="text" class="inputText width74"/>
                            </div>
                            <div class="floatLeft textCenter commodity_specifications_div">
                                <p class="fontColor fontSize14"><span class="floatNone colorRed margin0">*</span>数量</p>
                                <input type="text" class="inputText width74"/>
                            </div>
                            <div class="floatLeft textCenter commodity_specifications_div">
                                <p class="fontColor fontSize14">商家编码</p>
                                <input type="text" class="inputText width74"/>
                            </div>
                        </div>
                    </div> -->
                </div>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title">图文详情</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <textarea class="commodity_textarea" id="describePhone" name="describePhone"></textarea>
                </div>
            </div>

            <!-- 商品物流 -->
            <div class="widthHeight overflowHidden shopAdd_option_div" style="padding: 5px 0 10px;">
                <p class="floatLeft fontColor commodity_option_title">2.商品物流</p>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title">是否包邮</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <div class="widthHeight paddingTop3">
                        <input type="radio" name="shopGoodsMailingId1" class="inputRadio" value="2" checked="checked" /><span class="radioName">包邮</span>
                        <input type="radio" name="shopGoodsMailingId1" class="inputRadio" value="1"/><span class="radioName">自定义邮费</span>
                    </div>
                    <input type="hidden" id="shopGoodsMailingId"  name="shopGoodsMailingId" value="1"/>
                  <!--   <p class="fontColor fontSize14" style="margin: 10px 0;">除一下地址外，其他地址都包邮</p>
                    <div class="widthHeight overflowHidden" id="addressDiv1">
                        <input type="checkbox" name="address" class="floatLeft" checked="checked" style="margin: 25px 8px 0 0;"/>
                        <div class="floatLeft textCenter commodity_specifications_div">
                            <p class="fontColor fontSize14">选择地区</p>
                            <input type="text" class="inputText width74 textCenter" value="香港"/>
                        </div>
                        <div class="floatLeft textCenter commodity_specifications_div">
                            <p class="fontColor fontSize14">设置价格(元)</p>
                            <input type="text" class="inputText width74 textCenter" value="20"/>
                        </div>
                        <p class="fontSize14 colorRed" style="display: inline-block; margin: 22px 0 0;" onclick="$('#addressDiv1').css('display','none'); ">删除</p>
                    </div>
                    <div class="widthHeight overflowHidden marginTop10" id="addressDiv2">
                        <input type="checkbox" name="address" class="floatLeft" style="margin: 6px 8px 0 0;"/>
                        <div class="floatLeft textCenter commodity_specifications_div">
                            <input type="text" class="inputText width74 textCenter" value="澳门"/>
                        </div>
                        <div class="floatLeft textCenter commodity_specifications_div">
                            <input type="text" class="inputText width74 textCenter" value="20"/>
                        </div>
                        <p class="fontSize14 colorRed" style="display: inline-block; margin: 2px 0 0;" onclick="$('#addressDiv2').css('display','none'); ">删除</p>
                    </div>
                    
                    <div class="widthHeight overflowHidden marginTop10" id="addressDiv3">
                        <input type="checkbox" name="address" class="floatLeft" style="margin: 6px 8px 0 0;"/>
                        <div class="floatLeft textCenter commodity_specifications_div">
                            <input type="text" class="inputText width74 textCenter" value="澳门1"/>
                        </div>
                        <div class="floatLeft textCenter commodity_specifications_div">
                            <input type="text" class="inputText width74 textCenter" value="20"/>
                        </div>
                        <p class="fontSize14 colorRed" style="display: inline-block; margin: 2px 0 0;" onclick="$('#addressDiv3').css('display','none'); ">删除</p>
                    </div> -->
                </div>
            </div>

            <!-- 售后服务 -->
            <div class="widthHeight overflowHidden shopAdd_option_div" style="padding: 5px 0 10px;">
                <p class="floatLeft fontColor commodity_option_title">3.售后服务</p>
            </div>
            <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title">售后服务</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv">
                    <div class="widthHeight overflowHidden selected_div">
                        <input type="checkbox" name="returnedType1" class="inputRadio floatLeft selected_img" value="1" /><span>一口价</span> <span>发票将在订单交易完成后开出</span>
                    </div>
                    <div class="widthHeight overflowHidden selected_div marginTop10">
                       <input type="checkbox" name="returnedType1" class="inputRadio floatLeft selected_img" value="3"  /><span>退换货承诺</span> <span>若存在质量问题或与描述不符，本店将主动提供退换货服务并承担来回邮费</span>
                     
                    </div>
                    <div class="widthHeight overflowHidden selected_div marginTop10">
                        <input type="checkbox" name="returnedType1" class="inputRadio floatLeft selected_img" value="2"  /><span>七天无理由</span> <span>向顾客提供七天无理由退换货服务（商品不影响二次销售）</span>
                    </div>
                      <input name="returnedType" type="hidden" id="returnedType" value="1"/>
                </div>
               
            </div>

            <!-- 上架选项 -->
           <!--  <div class="widthHeight overflowHidden shopAdd_option_div" style="padding: 5px 0 10px;">
                <p class="floatLeft fontColor commodity_option_title">4.上架选项</p>
            </div>
             -->
           <!--   <div class="widthHeight overflowHidden shopAdd_option_div">
                <p class="floatLeft fontColor shopAdd_option_titleMargin commodity_option_title"><span>*&nbsp;</span>上架时间</p>
                <div class="floatLeft fontColor shopAdd_option_conDiv paddingTop3">
                    <input type="checkbox" name="shelvesType" class="inputRadio" checked="checked"/><span class="radioName">立刻上架</span>
                    <input type="checkbox" name="shelvesType" class="inputRadio"/><span class="radioName">定时上架</span>
                    <input type="checkbox" name="shelvesType" class="inputRadio"/><span class="radioName">放入仓库</span>
                </div>
            </div>
           -->
           <input type="hidden" name="goodsSkuSpecs" id="goodsSkuSpecs"/>
           <input type="hidden" name="goodsGroupsParams" id="goodsGroupsParams"/>
           <input type="hidden" name="parametersList" id="parametersList"/>
            <div class="widthHeight paddingBottom50">
                <input type="button" value="提交" id="commondityAddBtn" onclick="submitCommidity();" class="inputButton shopAdd_btn"/>
            </div>
        </div>
        </form>
    </div>
</div>
<!-- 弹窗 -->
<div class="popup_div" id="price_popup">
    <div class="popup_opacity_div"></div>
    <div class="popup_con_div width600">
        <span class="popup_close">×</span>
        <!-- 弹窗内容编辑区begin -->
        <div class="widthHeight popup_con">
            <div class="overflowHidden selected_div popup_price">
            
                <input type="radio" name="returnedType2" class="inputRadio floatLeft" value="2" checked="checked" /><span class="fontColor">全款预售</span>
            </div>
            <p class="popup_price_p fontColor">消费者一次性付完全款，卖家按照约定时间（1-90）发货</p>
            <div class="popup_price_inputDiv">
                <p class="fontColor">预售结束时间</p>
                <input type="text" class="inputText  Wdate" id="promotion1End" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
            </div>
            <div class="popup_price_inputDiv">
                <p class="fontColor">商品发货时间</p>
                <span class="fontColor">预售结束</span>
                <input type="text" class="inputText width55" id="promotion1Day" />
                <span class="fontColor">天内</span>
            </div>
        </div>
        <div class="widthHeight popup_con">
            <div class="overflowHidden selected_div popup_price">
                  <input type="radio" name="returnedType2"  class="inputRadio floatLeft" value="3"  /><span class="fontColor">店铺内限时购</span>
            </div>
            <p class="popup_price_p fontColor">发布商品即开始限时购，限时购结束后商品下架处理</p>
            <div class="popup_price_inputDiv">
                <p class="fontColor">限时购持续时间</p>
                <span class="fontColor">持续</span>
                <input type="text" class="inputText width55" id="promotion2Day"/>
                <span class="fontColor">小时</span>
            </div>
        </div>
        <div class="widthHeight popup_con">
            <div class="overflowHidden selected_div popup_price">
            
                  <input type="radio" name="returnedType2" class="inputRadio floatLeft" value="4"  /><span class="fontColor">申请首页限时购</span>
            </div>
            <p class="popup_price_p fontColor">首页限时购以平台安排，不与店内限时购同步发布商品即开启限时购，限时购结束后商品下架处理</p>
            <div class="popup_price_inputDiv">
                <p class="fontColor">申请开始时间</p>
                <input type="text" class="inputText Wdate" id="promotion3Start" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
            </div>
            <div class="popup_price_inputDiv">
                <p class="fontColor">限时购持续时间</p>
                <span class="fontColor">持续</span>
                <input type="text" class="inputText width55" id="promotion3Hour"/>
                <span class="fontColor">小时</span>
            </div>
        </div>
        <!-- 弹窗内容编辑区end -->
        <div class="widthHeight textCenter marginTop10">
            <input type="button" class="popup_btn" onclick="promotionValue()" value="提交"/>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">


var ctx = "${ctx}";
var editor1;
KindEditor.ready(function(K){
    editor1 = K.create("textarea[id='describePhone']",{
        resizeType : 1,
        allowPreviewEmoticons: false,
        allowImageUpload:true,//允许上传图片
        allowFileManager:true, //允许对上传图片进行管理,
        allowImageRemote : false,//取消网络图片上传
      //  uploadJson: ctx + '/static/js/kindeditor/jsp/upload_json.jsp', //上传图片的java代码，只不过放在jsp中
       uploadJson: ctx + '/uploadFile/upload2', //上传图片的java代码，只不过放在jsp中
        fileManagerJson: ctx + '/static/js/kindeditor/jsp/file_manager_json.jsp',
        afterUpload: function(){
       	 this.sync();
        }, //图片上传后，将上传内容同步到textarea中
        afterCreate: function () {  //要取值设置这里 这个函数就是同步KindEditor的值到textarea文本框  
            this.sync();  
        },  
        afterBlur: function(){this.sync();},   ////失去焦点时，将上传内容同步到textarea中
        items : [
            'fontname','fontsize', '|','forecolor', 'hilitecolor','bold', 'italic','underline',
            'removeformat','|', 'justifyleft','justifycenter', 'justifyright','insertorderedlist',
            'insertunorderedlist','|', 'emoticons','link','media','|','image','multiimage']   

    });

});         

function delDetailTxt(obj){
	$(obj).parent().parent().remove();
}

$(function(){
	   $(":radio").click(function(){
	   $(this).attr("checked","checked");
	   });
	   
	   $(":checkbox").click(function(){
		   $(this).attr("checked","checked");
		   });
});
function  promotionTypeClick(obj){
/* 
	$("input[name='returnedType2']").removeAttr("checked");
	$("#returnedTypeId1").attr("checked","checked");
	$("input[name='returnedType2']")removeAttr("checked");
	$("#returnedTypeId1").attr("checked","checked");
	 */
	$("#price_popup").css('display','block'); 
}

	function promotionValue(){
		
		$("#promotionType").val($("input[name='returnedType2'][checked]").val());
		
		if($("input[name='returnedType2'][checked]").val() ==""){
			alert("请选择促销类型");
			return false;
		}else{
			if($("input[name='returnedType2'][checked]").val() =="2"){
				if($("#promotion1End").val() == ""){
				   alert("预售结束时间为空");
				   return false;
				}
				$("#promotionTime").val($("#promotion1End").val());
				if($("#promotion1Day").val() == ""){
					alert("预售结束的天数为空");
					return false;
				}
				$("#promotionLong").val($("#promotion1Day").val());
				
				
			}else if($("input[name='returnedType2'][checked]").val() =="3"){
				
				if($("#promotion2Day").val() == ""){
					alert("限时购持续时间小时数为空");
					return false;
				}
				$("#promotionLong").val($("#promotion2Day").val());
				
			}else{
				
				if($("#promotion3Start").val() == ""){
					alert("申请开始时间为空");
					return false;
				}
				
				$("#promotionTime").val($("#promotion3Start").val());
				
				if($("#promotion3Hour").val() == ""){
					alert("限时购持续小时数为空");
					return false;
				}
				$("#promotionLong").val($("#promotion3Hour").val());
			}
		}
		$("#price_popup").css('display','none'); 
	}

function getBrandList(){
	var shopId= $("#shopId").val();
	
	if("" == shopId || "nextPage" == shopId || "prePage" == shopId){
		return false;
	}
    $.ajax({
        type: "POST",
        url: ctx+"/designer/getBrandList",
        data: {shopId:shopId},
        dataType: "json",
        success: function(data){
 			var html= "<option value=\"\">请选择--</option>";
 			var len = data.list.length;
 			for(var i=0;i<len;i++){
 				 html= html+ "<option value=\""+data.list[i].shopBrandId+"\">"+data.list[i].name +"</option>";
 			}
 			$("#shopBrandId").html(html);
        }        
    });
    
}

function nextPage(){
	
	var nextPage= $("#nextPage").val();
	
	$.ajax({
        type: "POST",
        url: ctx+"/good/getShopList",
        data: {nextPage:nextPage},
        dataType: "json",
        success: function(data){
    		$("#pages").val(data.pages);
    		$("#nextPage").val(data.nextPage);
    		$("#pageNum").val(data.pageNum);
    		var html= "";
    		if(data.pageNum == 0){
    			html= "<option value=\"\">请选择--</option>";
    		}else{
    			html= "<option value=\"prePage\" onclick=\"prePage()\">上一页</option>";
    		}
 			
 			var len = data.shopList.length;
 			for(var i=0;i<len;i++){
 				 html= html+ "<option value=\""+data.shopList[i].shopId+"\">"+data.shopList[i].name +"</option>";
 			}
 			
 			if(data.pageNum+1 < data.pages){
    			html = html+ "<option value=\"nextPage\" onclick=\"nextPage()\">下一页</option>";
    		}
 			$("#shopId").html(html);
        }        
    });
}

function prePage(){
var nextPage= $("#pageNum").val();
$.ajax({
    type: "POST",
    url: ctx+"/good/getShopList",
    data: {nextPage:nextPage-1},
    dataType: "json",
    success: function(data){
		$("#pages").val(data.pages);
		$("#nextPage").val(data.nextPage);
		$("#pageNum").val(data.pageNum);
		var html= "";
		if(data.pageNum == 0){
			html= "<option value=\"\">请选择--</option>";
		}else{
			html= "<option value=\"prePage\" onclick=\"prePage()\">上一页</option>";
		}
			
			var len = data.shopList.length;
			for(var i=0;i<len;i++){
				 html= html+ "<option value=\""+data.shopList[i].shopId+"\">"+data.shopList[i].name +"</option>";
			}
			
			if(data.pageNum+1 < data.pages){
			html = html+ "<option value=\"nextPage\" onclick=\"nextPage()\">下一页</option>";
		}
			$("#shopId").html(html);
    }        
});
}

function getBrandDesignerList(){
	var shopBrandId= $("#shopBrandId").val();
    $.ajax({
        type: "POST",
        url: ctx+"/goods/getShopBrandDesignerList",
        data: {shopBrandId:shopBrandId},
        dataType: "json",
        success: function(data){
 			var html= "<option value=\"\">请选择--</option>";
 			var len = data.list.length;
 			for(var i=0;i<len;i++){
 				 html= html+ "<option value=\""+data.list[i].shopBrandDesignerId+"\">"+data.list[i].name +"</option>";
 			}
 			$("#shopBrandDesignerId").html(html);
        }        
    });
	
}

function getTwoType(){
	var oneId= $("#shopGoodsSortsIdOne").val();
    $.ajax({
        type: "POST",
        url: ctx+"/goods/getTwoType",
        data: {id:oneId},
        dataType: "json",
        success: function(data){
 			var html= "<option value=\"\">请选择--</option>";
 			var len = data.list.length;
 			for(var i=0;i<len;i++){
 				 html= html+ "<option value=\""+data.list[i].shopGoodsSortsId+"\">"+data.list[i].name +"</option>";
 			}
 			$("#shopGoodsSortsId").html(html);
        }        
    });
	
}

function bodyAdd(obj,obj1){
	var before = obj.innerHTML;
	var idLen = $(obj).children().length + 2;
	var oneInput;
	if(obj1==1){
		oneInput ="<div class=\"floatLeft textCenter commodity_specifications_div\"><input type=\"text\" class=\"inputText width55\" name=\"svaluediv1\" id='AA_"+ idLen+"' style=\"margin-top: 15px;\"/></div>";
	}else if(obj1 ==2 ){
		oneInput ="<div class=\"floatLeft textCenter commodity_specifications_div\"><input type=\"text\" class=\"inputText width55\" name=\"svaluediv2\" id='BB_"+idLen +"' style=\"margin-top: 15px;\"/></div>";
	}else if(obj1 ==3 ){
		oneInput ="<div class=\"floatLeft textCenter commodity_specifications_div\"><input type=\"text\" class=\"inputText width55\" name=\"svaluediv3\" id='CC_"+ idLen +"' style=\"margin-top: 15px;\"/></div>";
	}else{
		oneInput ="<div class=\"floatLeft textCenter commodity_specifications_div\"><input type=\"text\" class=\"inputText width55\" name=\"svaluediv4\" id='DD_"+ idLen +"' style=\"margin-top: 15px;\"/></div>";
	}
	obj.innerHTML=before+oneInput;
}

var countDiv=1 ;

function AddTxt(obj){
	var inputTitle ="D"+countDiv ;
	var before = $(obj).parent().parent().html();
	
	var addDiv=" <div class=\"widthHeight overflowHidden\"><div class=\"floatLeft fontColor commodity_attribute_div\"><p><input type=\"text\" class=\"inputText\"  name =\"details\" style=\"width: 70px;\" id=\""+inputTitle+"\"/></p><input type=\"text\" class=\"inputText\" id=\""+inputTitle+"_details\"/></div><div class=\"floatLeft fontColor commodity_attribute_div\"><p onclick=\"AddTxt(this)\">添加</p><p onclick=\"delDetailTxt(this)\">删除</p></div></div>";

	$(obj).parent().parent().html(before+addDiv);
	
	countDiv++;
}

function buildGroup(){
	var aaArr = new Array();
	if($.trim($("#stitle1").val()) !=""){
		$("input[name='svaluediv1']").each(function (index, domEle) {
			  if($.trim($(this).val()) !=""){
				  aaArr.push($(this).attr("id"));
			  }
	    })
	}
	var bbArr = new Array();
	if($.trim($("#stitle2").val()) !=""){
		$("input[name='svaluediv2']").each(function (index, domEle) {
			  if($.trim($(this).val()) !=""){
				  bbArr.push($(this).attr("id"));
			  }
	    })
	}
	var ccArr = new Array();
	if($.trim($("#stitle3").val()) !=""){
		$("input[name='svaluediv3']").each(function (index, domEle) {
			  if($.trim($(this).val()) !=""){
				  ccArr.push($(this).attr("id"));
			  }
	    })
	}
	var ddArr = new Array();
	if($.trim($("#stitle4").val()) !=""){
		$("input[name='svaluediv4']").each(function (index, domEle) {
			  if($.trim($(this).val()) !=""){
				  ddArr.push($(this).attr("id"));
			  }
	    })
	}
	
	//构建组合列表
	var groupIds = new Array();
	$.each(aaArr, function(i, n){
		var tempId1 = n;
		if(bbArr.length==0){
			groupIds.push(tempId1);
		}else{
			$.each(bbArr, function(j, m){
				var tempId2 = tempId1 + "-" + m;
				if(ccArr.length==0){
					groupIds.push(tempId2);
				}else{
					$.each(ccArr, function(k, o){
						var temId3 = tempId2 + "-" + o;
						if(ddArr.length==0){
							groupIds.push(temId3);
						}else{
							$.each(ddArr, function(h, r){
								groupIds.push(temId3 + "-"+ r);
						     });
						}							
				     });
				}
		     });
		}
     });
	
	
	var groupLen = groupIds.length;
	
	var html = "";
	for(var i=0; i < groupLen;i++){
		 var groupId = groupIds[i];
		 var ids = groupId.split("-");
		 var name = "";
		 $.each(ids, function(key, val) {
			 if(name == ""){
				 name = $("#" + val).val() ;
			 }else{
				 name += "-" + $("#" + val).val();
			 }
		 });
		 
		// var name = $("#" + ids[0]).val() + "-" + $("#" + ids[1]).val() + "-" + $("#" + ids[2]).val() +  "-" + $("#" + ids[3]).val();
		 
		 
		 
		 html += "<div class=\"overflowHidden selected_div\" id='"+ groupId+"' name=\"group_ids\" >";
		 html += "<div class=\"floatLeft textCenter commodity_specifications_div\">";
		 html += "<p class=\"fontColor fontSize14\">组合名称</p>";
		 html += "<input type=\"text\" value='"+ name +"' pname='"+name+"' id='" +groupId+ "_name' class=\"inputText\"/>";
		 html += "</div>";
		 html += "<div class=\"floatLeft textCenter commodity_specifications_div\">";
		 html += "<p class=\"fontColor fontSize14\"><span class=\"floatNone colorRed margin0\">*</span>出售价格(元)</p>";
		 html += " <input type=\"text\" class=\"inputText width74\"/ id='"+groupId+"_priceFen'>";
		 html += "</div>";
		 html += "<div class=\"floatLeft textCenter commodity_specifications_div\">"
		 html += "<p class=\"fontColor fontSize14\">原价(元)</p>"
		 html += "<input type=\"text\" class=\"inputText width74\" id=\""+groupId+"_price\"/>"
		 html += "</div>"
		 html += "<div class=\"floatLeft textCenter commodity_specifications_div\">"
		 html += "<p class=\"fontColor fontSize14\"><span class=\"floatNone colorRed margin0\">*</span>数量</p>"
		 html += "<input type=\"text\" class=\"inputText width74\" id='"+groupId+"_stock'/>"
		 html += "</div>"
		 html += "<div class=\"floatLeft textCenter commodity_specifications_div\">"
		 html += "<p class=\"fontColor fontSize14\">商家编码</p>"
		 html += "<input type=\"text\" class=\"inputText width74\"/>"
		 html += "</div></div>"
	 }
	$("#goodsGroups").html(html);
}

function buttonTitle(obj){
    
/* 	var id="div"+obj;
	$(id).attr("display","block");  */
	obj.style.display="block";
	
}
$(document).ready(function(){
	$("#menu_4").addClass("li_active");
	$("#menuT_1").text("商品管理");
	$("#menuT_2").text("商品添加");
});

function submitCommidity(){
	
	/*  var parametersList="";
	 var 
	 $("input[name='details']").each(function () {
	               var eachDetails="";
	 			  if($.trim($(this).val()) !=""){
	 				  //aaArr.push($(this).attr("id"));
	 				  var id = $(this).attr("id")+"_details";
	 				  if($("#"+id ).val()!=""){
	 				    eachDetails = $(this).val()+":"+$("#"+id).val();
	 				  }
	 			  }
	 			  parametersList = parametersList +eachDetails;
	 });
	alert(parametersList);
	return false; */
	
	var jsonArr = new Array();
    $("div[name=group_ids]").each(function(){
		var gid = $(this).attr("id");
		var stock = $("#" + gid + "_stock").val();
		var priceFen = $("#" + gid +"_priceFen" ).val();
		var price = $("#" + gid +"_price" ).val();
		var pname = $("#" + gid +"_name" ).attr("pname");
		/* var jo = { priceFen:priceFen ,price:"", stock:stock,code:"",group:pname}; */
		var jo = { priceFen:priceFen ,price:price, stock:stock,group:pname};
		jsonArr.push(jo);
	})
	var parametersList ="";
	
	$("#parametersList").val(parametersList);
	 
	 $("input[name='details']").each(function () {
	               var eachDetails="";
	 			  if($.trim($(this).val()) !=""){
	 				  //aaArr.push($(this).attr("id"));
	 				  var id = $(this).attr("id")+"_details";
	 				  if($("#"+id ).val()!=""){
	 				    eachDetails = $(this).val()+":"+$("#"+id).val()+"|";
	 				  }
	 			  }
	 			  parametersList = parametersList +eachDetails;
	 });
	$("#parametersList").val(parametersList);
	 
	var goodsSkuSpecs = "";
	
	if($("#stitle1").val() !=""){
		var a = $("input[name='svaluediv1']");
		if(a.length>=0){
			goodsSkuSpecs =goodsSkuSpecs+ $("#stitle1").val()+":";
			for(var i=0;i<a.length;i++){
				goodsSkuSpecs= goodsSkuSpecs + a[i].value+",";
			}
			goodsSkuSpecs= goodsSkuSpecs + "|";
		}
	}
	
	if($("#stitle2").val() !=""){
		var a = $("input[name='svaluediv2']");
		if(a.length>=0){
			goodsSkuSpecs =goodsSkuSpecs+ $("#stitle2").val()+":";
			for(var i=0;i<a.length;i++){
				goodsSkuSpecs= goodsSkuSpecs + a[i].value+",";
			}
			goodsSkuSpecs= goodsSkuSpecs + "|";
		}
	}
	if($("#stitle3").val() !=""){
		var a = $("input[name='svaluediv3']");
		if(a.length>=0){
			goodsSkuSpecs =goodsSkuSpecs+ $("#stitle3").val()+":";
			for(var i=0;i<a.length;i++){
				goodsSkuSpecs= goodsSkuSpecs + a[i].value+",";
			}
			goodsSkuSpecs= goodsSkuSpecs + "|";
		}
	}
	
	if($("#stitle4").val() !=""){
		var a = $("input[name='svaluediv4']");
		if(a.length>=0){
			goodsSkuSpecs =goodsSkuSpecs+ $("#stitle4").val()+":";
			for(var i=0;i<a.length;i++){
				goodsSkuSpecs= goodsSkuSpecs + a[i].value+",";
			}
		}
	}
	
	$("#goodsSkuSpecs").val(goodsSkuSpecs);
	$("#goodsGroupsParams").val(JSON.stringify(jsonArr));
	
	
	
	if($("#shopId").val() ==""|| "nextPage" == $("#shopId").val() || "prePage" == $("#shopId").val()){
		alert("店铺名称不能为空");
		return false;
	}

	if($("#name").val() ==""){
		alert("商品名不能为空");
		return false;
	}

	if($("#about").val() ==""){
		alert("简述不能为空");
		return false;
	}
	if($("#priceFen").val() ==""){
		alert("显示现价不能为空");
		return false;
	}
	if($("#priceOriginalHigh").val() ==""){
		alert("原价最高不能为空");
		return false;
	}
	if($("#priceOriginalLow").val() ==""){
		alert("原价最低不能为空");
		return false;
	}
	if($("#stock").val() ==""){
		alert("库存不能为空");
		return false;
	}
	if($("#shopGoodsSortsId").val() ==""){
		alert("分类不能为空");
		return false;
	}
	if($("#shopBrandId").val() ==""){
		alert("品牌不能为空");
		return false;
	}
	
	if($("#homeImg").val() ==""){
		alert("商品首页图片不能为空，请上传");
		return false;
	}
	if($("#commodityPhoto0").val() =="" || $("#commodityPhoto2").val() ==""){
		alert("详情图片二张以上，请上传");
		return false;
	}
	if($("#commodityPhoto3").val() ==""){
		$('#commodityPhoto3').attr("disabled","disabled");
	}
	if($("#commodityPhoto4").val() ==""){
		$('#commodityPhoto4').attr("disabled","disabled");
	}
	
	var str1="";
	$('input[name="returnedType1"]:checked').each(function(){ 
		str1 += $(this).val(); 
	});
	
	
	
	$("#shopGoodsMailingId").val($("input[name='shopGoodsMailingId1'][checked]").val()); 
	$("#returnedType").val(str1); 
	$("#shopGoodsMailingId").val($("input[name='shopGoodsMailingId1'][checked]").val()); 
	$("#promotionType").val($("input[name='promotionType1'][checked]").val());;
	if($("input[name='promotionType1'][checked]").val() != "1"){
		
		if($("input[name='returnedType2'][checked]").val() ==""){
			alert("请选择促销类型");
			return false;
		}else{
			if($("input[name='returnedType2'][checked]").val() =="2"){
				if($("#promotion1End").val() == ""){
				   alert("预售结束时间为空");
				   return false;
				}
				$("#promotionTime").val($("#promotion1End").val());
				if($("#promotion1Day").val() == ""){
					alert("预售结束的天数为空");
					return false;
				}
				$("#promotionLong").val($("#promotion1Day").val());
				
				
			}else if($("input[name='returnedType2'][checked]").val() =="3"){
				
				if($("#promotion2Day").val() == ""){
					alert("限时购持续时间小时数为空");
					return false;
				}
				$("#promotionLong").val($("#promotion2Day").val());
				
			}else{
				
				if($("#promotion3Start").val() == ""){
					alert("申请开始时间为空");
					return false;
				}
				
				$("#promotionTime").val($("#promotion3Start").val());
				
				if($("#promotion3Hour").val() == ""){
					alert("限时购持续小时数为空");
					return false;
				}
				$("#promotionLong").val($("#promotion3Hour").val());
			}
		
	   }
	}
	$("#commondityAddBtn").removeAttr("onclick");
	$("#commondityForm").ajaxSubmit({
		type : 'post',
		url : ctx + "/goods/save",
		success : function(responseText, statusText) {
			if(responseText==1){
				alert("商品添加成功！");
				location.href='${ctx}/commodity_list';
			}else{
				alert("商品添加失败！");
				$("#commondityAddBtn").attr("onclick","submitCommidity()");
			}
		},
		error : function() {
			alert('操作失败!');
			$("#commondityAddBtn").attr("onclick","submitCommidity()");
		}
	});
	
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

function onclicktest(){
	alert(1);
}

</script>
</html>