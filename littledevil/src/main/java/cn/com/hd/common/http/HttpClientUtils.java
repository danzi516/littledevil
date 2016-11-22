package cn.com.hd.common.http;

import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;

/**
 * 
 * @author fengcaizhi
 *
 */
public class HttpClientUtils {
	
	private static CloseableHttpClient httpclient;
	
	private static int POOL_MAX_TOTAL = 100;
	
	/**
	 * 实现httpClient单例，保证线程安全
	 * @return
	 */
	public static CloseableHttpClient getHttpClient(){
		if(httpclient == null){
			PoolingHttpClientConnectionManager cm = new PoolingHttpClientConnectionManager();
			cm.setMaxTotal(POOL_MAX_TOTAL);
			httpclient = HttpClients.custom().setConnectionManager(cm).build();
		}
		
		return httpclient;
	}
}
