package cn.com.hd.controller.company;

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
import cn.com.hd.domain.company.CompanyCommodity;
import cn.com.hd.domain.company.CompanyInfo;
import cn.com.hd.domain.company.CompanyMember;
import cn.com.hd.domain.uc.User;
import cn.com.hd.domain.uc.UserInfo;
import cn.com.hd.service.company.CompanyCommodityService;


@Controller
@RequestMapping("/companyCommodity")
public class CompanyCommodityController {
	@Resource
	private CompanyCommodityService companyCommodityService;
	
	/**
	 * 功能描述：跳转到商品列表页面
	 * 作者：wanglin
	 * url：${webRoot}/companyCommodity/toCompanyCommodityList
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/toCompanyCommodityList")
	public  ModelAndView toCompanyCommodityList(){
		ModelAndView mv=new ModelAndView("company/companyCommodity_list");
		return mv;
	}
	
	/**
	 * 功能描述：跳转到商品添加页面
	 * 作者：wanglin
	 * url：${webRoot}/companyCommodity/toAddCompanyCommodity
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 *          值 ：含义【userInfo：个人扩展信息，user：帐号信息】
	 **/
	@RequestMapping("/toAddCompanyCommodity")
	public  ModelAndView toAddCompany(){
		ModelAndView mv=new ModelAndView("company/companyCommodity_add");
		return mv;
	}
	
	/**
	 * 功能描述：添加会员
	 * 作者：wanglin
	 * url：${webRoot}/companyCommodity/insert
	 * 请求方式：POST
	 * @param  Page page
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 *         key:rows[查询结果ist]
	 *         key:total[记录总数]
	 */
    @RequestMapping(value="insert",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> insert(@RequestBody CompanyCommodity record){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
        	companyCommodityService.insert(record);
            code="0";
        }catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
    }
	
	 /**
	 * 功能描述：分页查询所有企业商品
	 * 作者：lijiaxing
	 * url：${webRoot}/companyCommodity/selectByPage
	 * 请求方式：POST
	 * @param  Page page
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 *         key:rows[查询结果ist]
	 *         key:total[记录总数]
	 */
    @RequestMapping(value="selectByPage",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectByPage(Page page){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
            page = companyCommodityService.selectCompanyCommodityByPage(page);
            code="0";
            map.put("rows", page.getData());
    		map.put("total", page.getTotalRecord());
        }catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
    }
	
    /**
  	 * 功能描述：更新
  	 * 作者：lijiaxing
  	 * url：${webRoot}/companyCommodity/update
  	 * 请求方式：POST
  	 * @param   CompanyInfo
  	 * @return Map<String,Object>
  	 *         key:code["0":"成功","1":"失败"]
  	 *         key:rows[查询结果ist]
  	 *         key:total[记录总数]
  	 */
      @RequestMapping(value="update",method=RequestMethod.POST)
      public @ResponseBody Map<String, Object> update(@RequestBody CompanyCommodity record){
          Map<String,Object> map = new HashMap<String,Object>();
          String code="";
          try{
        	  companyCommodityService.updateByPrimaryKeySelective(record);
              code="0";
          }catch(Exception e){
              code="1";
              e.printStackTrace();
          }
          map.put("code", code);
          return map;
      }
    
      /**
    	 * 功能描述：通过商户id查找商品
    	 * 作者：lijiaxing
    	 * url：${webRoot}/companyCommodity/update
    	 * 请求方式：POST
    	 * @param   CompanyInfo
    	 * @return Map<String,Object>
    	 *         key:code["0":"成功","1":"失败"]
    	 *         key:rows[查询结果ist]
    	 *         key:total[记录总数]
    	 */
      @RequestMapping(value="selectByCompanyId/{id}",method=RequestMethod.POST)
        public @ResponseBody Map<String, Object> selectByCompanyId(@PathVariable("id") int id){
            Map<String,Object> map = new HashMap<String,Object>();
            String code="";
            try{
            	List<CompanyCommodity> companyCommodityList = companyCommodityService.selectByCompanyId(id);
                code="0";
                map.put("companyCommodityList",companyCommodityList);
            }catch(Exception e){
                code="1";
                e.printStackTrace();
            }
            map.put("code", code);
            
            return map;
        }      
      
}
