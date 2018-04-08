<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 面包屑 -->
<div class="widthHeight crumbs_div">
	<p class="crumbs_marginLeft" id="menuT_1">店铺管理</p>
	<span>-</span>
	<p id="menuT_2">店铺列表</p>
</div>
<!-- 左侧菜单 -->
<div class="leftMenu">
	<div class="leftMenu_loge">LOGE</div>
	<div class="widthHeight leftMenu_directory_div">
		<div class="widthHeight overflowHidden leftMenu_directoryTitle_div">
			<p class="floatLeft fontColor" >店铺管理</p>
			<img src="static/images/leftMenu_right_ico.png" class="floatRight">
		</div>
		<ul class="widthHeight leftMenu_directoryCon_ul"  style="display: block;">
			<!-- <li>店铺审核</li> -->
			<li onclick="location.href='${ctx}/store_list'"  id="menu_1">店铺列表</li>
			<li id="menu_2" onclick="location.href='${ctx}/brand_list'" >品牌管理</li>
			<li id="menu_3" onclick="location.href='${ctx}/designer_list'">设计师管理</li>
		</ul>
	</div>
	<div class="widthHeight leftMenu_directory_div">
		<div class="widthHeight overflowHidden leftMenu_directoryTitle_div">
			<p class="floatLeft fontColor">商品管理</p>
			<img src="static/images/leftMenu_right_ico.png" class="floatRight">
		</div>
		<ul class="widthHeight leftMenu_directoryCon_ul" style="display: block;">
			 <li onclick="location.href='${ctx}/commodity_list'" id="menu_4">商品列表</li>
			<!-- <li>出售中的商品</li>
			<li>仓库中的商品</li>
			<li>历史商品</li> -->
		</ul>
	</div>
	<div class="widthHeight leftMenu_directory_div">
		<div class="widthHeight overflowHidden leftMenu_directoryTitle_div">
			<p class="floatLeft fontColor">运营管理</p>
			<img src="static/images/leftMenu_right_ico.png" class="floatRight">
		</div>
		<ul class="widthHeight leftMenu_directoryCon_ul"  style="display: block;">
			<li id="menu_5" onclick="location.href='${ctx}/special_list'">专题</li>
		</ul>
	</div>
	<div class="widthHeight leftMenu_directory_div">
		<div class="widthHeight overflowHidden leftMenu_directoryTitle_div">
			<p class="floatLeft fontColor">圈&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;子</p>
			<img src="static/images/leftMenu_right_ico.png" class="floatRight">
		</div>
		<ul class="widthHeight leftMenu_directoryCon_ul"  style="display: block;">
			<li id="menu_6" onclick="location.href='${ctx}/circle_list'">圈子</li>
		</ul>
	</div>
</div>