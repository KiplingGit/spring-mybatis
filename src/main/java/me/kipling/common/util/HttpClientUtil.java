package me.kipling.common.util;

import java.nio.charset.Charset;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

import javax.net.ssl.SSLContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContextBuilder;
import org.apache.http.conn.ssl.TrustStrategy;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.http.HttpStatus;

import me.kipling.common.Constants;

/**
 * Http请求安全证书工具类
 * 
 * @author Kipling
 *
 */
public class HttpClientUtil {

	private static final Log log = LogFactory.getLog(HttpClientUtil.class);

	public static void main(String[] args) {

		String url = "https://app.jtxxshopping.com/jtxx_server_web/web/shop/inputShop/insert";
		String reqstr = "{\"mobilePhone\": \"18919627736\",\"shopAbout\": \"string\",\"shopAvatar\": \"string\",\"shopName\": \"string\",\"shopType\": 0}";
		System.out.println(post(url, reqstr));
	}

	public static String post(String requestUrl, String jsonStr) {
		String result = Constants.NONE_STR;
		HttpPost httppost = new HttpPost(requestUrl);
		if(log.isInfoEnabled()){
			log.info("HttpClientUtil method post params => " + jsonStr);
		}
		HttpEntity re = new StringEntity(jsonStr, Charset.forName("utf-8"));
		httppost.setHeader("Content-Type", "application/json");
		httppost.setEntity(re);
		try {
			CloseableHttpClient httpClient = createSSLInsecureClient();
			HttpResponse response = httpClient.execute(httppost);
			// 判断网络连接状态码是否正常(0--200都数正常)
			if (response.getStatusLine().getStatusCode() == HttpStatus.OK.value()) {
				result = EntityUtils.toString(response.getEntity(), "utf-8");
				log.info(result);
			}
		} catch (Exception e) {
			log.error("HttpClientUtil method post occured an error", e);
		}
		return result;
	}

	// client工具函数，信任对方（https）所有证书
	public static CloseableHttpClient createSSLInsecureClient() {
		try {
			// 创建安全套接字对象
			SSLContext sslContext = new SSLContextBuilder().loadTrustMaterial(null, new TrustStrategy() {
				// 信任所有
				public boolean isTrusted(X509Certificate[] chain, String authType) throws CertificateException {
					return true;
				}
			}).build();
			// 获取分层tls/ssl连接
			// SSLConnectionSocketFactory sslsf = new
			// SSLConnectionSocketFactory(sslContext);
			SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslContext, new String[] { "TLSv1.2" },
					null, null);
			return HttpClients.custom().setSSLSocketFactory(sslsf).build();
		} catch (KeyManagementException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (KeyStoreException e) {
			e.printStackTrace();
		}
		return HttpClients.createDefault();
	}

}
