package cn.com.hd.common;

import org.apache.commons.lang.builder.ToStringBuilder;

public class FileUploadResp {
	/**
	 * 结果：0 表示成功；1 表示失败
	 */
	private int result;

	/**
	 * 结果说明
	 */
	private String desc;

	/**
	 * 上传文件保存路径
	 */
	private String filePath;
	
	/**
	 * 文件大小
	 */
	private String fileSize;
	
	/**
	 * 原始文件名
	 */
	private String fileName;
	
	/**
	 * 临时目录
	 */
	private String tempDir;
	
	/**
	 * 临时回显路径
	 */
	private String tempShowDir;

	public FileUploadResp() {
	}

	public FileUploadResp(int result, String desc) {
		super();
		this.result = result;
		this.desc = desc;
	}

	public FileUploadResp(String filePath, String fileSize, String fileName) {
		super();
		this.result = 0;
		this.desc = "上传成功";
		this.filePath = filePath;
		this.fileSize = fileSize;
		this.fileName = fileName;
	}
	
	public FileUploadResp(String filePath, String fileSize, String fileName, String tempDir) {
		super();
		this.result = 0;
		this.desc = "上传成功";
		this.filePath = filePath;
		this.fileSize = fileSize;
		this.fileName = fileName;
		this.tempDir = tempDir;
	}


	public FileUploadResp(String filePath, String fileSize, String fileName,String tempDir, String tempShowDir) {
		super();
		this.result = 0;
		this.desc = "上传成功";
		this.filePath = filePath;
		this.fileSize = fileSize;
		this.fileName = fileName;
		this.tempDir = tempDir;
		this.tempShowDir = tempShowDir;
	}
	
	/**
	 * @return the fileName
	 */
	public String getFileName() {
		return fileName;
	}

	/**
	 * @param fileName the fileName to set
	 */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	/**
	 * @return the tempDir
	 */
	public String getTempDir() {
		return tempDir;
	}

	/**
	 * @param tempDir the tempDir to set
	 */
	public void setTempDir(String tempDir) {
		this.tempDir = tempDir;
	}
	
	public String getTempShowDir() {
		return tempShowDir;
	}

	public void setTempShowDir(String tempShowDir) {
		this.tempShowDir = tempShowDir;
	}
}
