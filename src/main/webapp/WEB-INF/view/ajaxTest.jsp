<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ajaxTestPage</title>
<script type="text/javascript" src="./js/jquery-1.11.0.min.js" ></script>
<script type="text/javascript">
function testAjax()
{
	var rep=$.ajax({
		type: "POST",
		url: "./user/ajaxTest",
		data: { name: "王五", password: "Boston" }
		});
	
	rep.done(function( data ){
		alert( "Data Saved: " + data.msg );
		});
	
	rep.fail(function( jqXHR, textStatus ) {
		alert( "Request failed: " + textStatus );
	});
}
</script>
</head>
<body>
<h3>AJAX Test</h3>
<input type="button" value="testAjax" onclick="testAjax()"/>
</body>
</html>
