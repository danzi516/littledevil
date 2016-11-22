package cn.com.hd.common;

import java.util.List;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.thoughtworks.xstream.annotations.XStreamAlias;


@XStreamAlias("response")
@JsonSerialize(include=JsonSerialize.Inclusion.NON_NULL)
public class Response<T> {

	private String status;
	
	private List<T> data;

	/**
	 * error message
	 */
	private String message;
	
	private String total;
	
	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "HttpResponse [status=" + status + ", data=" + data
				+ ", message=" + message + "]";
	}

}
