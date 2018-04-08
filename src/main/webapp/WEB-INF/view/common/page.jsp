<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 翻页 -->
<div class="widthHeight textRight pageTurning_div">
	<c:if test="${pageInfo.total ==0}">
		<p>抱歉，当前没有查询到记录！</p>
	</c:if>
	<c:if test="${pageInfo.total > 0}">
		<p>
			共<span>${pageInfo.total}</span>条记录
		</p>
		<p>
			当前第<span>${pageInfo.pageNum}</span>页
		</p>
		<p>
			共<span>${pageInfo.pages }</span>页
		</p>
		<p class="pageTurning_btn" onclick='goPage(1)'>首页</p>
		<p class="pageTurning_btn" onclick='goPage(${pageInfo.pageNum-1})'>上一页</p>
		<p class="pageTurning_btn" onclick='goPage(${pageInfo.pageNum+1})'>下一页</p>
		<p class="pageTurning_btn" onclick='goPage(${pageInfo.pages })'>末页</p>
		<span class="fontColor">转到:</span>
		<input type="text" class="pageTurning_text" value="" id="turnPage" />
		<p class="pageTurning_btn" onclick='goPage($("#turnPage").val(),1)'>GO</p>
	</c:if>
</div>
<script type="text/javascript">
var totalPageNum = ${pageInfo.pages};
var currentPageNum = ${pageInfo.pageNum};
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
		location.href = ctx + pageUrl +"?pageNum=" + pageNum;
	}
	return;
}
</script>