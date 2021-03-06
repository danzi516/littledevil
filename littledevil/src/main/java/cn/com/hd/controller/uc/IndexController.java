package cn.com.hd.controller.uc;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	/**
	 *方法说明：跳转到前台起始页面
	 *url:${webRoot}/
	 *请求方式：get
	 *@return ModelAndView
	 **/
	@RequestMapping("/")
	public ModelAndView toUserIndexPage(HttpServletRequest request) {
		/**
		 * 想要在页面展现数据,必须返回ModelAndView类型,返回String是不能获取数据的
		 * */
		ModelAndView modelView = new ModelAndView();
		
		modelView.setViewName("index");// 設置視圖名稱

		return modelView;
	}
	
	
	/**
	 *方法说明：后台登录页面
	 *url:${webRoot}/
	 *请求方式：get
	 *@return ModelAndView
	 **/
	@RequestMapping("/admin/login")
	public ModelAndView adminLogin(HttpServletRequest request) {
		/**
		 * 想要在页面展现数据,必须返回ModelAndView类型,返回String是不能获取数据的
		 * */
		ModelAndView modelView = new ModelAndView();
		
		modelView.setViewName("admin_login");// 設置視圖名稱

		return modelView;
	}
	
	/**
	 *方法说明：前台登录页面
	 *url:${webRoot}/
	 *请求方式：get
	 *@return ModelAndView
	 **/
	@RequestMapping("/login")
	public ModelAndView personLogin(HttpServletRequest request) {
		/**
		 * 想要在页面展现数据,必须返回ModelAndView类型,返回String是不能获取数据的
		 * */
		ModelAndView modelView = new ModelAndView();
		
		modelView.setViewName("login");// 設置視圖名稱

		return modelView;
	}
	
	/**
	 *方法说明：跳转到前台起始页面
	 *url:${webRoot}/person/userList
	 *请求方式：get
	 *@return ModelAndView
	 **/
	@RequestMapping("/person/userList")
	public ModelAndView toPersonUserList(HttpServletRequest request) {
		/**
		 * 想要在页面展现数据,必须返回ModelAndView类型,返回String是不能获取数据的
		 * */
		ModelAndView modelView = new ModelAndView();
		
		modelView.setViewName("person/person_user_list");// 設置視圖名稱

		return modelView;
	}
	
	/**
	 *方法说明：跳转到前台起始页面
	 *url:${webRoot}/admin/userList
	 *请求方式：get
	 *@return ModelAndView
	 **/
	@RequestMapping("/admin/userList")
	public ModelAndView toSysUserList(HttpServletRequest request) {
		/**
		 * 想要在页面展现数据,必须返回ModelAndView类型,返回String是不能获取数据的
		 * */
		ModelAndView modelView = new ModelAndView();
		
		modelView.setViewName("sys/sys_user_list");// 設置視圖名稱

		return modelView;
	}
	@RequestMapping("/admin/index")
	public ModelAndView toSysIndex(HttpServletRequest request) {
		/**
		 * 想要在页面展现数据,必须返回ModelAndView类型,返回String是不能获取数据的
		 * */
		ModelAndView modelView = new ModelAndView();
		
		modelView.setViewName("sys/index");// 設置視圖名稱

		return modelView;
	}
	@RequestMapping("/admin/main")
	public ModelAndView toSysMain(HttpServletRequest request) {
		/**
		 * 想要在页面展现数据,必须返回ModelAndView类型,返回String是不能获取数据的
		 * */
		ModelAndView modelView = new ModelAndView();
		
		modelView.setViewName("sys/main");// 設置視圖名稱

		return modelView;
	}
}
