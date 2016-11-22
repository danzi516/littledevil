package cn.com.hd.common.http;

import java.io.UnsupportedEncodingException;

import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.message.BasicHeader;

public class HttpGetReq extends AbstractHttpRequest{

	// 请求URL地址
	private String url;

	// 消息头设置
	private BasicHeader[] header;

	public HttpGetReq(String url) {
		this.url = url;
	}

	public HttpGetReq(String url, BasicHeader[] header) {
		this.url = url;
		this.header = header;
	}

	@Override
	public HttpRequestBase getHttpMethod() throws UnsupportedEncodingException {
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeaders(header);
		return httpGet;
	}

}
