package cn.com.hd.controller.company;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.hd.common.MD5Encrypt;
import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CommodityCategory;
import cn.com.hd.domain.company.CompanyCommodity;
import cn.com.hd.domain.company.CompanyInfo;
import cn.com.hd.domain.company.CompanyMember;
import cn.com.hd.domain.uc.User;
import cn.com.hd.domain.uc.UserInfo;
import cn.com.hd.service.company.CommodityCategoryService;
import cn.com.hd.service.company.CompanyCommodityService;


@Controller
@RequestMapping("/store")
public class StoreController {
	@Resource
	private CompanyCommodityService companyCommodityService;
	@Resource
	private CommodityCategoryService commodityCategoryService;
	
	/**
	 * 功能描述：跳转到公司首页
	 * 作者：lijiaxing
	 * url：${webRoot}/store/index
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/index")
	public  ModelAndView toIndex(){
		ModelAndView mv=new ModelAndView("store/index");
		return mv;
	}
	
	/**
	 * 功能描述：跳转到公司商品列表
	 * 作者：lijiaxing
	 * url：${webRoot}/store/companyCommodityList
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/companyCommodityList/{id}")
	public  ModelAndView companyCommodityList(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("store/companyCommodity_list");
		return mv;
	}
	
	/**
	 * 功能描述：跳转到公司会员列表
	 * 作者：lijiaxing
	 * url：${webRoot}/store/companyMemberList
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/companyMemberList/{id}")
	public  ModelAndView companyMemberList(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("store/companyMember_list");
		return mv;
	}
	
	/**
	 * 功能描述：跳转到商品分类列表
	 * 作者：lijiaxing
	 * url：${webRoot}/store/commodityCategoryList
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/commodityCategoryList/{id}")
	public  ModelAndView commodityCategoryList(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("store/commodityCategory_list");
		return mv;
	}
	
	/**
	 * 功能描述：跳转到添加商品分类
	 * 作者：lijiaxing
	 * url：${webRoot}/store/toAddCommodityCategory
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/toAddCommodityCategory/{id}")
	public  ModelAndView toAddCommodityCategory(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("store/commodityCategory_add");
		return mv;
	}
	
	/**
	 * 功能描述：跳转到合同
	 * 作者：lijiaxing
	 * url：${webRoot}/store/companyContract
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/companyContract/{id}")
	public  ModelAndView companyContract(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("store/companyContract");
		return mv;
	}
	
	/**
	 * 功能描述：跳转到基本信息
	 * 作者：lijiaxing
	 * url：${webRoot}/store/companyContract
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/basicInfo/{id}")
	public  ModelAndView basicInfo(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("store/basicInfo");
		return mv;
	}
	
	/**
	 * 功能描述：跳转到商品活动
	 * 作者：lijiaxing
	 * url：${webRoot}/store/companyContract
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/companyPromotionList/{id}")
	public  ModelAndView commodityPromotion(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("store/companyPromotion_list");
		return mv;
	}
	
	/**
	 * 功能描述：跳转到分类详情
	 * 作者：lijiaxing
	 * url：${webRoot}/store/toCommodityCategorydetail
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/toCommodityCategorydetail/{id}")
	public  ModelAndView toCommodityCategorydetail(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("store/CommodityCategory_detail");
		try{
				CommodityCategory commodityCategory = commodityCategoryService.selectByPrimaryKey(id);
				List<CompanyCommodity> companyCommodityList = companyCommodityService.selectByCompanyId(commodityCategory.getCompanyId());
				 mv.addObject("commodityCategory",commodityCategory);
				 mv.addObject("companyCommodityList",companyCommodityList);
	        }catch(Exception e){
	            e.printStackTrace();
	        }
		
		return mv;
	}
	
      
}
