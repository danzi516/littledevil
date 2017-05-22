package cn.com.hd.controller.person;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.hd.common.MD5Encrypt;
import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyStaff;
import cn.com.hd.domain.uc.SaleMan;
import cn.com.hd.domain.uc.User;
import cn.com.hd.domain.uc.UserInfo;
import cn.com.hd.service.company.CompanyStaffService;
import cn.com.hd.service.uc.SaleManService;
import cn.com.hd.service.uc.UserInfoService;
import cn.com.hd.service.uc.UserService;

/**
 *类说明：系统初始化页面控制器
 *@author lijiaxing 2016/10/17
 *${webRoot}:系统运行根目录 
 **/
@Controller
@RequestMapping("/person")
public class PersonController {
	@Resource
	private UserInfoService userInfoService;
	
	@Resource
	private UserService userService;
	
	@Resource
	private SaleManService saleManService;
	
	@Resource
	private CompanyStaffService companyStaffService;

	/**
	 * 功能描述：跳转到个人首页
	 * 作者：lijiaxing
	 * url：${webRoot}/person/index
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/index")
	public  ModelAndView toIndex(){
		ModelAndView mv=new ModelAndView("person/index");
		return mv;
	}
	
	/**
	 * 功能描述：跳转到个人设置
	 * 作者：lijiaxing
	 * url：${webRoot}/person/index
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/memberSet")
	public  ModelAndView memberSet(){
		ModelAndView mv=new ModelAndView("person/member_set");
		return mv;
	}
	
	/**
	 * 功能描述：跳转到我的商店
	 * 作者：lijiaxing
	 * url：${webRoot}/person/storeList
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/storeList")
	public  ModelAndView storeList(){
		ModelAndView mv=new ModelAndView("person/store_list");
		return mv;
	}
	
	
	/**
	 * 功能描述：跳转到个人资料
	 * 作者：lijiaxing
	 * url：${webRoot}/person/editPerson
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/editPerson")
	public  ModelAndView editPerson(){
		ModelAndView mv=new ModelAndView("person/person_user_edit");
		return mv;
	}
	
	/**
	 * 功能描述：申请成为业务员
	 * 作者：lijiaxing
	 * url：${webRoot}/person/applyToSaleMan
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/person/applyToSaleMan/{id}")
	public @ResponseBody Map<String,Object> applyToSaleMan(@PathVariable("id") int id){
		Map<String,Object> map=new HashMap<String,Object>();
		
		String code="";
		map.put("code", code);
	    return map;
	}
	
}
