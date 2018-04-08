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
        <div class="rightCon_conDiv">
            <div class="widthHeight search_div">
                <input type="text" class="inputText"/>
                <input type="button" value="搜索" class="inputButton"/>
              <!--   <input type="button" value="添加" class="inputButton" onclick="window.open('store_add.html')"/> -->
                <input type="button" value="添加" class="inputButton" onclick="location.href='${ctx}/store_add'"/>
            </div>

            <!-- 表格 -->
            <table class="list_table" cellspacing="0" cellpadding="0">
                <thead>
                    <tr>
                        <th>&nbsp;</th>
                        <th>申请人/法人</th>
                        <th>认证类型</th>
                        <th>店铺类型</th>
                        <th>经营品类</th>
                        <th>申请时间</th>
                        <th>审核时间</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><div class="head_portrait_div"></div></td>
                        <td>店铺名 ID:14321414321</td>
                        <td>个人店铺</td>
                        <td>品牌店铺</td>
                        <td>女装/男装/婴童</td>
                        <td>2017-3-4 12:34</td>
                        <td>2017-3-4 12:34</td>
                        <td><a href="#">查看详情</a></td>
                    </tr>
                </tbody>
            </table>

            <!-- 翻页 -->
            <div class="widthHeight textRight pageTurning_div">
                <p>共<span>1</span>条记录</p>
                <p>当前第<span>1</span>页</p>
                <p>共<span>1</span>页</p>
                <p class="pageTurning_btn">首页</p>
                <p class="pageTurning_btn">上一页</p>
                <p class="pageTurning_btn">下一页</p>
                <p class="pageTurning_btn">末页</p>
                <span class="fontColor">转到:</span>
                <input type="text" class="pageTurning_text" />
                <p class="pageTurning_btn">GO</p>
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
/* 		$("menu_01").click(); */
	});

</script>
</html>