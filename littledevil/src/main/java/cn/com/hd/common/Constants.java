package cn.com.hd.common;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Constants {

	/* 分页 */
	public static final String PAGESIZE = "5";
	
	public static final String PAGESIZE_10 = "10";
	
	public static final String PAGESIZE_15 = "15";
	
	public static final String PAGESIZE_20 = "20";

	public static final String COUNT = "totleCount";

	public static final String CURRENTPAGE = "currentPage";

	public static final String PAGESIZENOW = "pagesizeNow";
	  
     public static String getIpAddr(HttpServletRequest request) {  
            String ip = request.getHeader("X-Forwarded-For");  
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
                ip = request.getHeader("Proxy-Client-IP");  
            }  
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
                ip = request.getHeader("WL-Proxy-Client-IP");  
            }  
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
                ip = request.getHeader("HTTP_CLIENT_IP");  
            }  
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
                ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
            }  
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
                ip = request.getRemoteAddr();  
            }  
            return ip;  
        }  
     
   //验证通过结果
 	public static final String VALIDAT_RESULT ="00000000";   
 	
 	//注册信息的时候 用户类型ID 网址来的是04
 	public static final String USER_TYPE_ID="04";
 	
 	//USER_STATE 停用；启用 邮箱验证用到 01 启用     02停用
 	public static final String USER_STATE="02";
 	
 	public static final String EMAIL_USER_STATE="01";//邮箱激活的 启动
 	
 	public static final String TEACHER="e75cb3a23e7d44e197044f8121e9b719";
 	
 	public static final String STUDENT="1a7ec604e5ae402691735eec0448020e";
 	
 	public static final String PARENT="8ee361c0825546e8823963fe10a192b6";
 	
 	
 	public static final String BOOKVERSIONCODE="50003";//教材版本
 	
 	public static final String GRADETYPECODE="50002";//字典表 取年级的CODE
 	
 	 //小程序唯一标识   (在微信小程序管理后台获取)
 	public static final  String wxspAppid = "wx32c11755b820c737";
    //小程序的 app secret (在微信小程序管理后台获取)
 	public static final  String wxspSecret = "a9832e8ca5ceeadb548eb00fdbdbbf09";
    //授权（必填）
 	public static final  String grant_type = "authorization_code";
 	
 	public static String HtmlText(String inputString) { 
	      String htmlStr = inputString; //含html标签的字符串 
	      String textStr =""; 
	      java.util.regex.Pattern p_script; 
	      java.util.regex.Matcher m_script; 
	      java.util.regex.Pattern p_style; 
	      java.util.regex.Matcher m_style; 
	      java.util.regex.Pattern p_html; 
	      java.util.regex.Matcher m_html; 
	      try { 
	       String regEx_script = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>"; //定义script的正则表达式{或<script[^>]*?>[\\s\\S]*?<\\/script> } 
	       String regEx_style = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>"; //定义style的正则表达式{或<style[^>]*?>[\\s\\S]*?<\\/style> } 
	          String regEx_html = "<[^>]+>"; //定义HTML标签的正则表达式 
	      
	          p_script = Pattern.compile(regEx_script,Pattern.CASE_INSENSITIVE); 
	          m_script = p_script.matcher(htmlStr); 
	          htmlStr = m_script.replaceAll(""); //过滤script标签 
	
	          p_style = Pattern.compile(regEx_style,Pattern.CASE_INSENSITIVE); 
	          m_style = p_style.matcher(htmlStr); 
	          htmlStr = m_style.replaceAll(""); //过滤style标签 
	      
	          p_html = Pattern.compile(regEx_html,Pattern.CASE_INSENSITIVE); 
	          m_html = p_html.matcher(htmlStr); 
	          htmlStr = m_html.replaceAll(""); //过滤html标签 
	          
	          /* 空格 ——   */
	         // p_html = Pattern.compile("\\ ", Pattern.CASE_INSENSITIVE);
	          m_html = p_html.matcher(htmlStr);
	          htmlStr = htmlStr.replaceAll(" "," ");

			textStr = htmlStr; 
				      
			}catch(Exception e) { 
				
			} 
			return textStr;
			}  
 	
 	
        
 	    public static final Map kgmap;
        static {
        	kgmap = new HashMap();
        	kgmap.put("bjzy", "02");//中油的接口开关 01 启用     02停用
        	kgmap.put("whty", "02");//武汉天喻的接口开关 01 启用     02停用
        	kgmap.put("ycty", "01");//宜昌天喻的接口开关 01 启用     02停用
        } 	   
}
