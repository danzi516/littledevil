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
		
		modelView.setViewName("sys/person_user_list");// 設置視圖名稱

		return modelView;
	}
	
	/**
	 *方法说明：跳转到前台起始页面
	 *url:${webRoot}/sys/userList
	 *请求方式：get
	 *@return ModelAndView
	 **/
	@RequestMapping("/sys/userList")
	public ModelAndView toSysUserList(HttpServletRequest request) {
		/**
		 * 想要在页面展现数据,必须返回ModelAndView类型,返回String是不能获取数据的
		 * */
		ModelAndView modelView = new ModelAndView();
		
		modelView.setViewName("sys/sys_user_list");// 設置視圖名稱

		return modelView;
	}
}
