package cn.com.hd.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class InitData extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * 定义日志
	 */
	private static Logger logger = LoggerFactory.getLogger(InitData.class);
	
	/**
	 * 单位毫秒
	 */
	private static final int TIME_STAMP_DIFFER = 3000;
    
	/**
	 * 工程绝对路径
	 */
	private static String workPath;
	
	/**
	 * 工程名
	 */
	private static String workName;
	
	/**
	 * 获取文件转化等路径
	 */
	private static Properties properties = new Properties();
	
	/**
	 * 获取文件转化等路径
	 */
	private static String configPath;
	
	/**
	 * tokenId
	 */
	private static String swiftTokenId;
	
	private ScheduledExecutorService service = Executors.newScheduledThreadPool(2);

	@Override
	public void init(ServletConfig config) throws ServletException {
		
		super.init(config);		
		
		ServletContext context=getServletContext();
		
		//获取得到工程觉得路径
		this.workPath =  context.getRealPath("/").replace("\\", "/");
		
		//获取工程名
		this.workName = context.getContextPath();
		
		String path = this.getClass().getClassLoader().getResource("").getPath();
		String filePath = config.getInitParameter("sysConfig");
		
		
		this.configPath=path;
		FileInputStream is = null;
		try {
			is = new FileInputStream(new File(path + filePath));
			
			//加载sys。properties 文件
			properties.load(is);
			
		} catch (FileNotFoundException e) {
			logger.error("文件未找到！" + e.toString());
			//e.printStackTrace();
		} catch (IOException e) {
			logger.error("文件读取失败！" + e.toString());
			//e.printStackTrace();
		} catch (Exception e) {
			logger.error("文件读取失败！" + e.toString());
			//e.printStackTrace();
		} finally{
			if(is != null){
				try {
					is.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					//e.printStackTrace();
				}
			}
		}
		
	}
	

	@Override
	public void destroy() {
		service.shutdown();
		super.destroy();
	}


	public static Properties getProperties() {
		return properties;
	}

	public static void setProperties(Properties properties) {
		InitData.properties = properties;
	}

	public static String getWorkPath() {
		return workPath;
	}
	
	public static String getWrokName(){
		return workName;
	}

	public static String getSwiftTokenId() {
		return swiftTokenId;
	}

	public static void setSwiftTokenId(String swiftTokenId) {
		InitData.swiftTokenId = swiftTokenId;
	}
	
	public static String getConfigPath() {
		return configPath;
	}
}
