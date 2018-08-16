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
import cn.com.hd.domain.company.CompanyRechargeLog;
import cn.com.hd.domain.company.MemberConsume;
import cn.com.hd.domain.uc.User;
import cn.com.hd.domain.uc.UserInfo;
import cn.com.hd.service.company.CompanyRechargeLogService;
import cn.com.hd.service.uc.UserService;

@Controller
@RequestMapping("/companyRechargeLogService")
public class CompanyRechargeLogController {
	@Resource
	private CompanyRechargeLogService companyRechargeLogService;
	@Resource
	private UserService userService;
	
	
	/**
	 * 功能描述：分页查询
	 * 作者：wanglin
	 * url：${webRoot}/companyInfo/selectByPage
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
            page = companyRechargeLogService.selectByPage(page);
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
	 * 功能描述：添加
	 * 作者：wanglin
	 * url：${webRoot}/companyInfo/insertRecord
	 * 请求方式：POST
	 * @param  Page page
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 *         key:rows[查询结果ist]
	 *         key:total[记录总数]
	 */
    @RequestMapping(value="insertRecord",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> insertRecord(@RequestBody CompanyRechargeLog record){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
        	companyRechargeLogService.insertSelective(record);
            code="0";
        }catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
    }
    
    
    /**
	 * 功能描述：删除
	 * 作者：wanglin
	 * url：${webRoot}/companyInfo/deleteRecord
	 * 请求方式：POST
	 * @param  Page page
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 *         key:rows[查询结果ist]
	 *         key:total[记录总数]
	 */
    @RequestMapping(value="deleteRecord",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> deleteRecord(@RequestBody int id){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
        	companyRechargeLogService.deleteByPrimaryKey(id);
            code="0";
        }catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
    }
    
    /**
   	 * 功能描述：查询单个
   	 * 作者：wanglin
   	 * url：${webRoot}/companyInfo/selectRecordById
   	 * 请求方式：POST
   	 * @param  id
   	 * @return Map<String,Object>
   	 *         key:code["0":"成功","1":"失败"]
   	 *         key:CompanyInfo[CompanyInfo]
   	 */
       @RequestMapping(value="selectRecordById",method=RequestMethod.POST)
       public @ResponseBody Map<String, Object> selectRecordById(@RequestBody int id){
           Map<String,Object> map = new HashMap<String,Object>();
           String code="";
           try{
        	   CompanyRechargeLog record=companyRechargeLogService.selectByPrimaryKey(id);
               code="0";
               map.put("MemberConsume",record);
           }catch(Exception e){
               code="1";
               e.printStackTrace();
           }
           map.put("code", code);
           return map;
       }
}
