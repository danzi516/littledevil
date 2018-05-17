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
import cn.com.hd.domain.company.CompanyPromotion;
import cn.com.hd.domain.company.CompanyInfo;
import cn.com.hd.domain.company.CompanyMember;
import cn.com.hd.domain.uc.User;
import cn.com.hd.domain.uc.UserInfo;
import cn.com.hd.service.company.CompanyPromotionService;

/**
 *类说明：商户促销
 *@author lijiaxing 2016/10/17
 *${webRoot}:系统运行根目录 
 **/
@Controller
@RequestMapping("/companyPromotion")
public class CompanyPromotionController {
	@Resource
	private CompanyPromotionService companyPromotionService;
	
	/**
	 * 功能描述：跳转到促销列表页面
	 * 作者：wanglin
	 * url：${webRoot}/companyPromotion/toCompanyPromotionList
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/toCompanyPromotionList")
	public  ModelAndView toCompanyPromotionList(){
		ModelAndView mv=new ModelAndView("company/companyPromotion_list");
		return mv;
	}
	
	/**
	 * 功能描述：跳转到促销添加页面
	 * 作者：wanglin
	 * url：${webRoot}/companyPromotion/toAddCompanyPromotion
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 *          值 ：含义【userInfo：个人扩展信息，user：帐号信息】
	 **/
	@RequestMapping("/toAddCompanyPromotion")
	public  ModelAndView toAddCompany(){
		ModelAndView mv=new ModelAndView("company/companyPromotion_add");
		return mv;
	}
	
	/**
	 * 功能描述：添加活动
	 * 作者：wanglin
	 * url：${webRoot}/companyPromotion/insertRecord
	 * 请求方式：POST
	 * @param  Page page
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
    @RequestMapping(value="insertRecord",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> insertRecord(@RequestBody CompanyPromotion record){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
        	companyPromotionService.insert(record);
            code="0";
        }catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
    }
	
	 /**
	 * 功能描述：分页查询所有企业促销
	 * 作者：lijiaxing
	 * url：${webRoot}/companyPromotion/selectListByPage
	 * 请求方式：POST
	 * @param  Page page
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 *         key:rows[查询结果list]
	 *         key:total[记录总数]
	 */
    @RequestMapping(value="selectListByPage",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectListByPage(Page page){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
            page = companyPromotionService.selectCompanyPromotionByPage(page);
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
  	 * url：${webRoot}/companyPromotion/updateRecord
  	 * 请求方式：POST
  	 * @param   CompanyInfo
  	 * @return Map<String,Object>
  	 *         key:code["0":"成功","1":"失败"]
  	 */
      @RequestMapping(value="updateRecord",method=RequestMethod.POST)
      public @ResponseBody Map<String, Object> update(@RequestBody CompanyPromotion record){
          Map<String,Object> map = new HashMap<String,Object>();
          String code="";
          try{
        	  companyPromotionService.updateByPrimaryKeySelective(record);
              code="0";
          }catch(Exception e){
              code="1";
              e.printStackTrace();
          }
          map.put("code", code);
          return map;
      }
    
      /**
    	 * 功能描述：通过商户id查找促销
    	 * 作者：lijiaxing
    	 * url：${webRoot}/companyPromotion/selectByCompanyId
    	 * 请求方式：POST
    	 * @param   CompanyId
    	 * @return Map<String,Object>
    	 *         key:code["0":"成功","1":"失败"]
    	 *         key:companyPromotionList[查询结果list]
    	 */
      @RequestMapping(value="selectByCompanyId",method=RequestMethod.POST)
        public @ResponseBody Map<String, Object> selectByCompanyId(@RequestBody int id){
            Map<String,Object> map = new HashMap<String,Object>();
            String code="";
            try{
            	List<CompanyPromotion> companyPromotionList = companyPromotionService.selectByCompanyId(id);
                code="0";
                map.put("companyPromotionList",companyPromotionList);
            }catch(Exception e){
                code="1";
                e.printStackTrace();
            }
            map.put("code", code);
            
            return map;
        }      
      
}
