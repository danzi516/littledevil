package cn.com.hd.common;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.web.client.RestTemplate;

import cn.com.hd.common.exception.FormatException;
import cn.com.hd.domain.uc.User;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 工具类
 * 
 * @author fengcaizhi
 * 
 */
public class CommonTools {
	
	private static RestTemplate template=new RestTemplate();
	private static String msg_path="http://119.97.166.135:1060/message/";
	//private static String msg_path="http://192.168.1.156:8081/message/";

	/**
	 * 返回将对象转化成json字符串
	 * @param obj
	 */
	public static String getObjectType2Json(Object obj){
		
		String jsonStr = "";
		
		//判断类型
		if( obj instanceof String){
			jsonStr = (String) obj;
		}else if( obj instanceof Integer || obj instanceof Double || obj instanceof Float || obj instanceof Long || obj instanceof Boolean){
			
			jsonStr = String.valueOf(obj);
			
		}else if( obj instanceof Date){
			
			jsonStr = new SimpleDateFormat("yyyy-MM-dd").format(obj);
			
		}else if (obj.getClass() == ArrayList.class || obj.getClass() == HashMap.class) {
			jsonStr = JSONArray.fromObject(obj).toString();
		}else {
			jsonStr = JSONObject.fromObject(obj).toString();
		}
		
		return jsonStr;
		
	}
	
	
	
	/**
	 * 
	 * @param fileName
	 * @return
	 */
	public static String getNewFileName(String fileName){
		if(null == fileName || "".equals(fileName)){
			return fileName;
		}
		String fileType = fileName.substring(fileName.lastIndexOf("."),fileName.length());
		String converFileName = getUuid();
		return converFileName + fileType;
	}

