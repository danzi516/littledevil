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
import cn.com.hd.domain.company.CommodityCategory;
import cn.com.hd.domain.company.CompanyCommodity;
import cn.com.hd.domain.company.CompanyInfo;
import cn.com.hd.domain.company.CompanyMember;
import cn.com.hd.domain.uc.User;
import cn.com.hd.domain.uc.UserInfo;
import cn.com.hd.service.company.CommodityCategoryService;
import cn.com.hd.service.company.CompanyCommodityService;

/**
 *类说明：商品分类
 *@author lijiaxing 2016/10/17
 *${webRoot}:系统运行根目录 
 **/
@Controller
@RequestMapping("/commodityCategory")
public class CommodityCategoryController {
	@Resource
	private CommodityCategoryService commodityCategoryService;
	
	
	/**
	 * 功能描述：添加分类
	 * 作者：wanglin
	 * url：${webRoot}/commodityCategory/insertRecord
	 * 请求方式：POST
	 * @param  Page page
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
    @RequestMapping(value="insertRecord",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> insertRecord(@RequestBody CommodityCategory record){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
        	commodityCategoryService.insert(record);
            code="0";
        }catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
    }
	
	 /**
	 * 功能描述：分页查询所有商品分类
	 * 作者：lijiaxing
	 * url：${webRoot}/commodityCategory/selectByPage
	 * 请求方式：POST
	 * @param  Page page
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 *         key:rows[查询结果list]
	 *         key:total[记录总数]
	 */
    @RequestMapping(value="selectByPage",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectByPage(Page page){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
            page = commodityCategoryService.selectByCompanyIdByPage(page);
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
  	 * 功能描述：分类更新
  	 * 作者：lijiaxing
  	 * url：${webRoot}/commodityCategory/updateRecord
  	 * 请求方式：POST
  	 * @param   CompanyInfo
  	 * @return Map<String,Object>
  	 *         key:code["0":"成功","1":"失败"]
  	 */
      @RequestMapping(value="updateRecord",method=RequestMethod.POST)
      public @ResponseBody Map<String, Object> updateRecord(@RequestBody CommodityCategory record){
          Map<String,Object> map = new HashMap<String,Object>();
          String code="";
          try{
        	  commodityCategoryService.updateByPrimaryKeySelective(record);
              code="0";
          }catch(Exception e){
              code="1";
              e.printStackTrace();
          }
          map.put("code", code);
          return map;
      }
    
      /**
    	 * 功能描述：通过商户id查找分类
    	 * 作者：lijiaxing
    	 * url：${webRoot}/commodityCategory/selectByCompanyId
    	 * 请求方式：POST
    	 * @param   CompanyId
    	 * @return Map<String,Object>
    	 *         key:code["0":"成功","1":"失败"]
    	 *         key:companyCommodityList[查询结果list]
    	 *         key:total[记录总数]
    	 */
      @RequestMapping(value="selectByCompanyId",method=RequestMethod.POST)
        public @ResponseBody Map<String, Object> selectByCompanyId(@RequestBody int id){
            Map<String,Object> map = new HashMap<String,Object>();
            String code="";
            try{
            	List<CommodityCategory> companyCommodityList = commodityCategoryService.selectByCompanyId(id);
                code="0";
                map.put("companyCommodityList",companyCommodityList);
            }catch(Exception e){
                code="1";
                e.printStackTrace();
            }
            map.put("code", code);
            
            return map;
        }      
      
      
      /**
  		 * 功能描述：删除分类
  		 * 作者：lijiaxing
  		 * url：${webRoot}/commodityCategory/deleteRecord
  		 * 请求方式：POST
  		 * @param  主键id
  		 * @return Map<String,Object>
  		 *         key:code["0":"成功","1":"失败"]
  		 */
  	    @RequestMapping(value="deleteRecord",method=RequestMethod.POST)
  	    public @ResponseBody Map<String, Object> deleteRecord(@RequestBody int id){
  	        Map<String,Object> map = new HashMap<String,Object>();
  	        String code="";
  	        try{
  	        	commodityCategoryService.deleteByPrimaryKey(id);
  	            code="0";
  	        }catch(Exception e){
  	            code="1";
  	            e.printStackTrace();
  	        }
  	        map.put("code", code);
  	        return map;
  	    }
  	    
  	  /**
  		 * 功能描述：通过分类id查找详情
  		 * 作者：lijiaxing
  		 * url：${webRoot}/commodityCategory/getCommodityCategorydetail
  		 * 请求方式：POST
  		 * @param  主键id
  		 * @return Map<String,Object>
  		 *         key:code["0":"成功","1":"失败"]
  		 *         key:commodityCategory
  		 */
  	    @RequestMapping(value="getCommodityCategory",method=RequestMethod.POST)
  	    public @ResponseBody Map<String, Object> getCommodityCategorydetail(@RequestBody int id){
  	        Map<String,Object> map = new HashMap<String,Object>();
  	        String code="";
  	        try{
  	        	CommodityCategory commodityCategory = commodityCategoryService.selectByPrimaryKey(id);
  	        	map.put("commodityCategory", commodityCategory);
  	            code="0";
  	        }catch(Exception e){
  	            code="1";
  	            e.printStackTrace();
  	        }
  	        map.put("code", code);
  	        return map;
  	    }
  	    
  	    
}
