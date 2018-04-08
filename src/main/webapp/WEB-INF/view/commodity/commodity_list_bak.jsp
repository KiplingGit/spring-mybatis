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
    左侧菜单
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
    </div> -->
    <%@ include file="../common/menu.jsp"%>
    <!-- 右侧内容 -->
    <div class="rightCon">
        <div class="rightCon_conDiv commodityList_div paddingBottom50">
            <div class="widthHeight search_div">
                <input type="text" class="inputText"/>
                <div class="search_condition_div">
                    <select>
                        <option selected>价格介于</option>
                        <option>价格介于1</option>
                        <option>价格介于2</option>
                    </select>
                    <input type="text" class="search_condition_inputMore"/>
                    <span>~</span>
                    <input type="text" class="search_condition_inputMore"/>
                </div>
                <div class="search_condition_div">
                    <select>
                        <option selected>分类</option>
                        <option>分类1</option>
                        <option>分类2</option>
                    </select>
                    <select style="border: 0;">
                        <option selected>全部分类</option>
                        <option>全部分类1</option>
                        <option>全部分类2</option>
                    </select>
                </div>
                <input type="button" value="清空条件" class="inputButton"/>
                <input type="button" value="搜索" class="inputButton"/>
                <!-- <input type="button" value="添加" class="inputButton" onclick="window.open('commodity_add.html')"/> -->
                <input type="button" value="添加" class="inputButton" onclick="location.href='${ctx}/commodity_add'"/>
            </div>

            <!-- 表格 -->
            <table class="list_table" cellspacing="0" cellpadding="0">
                <thead>
                    <tr>
                        <th>&nbsp;</th>
                        <th>商品名</th>
                        <th>售价（元）</th>
                        <th>库存</th>
                        <th>总售量</th>
                        <th>发布时间</th>
                        <th>结束时间</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><img src="static/images/unselected_ico.png" class="floatLeft selected_img" alt="unselected_ico"/><div class="floatLeft head_portrait_div"></div></td>
                        <td>商品名商品名商品名商品名</td>
                        <td>220.00</td>
                        <td>4</td>
                        <td>10</td>
                        <td>2017-3-4 12:34</td>
                        <td>2017-3-4 12:34</td>
                        <td class="commodity_operation"><a href="#">编辑商品</a><a href="#">复制链接</a><a href="#">查看二维码</a></td>
                    </tr>
                </tbody>
            </table>
            <div class="widthHeight listOperation_div">
                <img src="static/images/unselected_ico.png" class="floatLeft selected_img" alt="unselected_ico"/>
                <span class="fontColor">全选</span>
                <p>删除</p>
                <p>下架</p>
            </div>
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
<script type="text/javascript">
$(document).ready(function(){
	$("#menu_4").addClass("li_active");
	$("#menuT_1").text("商品管理");
	$("#menuT_2").text("商品列表");
});

</script>
</html>