	/**
	 * 获取唯一表示
	 * @return
	 */
	public static String getUuid(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	/**
	 * 时间的比较 返回1 oldDate<newDate ,2 oldDate=newDate,3 oldDate>newDate 4出错
	 * @return
	 */
	 public static String compareDatesByCalendarMethods(DateFormat df, Date oldDate, Date newDate) {
	 	 
		   if(oldDate!=null&&newDate!=null){
         //creating calendar instances for date comparision
			   Date oldCal;
			   Date newCal;
			try {
				oldCal =df.parse((df.format(oldDate)));
				newCal = df.parse((df.format(newDate)));
				int result=oldCal.compareTo(newCal);
				 if(result==0){
					 return "2";
				 }else if(result<1){
					 return "1";
				 }else{
					 return "3";
				 }
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "4";//出现错误
			}
		 } 
		       return "4";//出现错误
		}
	 
	 public static Date NextYear(Date date){
		if(date!=null){
			Calendar curr = Calendar.getInstance();
			curr.setTime(date);
			
			curr.set(Calendar.YEAR,curr.get(Calendar.YEAR)+1);
			Date dateNext=curr.getTime();
			return dateNext;
		}else{
			return null;
		}
	}
	 
	public static String date2Str(Date inDate, String format) {
			SimpleDateFormat dFormat = new SimpleDateFormat(format);
			return dFormat.format(inDate);
	}
	
	/**
	 * 删除文件夹
	 * @param folderPath
	 */
	public static void delFolder(String folderPath) {
		try {
			delAllFile(folderPath); // 删除完里面所有内容
			String filePath = folderPath;
			filePath = filePath.toString();
			java.io.File myFilePath = new java.io.File(filePath);
			myFilePath.delete(); // 删除空文件夹
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 删除指定文件夹下所有文件
	 * @param path 文件夹完整绝对路径
	 * @return
	 */
	public static boolean delAllFile(String path) {
		boolean flag = false;
		File file = new File(path);
		if (!file.exists()) {
			return flag;
		}
		if (!file.isDirectory()) {
			return flag;
		}
		String[] tempList = file.list();
		File temp = null;
		for (int i = 0; i < tempList.length; i++) {
			if (path.endsWith(File.separator)) {
				temp = new File(path + tempList[i]);
			} else {
				temp = new File(path + File.separator + tempList[i]);
			}
			if (temp.isFile()) {
				temp.delete();
			}
			if (temp.isDirectory()) {
				delAllFile(path + "/" + tempList[i]);// 先删除文件夹里面的文件
				delFolder(path + "/" + tempList[i]);// 再删除空文件夹
				flag = true;
			}
		}
		return flag;
	}
	
	/**
	 * 删除制定路径的文件.
	 * @param path
	 * @return
	 */
	public static boolean delFile(String path){
		boolean flag = false;
		File file = new File(path);
		if (file.exists()) {
			file.delete();
			flag = true;
		}
		return flag;
	}
	
	public static <T> boolean contains( final T[] array, final T v ) {
	    for ( final T e : array )
	        if ( e == v || v != null && v.equals( e ) )
	            return true;

	    return false;
	}
	
	/**
	 * 获取参数 判断是否合法,用户对外接口参数分割
	 * @param obj
	 * @return
	 * @throws FormatException
	 */
	public static String splitStr(String obj) throws FormatException{
		if(obj == null){
			return "";
		}
		
		if(obj.indexOf("=") == -1){
			throw new FormatException("请求参数"+obj+"格式错误 应为key=XX");
		}
		
		String[] strArray = obj.split("=");
		
		if(!"key".equals(strArray[0])){
			throw new FormatException("请求参数"+obj+"格式错误 应为key=XX");
		}
		
		if(strArray.length < 2){
			return "";
		}
		
		return strArray[1];
		
	}
	
	/**
	 * 获得当前日期
	 * 
	 * @return
	 */
	public static String getCurrentDay() {
		String today = new SimpleDateFormat("yyyyMMdd").format(Calendar
				.getInstance().getTime());
		return today;
	}
	
	/**
	 * 
	 * @param path
	 * @return
	 */
	public static String getRootPath(String path){
		if(path == null || "".equals(path)){
			return "";
		}
		
		path = path.substring(path.indexOf("res"));
		
		return path;
	}   
    
    
    /**
	 * 路径编码utf8
	 * @param path
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public static String urlEncodingPath(String path) throws UnsupportedEncodingException{
		String hasPreslash = "";
		String hasSufslash = "";
		
		if(path == null || path.equals("")){
			return "";
		}else{
			String newFolderPath = path.replace("\\", "/");
			String panChar = "";
			String sysName = System.getProperty("os.name").toUpperCase();
			if(sysName.contains("WINDOW")){
				if(newFolderPath.indexOf(":") != -1){
					panChar = newFolderPath.substring(0, newFolderPath.indexOf(":") + 1);
					newFolderPath = newFolderPath.substring(2);
				}
			}
			
			if(("/").equals(String.valueOf(newFolderPath.charAt(0)))){
				newFolderPath = newFolderPath.substring(1);
				hasPreslash = "/";
			}
			
			if(("/").equals(String.valueOf(newFolderPath.charAt(newFolderPath.length() -1)))){
				newFolderPath = newFolderPath.substring(0, newFolderPath.length() - 1);
				hasSufslash = "/";
			}
			
			String s;
			String[] folders = newFolderPath.split("/");
			StringBuffer sb = new StringBuffer();
			for(int i = 0; i < folders.length; i++){
				s = URLEncoder.encode(folders[i], "UTF-8");
				sb.append(s);
				if(i < (folders.length - 1)){
					sb.append("/");
				}
			}
			
			String returnStr = hasPreslash + sb.toString() + hasSufslash;
			if(sysName.contains("WINDOW")){
				return panChar + returnStr;
			}else{
				return returnStr;
			}
		}
		
	}
	
	
	 
    /**
	 * 判断远程文件是否存在
	 * @param path
	 * @return  boolean
	 */
	public static boolean isNetFileAvailable (String path){
		//文件路径：可以是本地服务器的路径，也可以是远程服务器的路径
		InputStream netFileInputStream = null;
			try {
				URL url = new URL(path);
				URLConnection urlConn = url.openConnection();
				netFileInputStream = urlConn.getInputStream();
				if (null != netFileInputStream) {
					return true;
				} else {
					return false;
				}
			} catch (IOException e) {
				return false;
			} finally {
				try {
					if (netFileInputStream != null)
						netFileInputStream.close();
				} catch (IOException e) {
				}
			}
		}
	
	 public static String toSize(Long totalSpace){
			double totalSpaceTemp = 0;
			String size = null;
			String unit = null;
			boolean flag = false;
			DecimalFormat df = new DecimalFormat("#.00");
			
			if(totalSpace == 0){
				return "0B";
			}else if(totalSpace < 1024){
				return totalSpace +"B";
			}else if (totalSpace < 1048576) {
				if(totalSpace%1024 == 0){
					return totalSpace/1024 +"KB";
				}else{
					return  df.format((double)totalSpace/1024) + "KB";
				}
	        }else if (totalSpace >= 1048576 && totalSpace < 1073741824) {
	        	if(totalSpace/1024%1024 == 0){
	        		return totalSpace/1024/1024 +"MB";
				}else{
					return df.format((double)totalSpace/1024/1024) +"MB";
				}
	        }else if (totalSpace >= 1073741824) {
	        	if(totalSpace/1024/1024%1024 == 0){
	        		return totalSpace/1024/1024/1024 +"G";
				}else{
					return df.format((double)totalSpace/1024/1024/1024) +"G";
				}
	        }
			if(!flag){
				BigDecimal  bd  =  new BigDecimal(totalSpaceTemp);      
				double  totalRate = bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
				size = totalRate + unit;
			}else{
				size = totalSpaceTemp + unit;
			}
			return size;
		}
	 
	 
	 public static Object buildObj(String key){ 
         Subject currentUser = SecurityUtils.getSubject(); 
         return currentUser.getSession().getAttribute(key); 
      }
	
	 /**
	  * 获取时间戳
	  * @return
	  */
	 public static String getVersionInfo() {
		    return String.valueOf(System.currentTimeMillis()) ;
	}
	 
	 
	 public static String getSessionUserName(HttpServletRequest request) {
		 String userName="";
		 try {
			 if(request.getSession().getAttribute("user")!=null){
				User user= (User)request.getSession().getAttribute("user");
				userName=user.getUserName();
			 }
		 } catch (Exception e) {
			 return userName;
		 }
		 return userName;
	 }
	 
	 /**
	  * 根据用户真实姓名和用户类型生成用户帐号
	  * 用户名长度：9位
	  * 用户名生产原则：角色前缀+用户中文名首字母+随机数字
	  * 说明：用户名以角色前缀+用户中文名首字母为主，其它位数以随机数填充
	  * 角色前缀说明：个人用户（person）:P,学生（student）:S,教师（teacher）:T,家长（parent）:J,学校（school）:X,机构（org）:O,其他：Q
	  * @param userRelName String用户中文名
	  * @param userRole String用户角色
	  * @return
	  */
	 public static String getUserName(String userRelName,String userRole){
		 String userName="";
		 if("person".equals(userRole)){
			 userName="P";
		 }else  if("student".equals(userRole)){
			 userName="S";
		 }else  if("teacher".equals(userRole)){
			 userName="T";
		 }else  if("parent".equals(userRole)){
			 userName="J";
		 }else  if("school".equals(userRole)){
			 userName="X";
		 }else  if("org".equals(userRole)){
			 userName="O";
		 }else{
			 userName="Q";
		 }
		 userName+=PingYinUtil.getPYIndexStr(userRelName, true);
		 int initNum=userName.length();
		 for(int i=initNum;i<9;i++){
			 Random rd = new Random();
			 int num = rd.nextInt(9);
			 userName+=String.valueOf(num);
		 }
		 return userName;
	 }
	 /**
	  *获取当前学年度，每年的8月分之前返回上一个年度，8月份之后返回本年度，如：2016/7/21 返回值为2015，2016/8/21返回2016 
	  **/
	 public static String getPreClassYear(){
		 Calendar a=Calendar.getInstance();
		 int year=a.get(Calendar.YEAR);
		 int month=a.get(Calendar.MONTH)+1;
		 if(month>7){
			 return String.valueOf(year);
		 }else{
			 return String.valueOf(year-1);
		 }
	 }
	 
	 public static void messageSend(Map<String,Object> map){
		 template.postForObject(msg_path+"msg/v1/sendMsg", map, Map.class);
	 }
	 
	 public static String convertFileSize(long size) {
	        long kb = 1024;
	        long mb = kb * 1024;
	        long gb = mb * 1024;
	 
	        if (size >= gb) {
	            return String.format("%.1f GB", (float) size / gb);
	        } else if (size >= mb) {
	            float f = (float) size / mb;
	            return String.format(f > 100 ? "%.0f MB" : "%.1f MB", f);
	        } else if (size >= kb) {
	            float f = (float) size / kb;
	            return String.format(f > 100 ? "%.0f KB" : "%.1f KB", f);
	        } else
	            return String.format("%d B", size);
	    }
}
