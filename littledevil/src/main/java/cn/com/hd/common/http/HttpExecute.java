package cn.com.hd.common.http;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

public class HttpExecute extends HttpClientUtils {
	/**
	 * url地址
	 */
	private String url;

	public HttpExecute(String url) {
		this.url = url;
	}

	/**
	 * POST方式调用
	 * 
	 * @param url
	 * @param params
	 *            参数为NameValuePair键值对对象
	 * @return 响应字符串
	 * @throws IOException
	 * @throws ClientProtocolException
	 */
	public String executeByPOST(List<BasicNameValuePair> params)
			throws ClientProtocolException, IOException {
		CloseableHttpClient httpClient = getHttpClient();

		String returnContent = "";
		HttpPost httpPost = new HttpPost(url);

		/*
		 * List<BasicNameValuePair> nvps = new ArrayList<BasicNameValuePair>();
		 * nvps.add(new BasicNameValuePair("username", "myusername"));
		 * nvps.add(new BasicNameValuePair("password", "mypassword"));
		 */

		httpPost.setEntity(new UrlEncodedFormEntity(params));
		CloseableHttpResponse response = httpClient.execute(httpPost);

		try {
			returnContent = EntityUtils.toString(response.getEntity());
		} finally {
			response.close();
		}

		return returnContent;
	}

	/**
	 * Get方式请求
	 * 
	 * @param url
	 *            例：http://xxx/User/user/center.aspx?_action=GetSimpleUserInfo&
	 *            codes={0}&email={1}
	 * @param params
	 *            params 参数值数组，需要与url中占位符顺序对应
	 * @return 响应字符串
	 * @throws IOException
	 * @throws ClientProtocolException
	 */
	public String executeByGET() throws ClientProtocolException, IOException {
		CloseableHttpClient httpclient = getHttpClient();

		// String messages = MessageFormat.format(url, params);
		String returnBody = "";
		HttpGet httpget = new HttpGet(url);

		/*
		 * httpget.addHeader(new BasicHeader("", "")); httpget.addHeader("",
		 * "");
		 */

		CloseableHttpResponse response = httpclient.execute(httpget);
		try {

			// 返回内容
			HttpEntity entity = response.getEntity();
			returnBody = EntityUtils.toString(entity);
		} finally {
			response.close();
		}
		return returnBody;
	}

	/**
	 * 文件路径
	 * @param filePath
	 * @return
	 * @throws IOException
	 */
	public String executeFileByPost(String filePath, List<BasicNameValuePair> params) throws IOException {
		CloseableHttpClient httpclient = getHttpClient();

		String returnBody = "";
		HttpPost httppost = new HttpPost(url);

		FileBody bin = new FileBody(new File(filePath));

		HttpEntity reqEntity = MultipartEntityBuilder.create().addPart("file", bin).build();

		httppost.setEntity(reqEntity);
		//httpPost.setEntity(new UrlEncodedFormEntity(params));
		CloseableHttpResponse response = httpclient.execute(httppost);
		try {
			HttpEntity resEntity = response.getEntity();
			returnBody = EntityUtils.toString(resEntity);
		} finally {
			response.close();
		}
		return returnBody;
	}
	
	/**
	 * 文件流
	 * @param is
	 * @param obj
	 * @return
	 * @throws IOException
	 */
	public String executeFileByPost(InputStream is, List<BasicNameValuePair> params, Object obj) throws IOException {
		CloseableHttpClient httpclient = getHttpClient();

		String returnBody = "";
		HttpPost httpPost = new HttpPost(url);

		httpPost.setEntity(new UrlEncodedFormEntity(params, "UTF-8")); 
	      // ---begin解决中文乱码问题 
	    httpPost.addHeader("Content-Type","application/x-www-form-urlencoded"); 
	    httpPost.addHeader("Accept-Language", "zh-cn"); 
	    httpPost.addHeader("Accept-Encoding", "gzip, deflate"); 
	    httpPost.addHeader("Content-Type","text/html;charset=utf-8");
		
		
		HttpEntity reqEntity = MultipartEntityBuilder.create().addBinaryBody("file", is).build();

		httpPost.setEntity(reqEntity);

		CloseableHttpResponse response = httpclient.execute(httpPost);
		try {
			HttpEntity resEntity = response.getEntity();
			returnBody = EntityUtils.toString(resEntity);
		} finally {
			response.close();
		}
		return returnBody;
	}

	/**
	 * 通过流的形式读取信息
	 * 
	 * @param url
	 * @return
	 * @throws ClientProtocolException
	 * @throws IOException
	 */
	public String readStreamByGET() throws ClientProtocolException, IOException {
		CloseableHttpClient httpclient = getHttpClient();
		HttpGet httpget = new HttpGet(url);

		httpget.addHeader(new BasicHeader("", ""));
		httpget.addHeader("", "");

		CloseableHttpResponse response = httpclient.execute(httpget);
		try {
			System.out.println(response.getStatusLine());

			// Get hold of the response entity
			HttpEntity entity = response.getEntity();

			// If the response does not enclose an entity, there is no need
			// to bother about connection release

			// 返回内容
			// System.out.println(EntityUtils.toString(entity));

			if (entity != null) {
				InputStream instream = entity.getContent();
				try {
					instream.read();
					// do something useful with the response
				} catch (IOException ex) {
					// In case of an IOException the connection will be
					// released
					// back to the connection manager automatically
					throw ex;
				} finally {
					// Closing the input stream will trigger connection
					// release
					instream.close();
				}
			}
		} finally {
			response.close();
		}

		return "";
	}
}
