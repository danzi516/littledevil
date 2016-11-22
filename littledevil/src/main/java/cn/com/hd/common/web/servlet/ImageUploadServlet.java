package cn.com.hd.common.web.servlet;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.imageio.ImageIO;
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
@WebServlet(name = "ImageUploadServlet", urlPatterns = {"/imgUpload"})
@MultipartConfig(location = "/")
public class ImageUploadServlet extends HttpServlet {
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
		//获取文件夹名
		String folder = request.getParameter("folder");
		
		//获取文件类型
		String fileType = request.getParameter("fileType");
		
//		//获取图片宽度
//		int newImageWidth = Integer.parseInt(request.getParameter("width") == null ? "0" : request.getParameter("width"));
//		//获取图片高度
//		int newImageHeight = Integer.parseInt(request.getParameter("height") == null ? "0" : request.getParameter("height"));
		//获取文件名
		String header = part.getHeader("content-disposition");
	    String fileName = new String(header.substring(header.lastIndexOf("=") + 2, header.length() - 1).getBytes("ISO-8859-1"),"UTF-8");
	    
	    // 获得文件后缀名
	 	final String fileSuffix = fileName.substring(fileName.lastIndexOf(".")+1,fileName.length());
	 		
	    //重命名
		String savedFileName = CommonTools.getNewFileName(fileName.toLowerCase());
		//获取图片大小
		long fileSize = part.getSize();  
		
		//设置图片存放路径
		Calendar cal=Calendar.getInstance();//使用日历类
		int year=cal.get(Calendar.YEAR);//得到年
		int month=cal.get(Calendar.MONTH)+1;//得到月
		int day=cal.get(Calendar.DAY_OF_MONTH);//得到天
		
		//定义文件存储目录
		String fileFolder = (folder != null && !"".equals(folder) ? folder + "/" : "default/") + year + "/" + month + "/" + day + "/";
		//真实文件存储路径
		String realSavePath = InitData.getWorkPath() + SysConstants.File_UPLOAD_PATH + fileFolder;
		
		File dir = new File(realSavePath);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		
		if("img".equals(fileType)){
			BufferedImage img = ImageIO.read(part.getInputStream());
			
			int width = img.getWidth();
			int height = img.getHeight();
			if(img.getWidth() > 500 || img.getHeight() > 500){
				width = (int) (img.getWidth() * 0.5);
				height = (int) (img.getHeight() * 0.5);
			}
			Image imgScaled = img.getScaledInstance(width, height, Image.SCALE_SMOOTH);
			BufferedImage tag = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);   
			//缩放图像
			Graphics2D g = tag.createGraphics();   
			g.drawImage(imgScaled, 0, 0, null); // 绘制缩小后的图   
			g.dispose();   
			
			OutputStream os = new FileOutputStream(realSavePath + savedFileName);   
			ImageIO.write(tag, fileSuffix, os);// 输出 
			os.close();   
		}else{
			part.write(realSavePath + savedFileName);
		}

		/**
		 * 返回页面显示图片路径
		 */
		String bastPath = SysConstants.File_UPLOAD_PATH + fileFolder + savedFileName;
		
		
		/**
		 * 返回json格、格式
		 */
		PrintWriter out =  response.getWriter();
		out.write(CommonTools.getObjectType2Json(new FileUploadResp(bastPath, String.valueOf(fileSize), fileName)));
		out.flush();
		out.close();
		
	}
	

}

