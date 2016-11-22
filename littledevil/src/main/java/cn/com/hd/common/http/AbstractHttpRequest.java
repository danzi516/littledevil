package cn.com.hd.common.http;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.message.BasicHeader;
import org.apache.http.util.EntityUtils;

/**
 * client抽象实现
 * @author fengcaizhi
 *
 */
public abstract class AbstractHttpRequest {

	private CloseableHttpClient httpClient;
	
	private Header header;
	
	public AbstractHttpRequest(){
		init();
	}
	
	//执行
	public String excute() throws IOException{
		
		String returnContent = "";
		
		CloseableHttpResponse response = null;
		try {
			
			HttpRequestBase httpExcute = this.getHttpMethod();
			httpExcute.addHeader(header);
			response = httpClient.execute(httpExcute);
			
			if (response.getStatusLine().getStatusCode() == 200){
				returnContent = EntityUtils.toString(response.getEntity());
				
				EntityUtils.consume(response.getEntity());
			}else{
				
			}
			
		} finally {
			if(response != null){
				response.close();
			}
		}
		
		return returnContent;
	}
	
	/**
	 * 处理文件流
	 * @param writeUrl
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public void excuteStream(String writeUrl) throws IllegalStateException, IOException{
		
		CloseableHttpResponse response = null;

		InputStream instream = null;
		try {
			
			HttpRequestBase httpExcute = this.getHttpMethod();
			httpExcute.addHeader(header);
			response = httpClient.execute(httpExcute);
			
			if (response.getStatusLine().getStatusCode() == 200){
				HttpEntity entity = response.getEntity();
				
				if (entity != null) {
					instream = entity.getContent();
					OutputStream os = new FileOutputStream(new File(writeUrl));
						
					byte[] bytes = new byte[1024];
					int count;
					while((count = instream.read(bytes)) != -1){
						os.write(bytes, 0, count);
					}
					os.flush();
				}
			}else{
				
			}
			
		
		} finally {
			if(instream != null){
				instream.close();
			}
			
			if(response != null){
				response.close();
			}
		}
	};
	
	public void init(){
		this.httpClient = HttpClientUtils.getHttpClient();
		//this.header = new BasicHeader("Content-Type", "text/html;charset=utf-8");
	}
	
	public abstract HttpRequestBase getHttpMethod() throws UnsupportedEncodingException;
	
}
