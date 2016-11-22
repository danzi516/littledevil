package cn.com.hd.common;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Page implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 总页数
	 */
	private int totalPage;

	/**
	 * 当前页
	 */
	private int page;

	/**
	 * 分页获得的数据
	 */
	private List data;

	/**
	 * 一页显示多少记录
	 */
	private int rows;

	/**
	 * 总记录数
	 */
	private int totalRecord;
	
	/**
	 * 其他的参数我们把它分装成一个Map对象  
	 */
	private Map<String, Object> params = new HashMap<String, Object>();

	public Page() {
		totalPage = 0;
		page = 1;
		rows = 20;
		totalRecord = 0;
	}
	
	public Page(int page, int rows){
		totalPage = 0;
		this.page = page;
		this.rows = rows;
		totalRecord = 0;
	}

	public List getData() {
		return data;
	}

	public void setData(List data) {
		this.data = data;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public Map<String, Object> getParams() {
		return params;
	}

	public void setParams(Map<String, Object> params) {
		this.params = params;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		int totalPage = totalRecord % rows == 0 ? totalRecord / rows
				: totalRecord / rows + 1;
		this.setTotalPage(totalPage);
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page < 1){
			page = 1;
		}
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	@Override
	public String toString() {
		return "Page [totalPage=" + totalPage + ", page=" + page + ", data="
				+ data + ", rows=" + rows + ", totalRecord=" + totalRecord
				+ ", params=" + params + "]";
	}

}
