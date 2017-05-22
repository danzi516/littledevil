package cn.com.hd.controller.uc;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/module")
public class moduleController {
	
	
	/**
	 *方法说明：跳转到文章页面
	 *url:${webRoot}/module/articleList
	 *请求方式：get
	 *@return ModelAndView
	 **/
	@RequestMapping("/articleList")
	public ModelAndView articleList(HttpServletRequest request) {
		/**
		 * 想要在页面展现数据,必须返回ModelAndView类型,返回String是不能获取数据的
		 * */
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("module/article_list");// 設置視圖名稱
		return modelView;
	}
	
	/**
	 *方法说明：跳转到平台商店
	 *url:${webRoot}/module/storeList
	 *请求方式：get
	 *@return ModelAndView
	 **/
	@RequestMapping("/storeList")
	public ModelAndView storeList(HttpServletRequest request) {
		/**
		 * 想要在页面展现数据,必须返回ModelAndView类型,返回String是不能获取数据的
		 * */
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("module/store_list");// 設置視圖名稱
		return modelView;
	}
	
	/**
	 *方法说明：跳转到平台商品
	 *url:${webRoot}/module/goodsList
	 *请求方式：get
	 *@return ModelAndView
	 **/
	@RequestMapping("/goodsList")
	public ModelAndView goodsList(HttpServletRequest request) {
		/**
		 * 想要在页面展现数据,必须返回ModelAndView类型,返回String是不能获取数据的
		 * */
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("module/goods_list");// 設置視圖名稱
		return modelView;
	}
	
	/**
	 *方法说明：跳转到平台活动
	 *url:${webRoot}/module/salesList
	 *请求方式：get
	 *@return ModelAndView
	 **/
	@RequestMapping("/salesList")
	public ModelAndView salesList(HttpServletRequest request) {
		/**
		 * 想要在页面展现数据,必须返回ModelAndView类型,返回String是不能获取数据的
		 * */
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("module/sales_list");// 設置視圖名稱
		return modelView;
	}
	
}
