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
    
     <style type="text/css">
     .special_choice_imgDiv_remove{
	    width: 100%;
	    height: auto;
	    min-height: 185px;
	    border:2px double #FF0000
     }
     #btnSelect{
    	 margin :0  0 0 25px;
         float : left;
     }
     .pageTurning_div p{
          cursor:default;
     }
    </style>
</head>
<body>
<div class="con" style="width: 100%;height: 90%;" >
    <!-- 右侧内容 -->
    <div class="rightCon"  style="width: 100%;height: 100%;" > 
        <div class="rightCon_conDiv specialList_div paddingBottom50">
            <div class="widthHeight search_div">
            <!--  
                <div class="search_condition_div">
                    <select>
                        <option selected>商品</option>
                        <option>商品1</option>
                        <option>商品2</option>
                    </select>
                    <input type="text" class="inputText"/>
                </div>
                <div class="search_condition_div">
                    <select>
                        <option selected>男装</option>
                        <option>男装1</option>
                        <option>男装2</option>
                    </select>
                    <select style="border: 0;">
                        <option selected>女装</option>
                        <option>女装1</option>
                        <option>女装2</option>
                    </select>
                </div>
                <div class="search_condition_div">
                    <input type="text" class="search_condition_inputMore" value="价格" disabled="disabled" style="border-right: 1px solid #A3A6A7;"/>
                    <input type="text" class="search_condition_inputMore" placeholder="0"/>
                    <span>~</span>
                    <input type="text" class="search_condition_inputMore" placeholder="0"/>
                </div>
                <input type="button" value="清空条件" class="inputButton"/>
                <input type="button" value="搜索" class="inputButton"/>
                -->
                <!--  <input type="button" value="清空条件" class="inputButton"/>
                <input type="button" value="搜索" class="inputButton"/>-->
                <input type="button" value="选择" class="inputButton" id="btnSelect"/>
            </div>
            <!-- 商品 -->
              <div class="widthHeight overflowHidden special_choice_div" id="shopList_1">
                <c:forEach var="goods" items="${goodsListOne}" varStatus="status">
	              	<div class="floatLeft special_choice_option">
	                    <div class="special_choice_imgDiv">
	                  		<img alt="${goods.name}" title="${goods.name}" goodsId="${goods.shopGoodsId }" src="${imgUrl}${goods.homeImg}" style="height:190px;width:205px;  ">
	                    </div>
	                    <p>${goods.name}</p>
	                    <p>￥${goods.priceFen}</p>
	               	</div>
		         </c:forEach>
	          </div>
              <div class="widthHeight overflowHidden special_choice_div" id="shopList_2">
                <c:forEach var="goods" items="${goodsListTwo}" varStatus="status">
              	<div class="floatLeft special_choice_option">
                    <div class="special_choice_imgDiv">
                  		<img alt="${goods.name}" title="${goods.name}" goodsId="${goods.shopGoodsId }" src="${imgUrl}${goods.homeImg}" style="height:190px;width:205px;  ">
                    </div>
                    <p>${goods.name}</p>
                    <p>￥${goods.priceFen}</p>
               	</div>
               	 </c:forEach>
             </div>
            <div class="widthHeight textRight pageTurning_div paddingBottom50">
	           <c:if test="${pageList.total ==0}">
	                <p>抱歉，当前没有查询到记录！</p>
	            </c:if>
	              <c:if test="${pageList.total > 0}">
	             	<p>共<span>${pageList.total}</span>条记录</p>
	                <p>当前第<span>${pageList.pageNum}</span>页</p>
	                <p>共<span>${pageList.pages }</span>页</p>
	                <p class="pageTurning_btn" onclick='goPage(1)'>首页</p>
	                <p class="pageTurning_btn" onclick='goPage(${pageList.pageNum-1})'>上一页</p>
	                <p class="pageTurning_btn" onclick='goPage(${pageList.pageNum+1})'>下一页</p>
	                <p class="pageTurning_btn" onclick='goPage(${pageList.pages })'>末页</p>
	                <span class="fontColor">转到:</span>
	                <input type="text" class="pageTurning_text" value="" id="turnPage" />
	                <p class="pageTurning_btn" onclick='goPage($("#turnPage").val(),1)'>GO</p>
	             </c:if>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
var ctx = "${ctx}";
var totalPageNum = ${pageList.pages};
var currentPageNum = ${pageList.pageNum};
function goPage(pageNum,flag){
	if($.trim(pageNum)=="" && flag==1){
		alert("转向页面不能为空");
	}else if(currentPageNum == pageNum){
		console.log("--------已经是当前页面--------");
	}else if(pageNum == 0){
		alert("当前是第一页");
	}else if(pageNum > totalPageNum){
		if(flag != 1){
			alert("已经是最后一页了！");
		}else{
			alert("输入文字不能超过" + totalPageNum + "页");
		}
	}else{
		location.href = ctx + "/special_choice_page?pageNum=" + pageNum;
	}
	return;
}
var pfIndex = parent.layer.getFrameIndex(window.name); //获取窗口索引
$(function(){
	$("#shopList_1 ,#shopList_2").find("div[class=special_choice_imgDiv]").click(function(){
	    $(this).toggleClass("special_choice_imgDiv_remove");
	})
	$("#btnSelect").click(function(){
		var html = "";
		$(".special_choice_imgDiv_remove").each(function(index,domEle){
			var img = $(domEle).children();
			var imgSrc = img.attr("src");
			var goodsId = img.attr("goodsId");
			var goodsName =  $(domEle).next().text();
			var goodsPrice = $(domEle).next().next().text();
			html += "<div>"
		    html += "<img src='"+imgSrc+"' name=\"detailGoods\" style=\"width: 100px; margin: 20px 0px 0px; height: 90px;\" />";
		    html += "<span style=\"margin-left: 20px;\">"+goodsName+"</span>";
		    html += "<span style=\"margin-left: 20px;\">"+goodsPrice+"</span>";
		    html +="</div>"
		})
		parent.editor.appendHtml(html);
		parent.layer.close(pfIndex);
	})
})
/* $(function(){
	$("#shopList_1 ,#shopList_2").find("div[class=special_choice_imgDiv]").click(function(){
	    $(this).toggleClass("special_choice_imgDiv_remove");
	})
	$("#btnSelect").click(function(){
		var html = "";
		$(".special_choice_imgDiv_remove").each(function(index,domEle){
			var img = $(domEle).children();
			var imgSrc = img.attr("src");
			var goodsId = img.attr("goodsId");
			var goodsName =  $(domEle).next().text();
			var goodsPrice = $(domEle).next().next().text();
			html += "<div name=\"txtImgDiv\" flag='2' id='div_"+ goodsId+"'>";
		    html += "<img src='"+imgSrc+"' name=\"detailGoods\" style=\"width: 100px; margin: 20px 0px 0px; height: 90px;\" />";
		    html += "<span style=\"margin-left: 20px;\">"+goodsName+"</span>";
		    html += "<span style=\"margin-left: 20px;\">"+goodsPrice+"</span>";
		    html += "<span onClick=\"delDetailGoods(this)\" style=\"margin-left: 20px;\">删除</span>";
		    html += "</div>";
		})
		parent.$('#txtImgDetail').append(html);
		parent.layer.close(pfIndex);
	})
}) */
</script>
</html>