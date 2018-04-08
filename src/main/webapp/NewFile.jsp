<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="https://sellpow-html.oss-cn-beijing.aliyuncs.com/public/js/aes.js"></script>  
<body>  
  
  
<script>  
  
    var key = CryptoJS.enc.Utf8.parse("8NONwyJtHesysWpM");  
  
    var plaintText = 'ABCDEFGH'; // 明文  
  
    var encryptedData = CryptoJS.AES.encrypt(plaintText, key, {  
        mode: CryptoJS.mode.ECB,  
        padding: CryptoJS.pad.Pkcs7  
    });  
  
    console.log("加密前："+plaintText);  
    console.log("加密后："+encryptedData);  
  
    encryptedData = encryptedData.ciphertext.toString();  
  
    var encryptedHexStr = CryptoJS.enc.Hex.parse(encryptedData);  
    var encryptedBase64Str = CryptoJS.enc.Base64.stringify(encryptedHexStr);  
  
    var decryptedData = CryptoJS.AES.decrypt(encryptedBase64Str, key, {  
        mode: CryptoJS.mode.ECB,  
        padding: CryptoJS.pad.Pkcs7  
    });  
  
    var decryptedStr = decryptedData.toString(CryptoJS.enc.Utf8);  
  
    console.log("解密后:"+decryptedStr);  
  
      
     var pwd = "PCsUFtgog9/qpqmqXsuCRQ==";  
    //加密服务端返回的数据  
    var decryptedData = CryptoJS.AES.decrypt(pwd, key, {  
        mode: CryptoJS.mode.ECB,  
        padding: CryptoJS.pad.Pkcs7  
    });  
      
    console.log("解密服务端返回的数据:"+decryptedStr);  
  
</script>  

</body>
</html>