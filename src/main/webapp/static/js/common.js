$(function(){
    /* 右侧菜单隐藏展示效果 */
    $(".leftMenu .leftMenu_directory_div").each(function(){
        $(this).children('.leftMenu_directoryTitle_div').click(function(){
            var ulState = $(this).next('ul').css('display');
            if(ulState == "none"){
                $(this).children('img').attr("src","static/images/leftMenu_down_ico.png");
                $(this).next().show();
            }else{
                $(this).children('img').attr("src","static/images/leftMenu_right_ico.png");
                $(this).next().hide();
            }
        });
    });

    /* 列表中的多选按钮 */
    $(".selected_img").each(function(){
        $(this).click(function(){
            var checkImg = $(this).attr('alt');
            if(checkImg == "unselected_ico"){
                $(this).attr('src',"static/images/selected_ico.png");
                $(this).attr('alt',"selected_ico");
            }else{
                $(this).attr('src',"static/images/unselected_ico.png");
                $(this).attr('alt',"unselected_ico");
            }
        });

    });
	
	/* 弹窗关闭效果效果 */
	$(".popup_div").each(function(){
		$(this).children('div').children('span.popup_close').click(function(){
			$(this).parent().parent().hide();
			 $("#price_popup input[type='text']").val("");
		});
	});
});