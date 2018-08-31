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
import cn.com.hd.domain.company.CommodityPromotion;
import cn.com.hd.domain.company.CompanyInfo;
import cn.com.hd.domain.company.CompanyMember;
import cn.com.hd.domain.uc.User;
import cn.com.hd.domain.uc.UserInfo;
import cn.com.hd.service.company.CommodityPromotionService;

/**
 *类说明：商品活动关联
 *@author lijiaxing 2016/10/17
 *${webRoot}:系统运行根目录 
 **/
@Controller
@RequestMapping("/commodityPromotion")
public class CommodityPromotionController {
	@Resource
	private CommodityPromotionService commodityPromotionService;
	
	
	
	/**
	 * 功能描述：添加记录
	 * 作者：wanglin
	 * url：${webRoot}/CommodityPromotion/insertRecord
	 * 请求方式：POST
	 * @param  CommodityPromotion record
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
    @RequestMapping(value="insertRecord",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> insertRecord(@RequestBody CommodityPromotion record){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
        	commodityPromotionService.insert(record);
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
	 * url：${webRoot}/CommodityPromotion/selectByPage
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
            page = commodityPromotionService.selectByPage(page);
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
  	 * url：${webRoot}/CommodityPromotion/updateRecord
  	 * 请求方式：POST
  	 * @param   CommodityPromotion
  	 * @return Map<String,Object>
  	 *         key:code["0":"成功","1":"失败"]
  	 */
      @RequestMapping(value="updateRecord",method=RequestMethod.POST)
      public @ResponseBody Map<String, Object> update(@RequestBody CommodityPromotion record){
          Map<String,Object> map = new HashMap<String,Object>();
          String code="";
          try{
        	  commodityPromotionService.updateByPrimaryKeySelective(record);
              code="0";
          }catch(Exception e){
              code="1";
              e.printStackTrace();
          }
          map.put("code", code);
          return map;
      }
    
      /**
    	 * 功能描述：通过商户id查找
    	 * 作者：lijiaxing
    	 * url：${webRoot}/CommodityPromotion/selectByCompanyId
    	 * 请求方式：POST
    	 * @param   CompanyId
    	 * @return Map<String,Object>
    	 *         key:code["0":"成功","1":"失败"]
    	 *         key:CommodityPromotionList[查询结果list]
    	 */
      @RequestMapping(value="selectByCompanyId",method=RequestMethod.POST)
        public @ResponseBody Map<String, Object> selectByCompanyId(@RequestBody int id){
            Map<String,Object> map = new HashMap<String,Object>();
            String code="";
            try{
            	List<CommodityPromotion> CommodityPromotionList = commodityPromotionService.selectByCompanyId(id);
                code="0";
                map.put("CommodityPromotionList",CommodityPromotionList);
            }catch(Exception e){
                code="1";
                e.printStackTrace();
            }
            map.put("code", code);
            
            return map;
        } 
      
      /**
  	 * 功能描述：通过id查找
  	 * 作者：lijiaxing
  	 * url：${webRoot}/CommodityPromotion/selectRecordById
  	 * 请求方式：POST
  	 * @param   id
  	 * @return Map<String,Object>
  	 *         key:code["0":"成功","1":"失败"]
  	 *         key:commodityPromotion
  	 */
    @RequestMapping(value="selectRecordById",method=RequestMethod.POST)
      public @ResponseBody Map<String, Object> selectRecordById(@RequestBody int id){
          Map<String,Object> map = new HashMap<String,Object>();
          String code="";
          try{
          	CommodityPromotion commodityPromotion = commodityPromotionService.selectByPrimaryKey(id);
              code="0";
              map.put("commodityPromotion",commodityPromotion);
          }catch(Exception e){
              code="1";
              e.printStackTrace();
          }
          map.put("code", code);
          
          return map;
      } 
    
    /**
   	 * 功能描述：删除关联
   	 * 作者：lijiaxing
   	 * url：${webRoot}/CommodityPromotion/deleteRecord
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
        	   commodityPromotionService.deleteByPrimaryKey(id);
               code="0";
           }catch(Exception e){
               code="1";
               e.printStackTrace();
           }
           map.put("code", code);
           return map;
       }  
       
       /**
		   	 * 功能描述：通过属性查找
		   	 * 作者：lijiaxing
		   	 * url：${webRoot}/CommodityPromotion/selectBySelective
		   	 * 请求方式：POST
		   	 * @param  CompanyMember
		   	 * @return Map<String,Object>
		   	 *         key:code["0":"成功","1":"失败"]
		   	 *         key:CompanyMemberList[CompanyMemberList]
		   	 */
		       @RequestMapping(value="selectBySelective",method=RequestMethod.POST)
		       public @ResponseBody Map<String, Object> selectBySelective(@RequestBody CommodityPromotion record){
		           Map<String,Object> map = new HashMap<String,Object>();
		           String code="";
		           try{
		        	   List<CommodityPromotion> CommodityPromotionList=commodityPromotionService.selectBySelective(record);
		               code="0";
		               map.put("CommodityPromotionList",CommodityPromotionList);
		           }catch(Exception e){
		               code="1";
		               e.printStackTrace();
		           }
		           map.put("code", code);
		           return map;
		       }
       
       
}
