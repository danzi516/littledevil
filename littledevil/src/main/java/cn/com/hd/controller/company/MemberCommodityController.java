package cn.com.hd.controller.company;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import cn.com.hd.domain.company.MemberCommodity;
import cn.com.hd.domain.company.MemberConsume;
import cn.com.hd.domain.uc.User;
import cn.com.hd.domain.uc.UserInfo;
import cn.com.hd.service.company.CompanyCommodityService;
import cn.com.hd.service.company.CompanyInfoService;
import cn.com.hd.service.company.CompanyMemberService;
import cn.com.hd.service.company.MemberCommodityService;
import cn.com.hd.service.company.MemberConsumeService;
import cn.com.hd.service.uc.UserInfoService;
import cn.com.hd.service.uc.UserService;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/memberCommodity")
public class MemberCommodityController {
	@Resource
	private MemberConsumeService memberConsumeService;
	@Resource
	private UserService userService;
	@Resource
	private UserInfoService userInfoService;
	@Resource
	private CompanyCommodityService companyCommodityService;
	@Resource
	private CompanyMemberService companyMemberService;
	@Resource
	private MemberCommodityService memberCommodityService;
	@Autowired
	HttpSession session;
	/**
	 * 功能描述：跳转到消费列表页面
	 * 作者：lijiaxing
	 * url：${webRoot}/memberCommodity/toMemberConsumeList/{id}
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/toMemberConsumeList/{id}")
	public  ModelAndView toMemberConsumeList(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("company/memberConsume_list");
		mv.addObject("companyMemberId",id);
		return mv;
	}
	 /**
	 * 功能描述：跳转到消费添加页面
	 * 作者：lijiaxing
	 * url：${webRoot}/memberCommodity/toAddMemberConsume/{id}
	 * 请求方式：GET
	 * @param companyMember
	 * @return ModelAndView
	 *          值 ：含义【userInfo：个人扩展信息，user：帐号信息】
	 **/
	@RequestMapping("toAddMemberConsume/{id}")
	public  ModelAndView toAddMemberConsume(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("company/memberConsume_add");
		CompanyMember companyMember=companyMemberService.selectByPrimaryKey(id);
		UserInfo userInfo=userInfoService.selectByPrimaryKey(companyMember.getUserId());
		User user=userService.selectByPrimaryKey(companyMember.getUserId());
		User record = (User) session.getAttribute("user");
		List<CompanyCommodity> companyCommodityList = companyCommodityService.selectByCompanyId(record.getId());
		List<String> companyCommodity = new ArrayList<String>();
		for (int i =0;i<=companyCommodityList.size()-1;i++){
			JSONObject json = JSONObject.fromObject(companyCommodityList.get(i));
			companyCommodity.add(json.toString());
		}
		mv.addObject("userInfo", userInfo);
		mv.addObject("user", user);
		mv.addObject("companyCommodity", companyCommodity);
		mv.addObject("companyMember", companyMember);
		return mv;
	}
	/**
	 * 功能描述：跳转详细页面
	 * 作者：lijiaxing
	 * url：${webRoot}/memberCommodity/toEditMemberConsume/{id}
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 *          值 ：含义【userInfo：个人扩展信息，user：帐号信息】
	 **/
	@RequestMapping("/toEditCompany/{id}")
	public  ModelAndView toEditCompany(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("company/memberConsume_edit");
		MemberConsume record=memberConsumeService.selectByPrimaryKey(id);
		mv.addObject("record", record);
		return mv;
	}
	
