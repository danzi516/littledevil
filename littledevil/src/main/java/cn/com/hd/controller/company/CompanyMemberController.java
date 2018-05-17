package cn.com.hd.controller.company;

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
import cn.com.hd.domain.company.CompanyInfo;
import cn.com.hd.domain.company.CompanyMember;
import cn.com.hd.domain.uc.User;
import cn.com.hd.domain.uc.UserInfo;
import cn.com.hd.service.company.CompanyMemberService;
import cn.com.hd.service.uc.UserInfoService;
import cn.com.hd.service.uc.UserService;

@Controller
@RequestMapping("/companyMember")
public class CompanyMemberController {
	@Resource
	private CompanyMemberService companyMemberService;
	@Resource
	private UserService userService;
	@Resource
	private UserInfoService userInfoService;
	@Autowired
	HttpSession session;

	
	/**
	 * 功能描述：跳转到企业首页
	 * 作者：lijiaxing
	 * url：${webRoot}/companyMember/index
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/index")
	public  ModelAndView toIndex(){
		ModelAndView mv=new ModelAndView("company/index");
		return mv;
	}
	/**
	 * 功能描述：跳转到会员列表页面
	 * 作者：wanglin
	 * url：${webRoot}/companyMember/toCompanyMemberList
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/toCompanyMemberList")
	public  ModelAndView toCompanyMemberList(){
		ModelAndView mv=new ModelAndView("company/companyMember_list");
		return mv;
	}
	
	 /**
		 * 功能描述：跳转到会员详细页面
		 * 作者：lijiaxing
		 * url：${webRoot}/companyMember/CompanyMemberDetail/{id}
		 * 请求方式：GET
		 * @param id int
		 * @return ModelAndView
		 *          值 ：
		 * */
		@RequestMapping("/CompanyMemberDetail/{id}")
		public  ModelAndView userInfoDetail(@PathVariable("id") int id){
			ModelAndView mv=new ModelAndView("companyMember/companyMember_detail");
			UserInfo userInfo=userInfoService.selectByPrimaryKey(id);
			if(userInfo==null){
				userInfo=new UserInfo();
			}
			mv.addObject("userInfo", userInfo);
			return mv;
		}
	
	 /**
		 * 功能描述：跳转到会员添加页面
		 * 作者：wanglin
		 * url：${webRoot}/companyMember/toAddCompanyMember
		 * 请求方式：GET
		 * @param id int
		 * @return ModelAndView
		 *          值 ：含义【userInfo：个人扩展信息，user：帐号信息】
		 **/
		@RequestMapping("/toAddCompanyMember")
		public  ModelAndView toAddCompany(){
			ModelAndView mv=new ModelAndView("company/companyMember_add");
			return mv;
		}
	
		/**
		 * 功能描述：添加会员
		 * 作者：wanglin
		 * url：${webRoot}/companyMember/insertRecord
		 * 请求方式：POST
		 * @param  Page page
		 * @return Map<String,Object>
		 *         key:code["0":"成功","1":"失败"]
		 *         key:rows[查询结果ist]
		 *         key:total[记录总数]
		 */
	    @RequestMapping(value="insertRecord",method=RequestMethod.POST)
	    public @ResponseBody Map<String, Object> insertRecord(@RequestBody CompanyMember record){
	        Map<String,Object> map = new HashMap<String,Object>();
	        String code="";
	        try{
	        		if(userService.selectByCondition(record.getUser())==null){
		        		User user=record.getUser();
		        		UserInfo Userinfo=record.getUserInfo();
		        		String aaa = record.getUser().getPhone().toString();
		        		user.setUserName(aaa);
		        		user.setPassword(MD5Encrypt.getMD5Code("123456"));
			        	userService.insertSelective(user);
			        	record.setUserId(user.getId());
			        	Userinfo.setId(user.getId());
			        	userInfoService.insert(Userinfo);
			        	companyMemberService.insert(record);
			        	code="0";
	        		}
		        	else{
		        		record.setUserId(userService.selectByCondition(record.getUser()).getId());
		        		if(companyMemberService.selectByCondition(record)==null){
		        			record.setUserId(userService.selectByCondition(record.getUser()).getId());
			        		companyMemberService.insert(record);
			        		code="0";
		        		}
		        		else{code="已经存在";}
		        	}
	        }catch(Exception e){
	            code="1";
	            e.printStackTrace();
	        }
	        map.put("code", code);
	        return map;
	    }
	    
	    /**
		 * 功能描述：分页查询所有企业会员
		 * 作者：lijiaxing
		 * url：${webRoot}/companyMember/selectListByPage
		 * 请求方式：POST
		 * @param  Page page
		 * @return Map<String,Object>
		 *         key:code["0":"成功","1":"失败"]
		 *         key:rows[查询结果ist]
		 *         key:total[记录总数]
		 */
	    @RequestMapping(value="selectListByPage",method=RequestMethod.POST)
	    public @ResponseBody Map<String, Object> selectListByPage(Page page){
	        Map<String,Object> map = new HashMap<String,Object>();
	        String code="";
	        try{
	            page = companyMemberService.selectCompanyMemberByPage(page);
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
		 * 功能描述：删除会员
		 * 作者：lijiaxing
		 * url：${webRoot}/companyMember/deleteRecord
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
	        	companyMemberService.deleteByPrimaryKey(id);
	            code="0";
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
		 * url：${webRoot}/companyMember/updateRecord
		 * 请求方式：POST
		 * @param  Page page
		 * @return Map<String,Object>
		 *         key:code["0":"成功","1":"失败"]
		 *         key:rows[查询结果ist]
		 *         key:total[记录总数]
		 */
	    @RequestMapping(value="updateRecord",method=RequestMethod.POST)
	    public @ResponseBody Map<String, Object> updateRecord(@RequestBody CompanyMember record){
	        Map<String,Object> map = new HashMap<String,Object>();
	        String code="";
	        try{
	        	User user=record.getUser();
	        	//userService.updateByPrimaryKeySelective(user);
	        	companyMemberService.updateByPrimaryKeySelective(record);
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
	   	 * 作者：lijiaxing
	   	 * url：${webRoot}/companyMember/selectRecordById
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
	        	   CompanyMember record=companyMemberService.selectByPrimaryKey(id);
	               code="0";
	               map.put("MemberConsume",record);
	           }catch(Exception e){
	               code="1";
	               e.printStackTrace();
	           }
	           map.put("code", code);
	           return map;
	       }
	       
	       /**
		   	 * 功能描述：通过会员id查找商户
		   	 * 作者：lijiaxing
		   	 * url：${webRoot}/companyMember/selectByUserId
		   	 * 请求方式：POST
		   	 * @param  id
		   	 * @return Map<String,Object>
		   	 *         key:code["0":"成功","1":"失败"]
		   	 *         key:CompanyInfo[CompanyInfo]
		   	 */
		       @RequestMapping(value="selectByUserId",method=RequestMethod.POST)
		       public @ResponseBody Map<String, Object> selectByUserId(@RequestBody int id){
		           Map<String,Object> map = new HashMap<String,Object>();
		           String code="";
		           try{
		        	   List<CompanyMember> record=companyMemberService.selectCompanyMemberByuserId(id);
		               code="0";
		               map.put("CompanyMemberList",record);
		           }catch(Exception e){
		               code="1";
		               e.printStackTrace();
		           }
		           map.put("code", code);
		           return map;
		       }
}
