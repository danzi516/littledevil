package cn.com.hd.common.web.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import cn.com.hd.common.CommonTools;
import cn.com.hd.common.FileUploadResp;
import cn.com.hd.common.InitData;
import cn.com.hd.common.SysConstants;

/**
 * Servlet implementation class FileUploadServlet
 */
@WebServlet(name = "PhotoUploadServlet", urlPatterns = {"/upload"})
@MultipartConfig(location = "/")
public class PhotoUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    /**
     * 文件上传
     */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/**
		 * 设置编码格式
		 */
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		//获取上传文件
		Part part = request.getPart("file");
		final String tempDir = request.getParameter("folder");
		//获取文件夹名
		String folder = request.getParameter("folder");
		
		//获取文件名
		String header = part.getHeader("content-disposition");
	    String fileName = new String(header.substring(header.lastIndexOf("=") + 2, header.length() - 1).getBytes("ISO-8859-1"),"UTF-8");
	 		
	    //重命名
		String savedFileName = CommonTools.getNewFileName(fileName.toLowerCase());
		
		//获取图片大小
		long fileSize = part.getSize();  
		
		//设置图片存放路径
		Calendar cal=Calendar.getInstance();//使用日历类
		int year=cal.get(Calendar.YEAR);//得到年
		int month=cal.get(Calendar.MONTH)+1;//得到月
		int day=cal.get(Calendar.DAY_OF_MONTH);//得到天
		
		String workPath = InitData.getWorkPath().replace("\\", "/");
		String today = CommonTools.getCurrentDay();
		String tempSavePath = workPath + SysConstants.File_UPLOAD_PATH + (folder != null && !"".equals(folder) ? folder + "/" : "") +"tempDir/"+today+"/" + tempDir + "/";
		
		File dir = new File(tempSavePath);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		
		/**
		 * 临时文件名
		 */
		String tempFilePath = tempSavePath + savedFileName;
		/**
		 * 文件写入
		 */
		part.write(tempFilePath);
		
		/**
		 * 返回页面显示图片路径
		 */
		String bastPath = SysConstants.File_UPLOAD_PATH
				+ (folder != null && !"".equals(folder) ? folder + "/" : "")
				+ year+"/" + month + "/"+ day + "/" + savedFileName;

		String tempShowPath = SysConstants.File_UPLOAD_PATH + (folder != null && !"".equals(folder) ? folder + "/" : "") +"tempDir/"+today+"/" + tempDir + "/"+ savedFileName;
		
		/**
		 * 返回json格、格式
		 */
		PrintWriter out =  response.getWriter();
		out.write(CommonTools.getObjectType2Json(new FileUploadResp(bastPath, String.valueOf(fileSize), fileName, tempFilePath,tempShowPath)));
		out.flush();
		out.close();
		
	}
	

}