	/**
   	 * 功能描述：查询单个
   	 * 作者：lijiaxing
   	 * url：${webRoot}/memberCommodity/selectRecordById
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
        	   MemberCommodity record=memberCommodityService.selectByPrimaryKey(id);
               code="0";
               map.put("MemberCommodity",record);
           }catch(Exception e){
               code="1";
               e.printStackTrace();
           }
           map.put("code", code);
           return map;
       }
    
	
	/**
	 * 功能描述：分页查询所有记录
	 * 作者：lijiaxing
	 * url：${webRoot}/memberCommodity/selectListByPage
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
            page = memberCommodityService.selectByPage(page);
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
	 * 功能描述：分页查询-根据商户
	 * 作者：lijiaxing
	 * url：${webRoot}/memberCommodity/selectPageByCompanyId
	 * 请求方式：POST
	 * @param  Page page
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 *         key:rows[查询结果list]
	 *         key:total[记录总数]
	 */
    @RequestMapping(value="selectPageByCompanyId",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectPageByCompanyId(Page page){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
            page = memberCommodityService.selectPageByCompanyId(page);
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
	 * 功能描述：添加消费记录
	 * 作者：lijiaxing
	 * url：${webRoot}/memberCommodity/memberConsume
	 * 请求方式：POST
	 * @param  Page page
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 *         key:rows[查询结果ist]
	 *         key:total[记录总数]
	 */
    @RequestMapping(value="memberConsume",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> memberConsume(@RequestBody MemberConsume record){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try {
        	CompanyMember companyMember = new CompanyMember();
        	companyMember.setCompanyId(record.getCompanyId());
    	    companyMember.setUserId(record.getUserId());
    		int oldCash = companyMemberService.selectCompanyMemberByuserIdAndcompanyId(companyMember).getCash();
    		int cash = oldCash - record.getConsumeCash();
    		  if(record.getCommodityId()==0){  //现金
    	        	if(cash<0){
    	        		 code="2";//余额不足
    	        	}
    	        	else{
    	        		memberConsumeService.insert(record);
    	        		companyMember.setCash(cash);
    	        		companyMember.setId(companyMemberService.selectCompanyMemberByuserIdAndcompanyId(companyMember).getId());
    	        		companyMemberService.updateByPrimaryKeySelective(companyMember);
    	        		 code="0";
    	        	}
    	        }
    		  else{  //非现金
    			  MemberCommodity memberCommodity = new MemberCommodity();
    			  memberCommodity.setCommodityId(record.getCommodityId());
    			  memberCommodity.setCompanyId(record.getCompanyId());
    			  memberCommodity.setUserId(record.getUserId());
				  memberCommodity = memberCommodityService.selectMemberCommodityByuserIdAndcommodityId(memberCommodity);
    			  int number = memberCommodity.getNumber()-record.getConsumeNumber();
    			  if(number<0){
    				  code="3";//次数不足
    			  }
    			  else{
    				  memberConsumeService.insert(record);
    				  memberCommodity.setNumber(number);
    				  memberCommodityService.updateByPrimaryKey(memberCommodity);
    				  code="0";
    			  }
    		  }
    	} catch (NumberFormatException e) {
    	    e.printStackTrace();
    	    code="1";
    	}
        map.put("code", code);
        return map;
    }
    
    /**
	 * 功能描述：更新
	 * 作者：lijiaxing
	 * url：${webRoot}/memberCommodity/updateRecord
	 * 请求方式：POST
	 * @param  MemberConsume
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
    @RequestMapping(value="updateRecord",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> updateRecord(@RequestBody MemberCommodity record){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
        	memberCommodityService.updateByPrimaryKeySelective(record);
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
	 * 作者：lijiaxing
	 * url：${webRoot}/memberCommodity/deleteRecord
	 * 请求方式：POST
	 * @param  id
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
    @RequestMapping(value="deleteRecord",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> deleteRecord(@RequestBody int id){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
        	userService.deleteByPrimaryKey(id);
        	memberConsumeService.deleteByPrimaryKey(id);
            code="0";
        }catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
    }
    
    /**
	 * 功能描述：添加
	 * 作者：lijiaxing
	 * url：${webRoot}/memberCommodity/insertRecord
	 * 请求方式：POST
	 * @param  CompanyInfo
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
    @RequestMapping(value="insertRecord",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> insertRecord(@RequestBody MemberCommodity record){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
        	memberCommodityService.insertSelective(record);
            code="0";
        }catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
    }
}
