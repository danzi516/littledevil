package cn.com.hd.common.http;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.Proxy;
import java.net.URL;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

public final class HttpClient {
	
	private static Logger logger = Logger.getLogger(HttpClient.class);
	
	private static String HTTP_POST = "POST";
	
	private static String HTTP_GET = "GET";
	
	private Integer connectTimeOut = 5000;
	
	private Integer readTimeOut = 5000;
	
	private HttpURLConnection conn;
	
	public HttpClient(String urlAddr) throws MalformedURLException {
		this(urlAddr, null);
	}
	
	public HttpClient(URL url) {
		this(url, null);
	}
	
	public HttpClient(String urlAddr, Proxy proxy) throws MalformedURLException {
		this(new URL(urlAddr), proxy);
	}
	
	public HttpClient(URL url, Proxy proxy) {
		if (url == null) {
			throw new IllegalArgumentException("url can not be null.");
		}
		try {
			if (proxy != null) {
				conn = (HttpURLConnection) url.openConnection(proxy);
			} else {
				conn = (HttpURLConnection) url.openConnection();
			}
			conn.setConnectTimeout(connectTimeOut);
			conn.setReadTimeout(readTimeOut);
		} catch(Exception ex) {
			logger.error(ex.getMessage());
			throw new RuntimeException(ex);
		}
	}
	
	public String doGet() throws Exception {
		String result = null;
		ByteArrayOutputStream resultOut = new ByteArrayOutputStream();
		BufferedInputStream resultIn = null;
		try {
			conn.setRequestMethod(HTTP_GET);
			conn.connect();
			byte[] buff = new byte[10240];
			int len = -1;
			
			resultIn = new BufferedInputStream(conn.getInputStream());
			while ((len = resultIn.read(buff)) > 0) {
				resultOut.write(buff, 0, len);
			}
			resultOut.close();
			result = resultOut.toString("UTF-8");
		} finally {
			if (resultOut != null) resultOut.close();
			if (resultIn != null) resultIn.close();
		}
		
		return result;
	}
	
	public String doPost(byte[] contents) throws Exception {
		String result = null;
		BufferedOutputStream paramOut = null;
		ByteArrayInputStream paramIn = new ByteArrayInputStream(contents);
		ByteArrayOutputStream resultOut = new ByteArrayOutputStream();
		BufferedInputStream resultIn = null;
		try {
			conn.setRequestMethod(HTTP_POST);
			conn.setDoOutput(true);
			String contentType = conn.getRequestProperty("Content-Type");
			if (StringUtils.isEmpty(contentType)) {
				conn.setRequestProperty("Content-Type", "text/plain;charset=utf-8");
			}
			conn.setRequestProperty("Content-Length", String.valueOf(contents.length));
			conn.connect();
			byte[] buff = new byte[10240];
			int len = -1;
			paramOut = new BufferedOutputStream(conn.getOutputStream());
			while ((len = paramIn.read(buff)) > 0) {
				paramOut.write(buff, 0, len);
			}
			paramOut.close();
			
			resultIn = new BufferedInputStream(conn.getInputStream());
			while ((len = resultIn.read(buff)) > 0) {
				resultOut.write(buff, 0, len);
			}
			resultOut.close();
			result = resultOut.toString("UTF-8");
		} finally {
			if (paramOut != null) paramOut.close();
			if (paramIn != null) paramIn.close();
			if (resultOut != null) resultOut.close();
			if (resultIn != null) resultIn.close();
		}
		
		return result;
	}
	
	public String doPost(String content) throws Exception {
		byte[] contents = new byte[0];
		if (StringUtils.isNotEmpty(content)) {
			contents = content.getBytes("UTF-8");
		}
		return doPost(contents);
	}
	
	public String doPost(Map<String,String> requestParams) throws Exception {
		StringBuilder content = new StringBuilder();
		if (requestParams != null && !requestParams.isEmpty()) {
			Set<Entry<String,String>> entrySet = requestParams.entrySet();
			for (Entry<String,String> entry : entrySet) {
				content.append(entry.getKey()).append("=").append(entry.getValue()).append("&");
			}
			content.delete(content.length() - 1, content.length());
			logger.info("requestParams:" + content.toString());
		}
		return doPost(content.toString());
	}
	
	public void setRequestProperty(String key, String value) {
		conn.setRequestProperty(key, value);
	}

	public Integer getConnectTimeOut() {
		return connectTimeOut;
	}

	public void setConnectTimeOut(Integer connectTimeOut) {
		this.connectTimeOut = connectTimeOut;
	}

	public Integer getReadTimeOut() {
		return readTimeOut;
	}

	public void setReadTimeOut(Integer readTimeOut) {
		this.readTimeOut = readTimeOut;
	}

}
