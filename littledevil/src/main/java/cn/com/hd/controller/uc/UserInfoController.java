package cn.com.hd.controller.uc;

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
import cn.com.hd.domain.company.CompanyInfo;
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
@RequestMapping("/userInfo")
public class UserInfoController {
	@Resource
	private UserInfoService userInfoService;
	
	@Resource
	private UserService userService;
	
	@Resource
	private SaleManService saleManService;
	
	@Resource
	private CompanyStaffService companyStaffService;
	
	

    
    
    
/********************后台用户方法***********************/
    /**
	 * 功能描述：跳转到个人详细页面
	 * 作者：lijiaxing
	 * url：${webRoot}/userInfo/userInfoDetail/{id}
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 *          值 ：含义【userInfo：个人扩展信息，user：帐号信息】
	 * */
	@RequestMapping("/userInfoDetail/{id}")
	public  ModelAndView userInfoDetail(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("sys/person_user_detail");
		UserInfo userInfo=userInfoService.selectByPrimaryKey(id);
		if(userInfo==null){
			userInfo=new UserInfo();
		}
		mv.addObject("userInfo", userInfo);
		return mv;
	}
	
	/**
	 *方法说明：跳转到添加后台用户页面
	 *url:${webRoot}/userInfo/toAddUser
	 *请求方式：get
	 *@return ModelAndView
	 **/
	@RequestMapping("/toAddUser")
	public ModelAndView toAddUser(HttpServletRequest request) {
		/**
		 * 想要在页面展现数据,必须返回ModelAndView类型,返回String是不能获取数据的
		 * */
		ModelAndView modelView = new ModelAndView();
		
		modelView.setViewName("sys/sys_user_add");// 設置視圖名稱

		return modelView;
	}
	
	/**
	 *方法说明：跳转到修改后台用户页面
	 *url:${webRoot}/userInfo/toEditUser/{id}
	 *请求方式：get
	 *@return ModelAndView
	 **/
	@RequestMapping("/toEditUser/{id}")
	public ModelAndView toEditUser(@PathVariable("id") int id) {
		/**
		 * 想要在页面展现数据,必须返回ModelAndView类型,返回String是不能获取数据的
		 * */
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("sys/sys_user_edit");// 設置視圖名稱
		UserInfo record=userInfoService.selectByPrimaryKey(id);
		modelView.addObject("userInfo", record);
		return modelView;
	}
	
/********************前台普通用户方法***********************/	
	/**
	 *方法说明：跳转到添加普通用户页面
	 *url:${webRoot}/userInfo/toAddPerson
	 *请求方式：get
	 *@return ModelAndView
	 **/
	@RequestMapping("/toAddPerson")
	public ModelAndView toAddPerson(HttpServletRequest request) {
		/**
		 * 想要在页面展现数据,必须返回ModelAndView类型,返回String是不能获取数据的
		 * */
		ModelAndView modelView = new ModelAndView();
		
		modelView.setViewName("person/person_user_add");// 設置視圖名稱

		return modelView;
	}
	
	/**
	 *方法说明：跳转到修改普通用户页面
	 *url:${webRoot}/userInfo/toEditPerson
	 *请求方式：get
	 *@return ModelAndView
	 **/
	@RequestMapping("/toEditPerson/{id}")
	public ModelAndView toEditPerson(@PathVariable("id") int id) {
		/**
		 * 想要在页面展现数据,必须返回ModelAndView类型,返回String是不能获取数据的
		 * */
		ModelAndView modelView = new ModelAndView();
		
		modelView.setViewName("person/person_user_edit");// 設置視圖名稱
		UserInfo record=userInfoService.selectByPrimaryKey(id);
		if(saleManService.selectByPrimaryKey(id)!=null){
			if(saleManService.selectByPrimaryKey(id).getState().equals("1")){
				record.setSaleState("1");
			}
			else{
				record.setSaleState("0");
			}
		}
		modelView.addObject("userInfo", record);
		return modelView;
	}
	
	
	
	/**
	 * 功能描述：删除用户
	 * 作者：lijiaxing
	 * url：${webRoot}/userInfo/deleteRecord
	 * 请求方式：GET
	 * @param  id
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
	@RequestMapping(value="deleteRecord",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> deleteRecord(@RequestBody int id){
		Map<String,Object> map=new HashMap<String,Object>();
		String code="";
		try{
			userService.deleteByPrimaryKey(id);
			userInfoService.deleteByPrimaryKey(id);
			code="0";
		}catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
	}
/********************公用用户方法***********************/	
	
	/**
	 * 功能描述：分页查询所有用户
	 * 作者：lijiaxing
	 * url：${webRoot}/userInfo/selectUserInfoByPage
	 * 请求方式：POST
	 * @param  Page page   通过身份userType区分后台用户和普通个人用户
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 *         key:rows[查询结果ist]
	 *         key:total[记录总数]
	 */
    @RequestMapping(value="selectUserInfoByPage",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectByPage(Page page){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
            page = userInfoService.selectUserInfoByPage(page);
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
	 * 功能描述：添加用户
	 * 作者：lijiaxing
	 * url：${webRoot}/userInfo/insertRecord
	 * 请求方式：POST
	 * @param  id
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
	@RequestMapping(value="insertRecord",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> insertRecord(@RequestBody UserInfo user){
		Map<String,Object> map=new HashMap<String,Object>();
		String code="";
		try{
			User record=user.getUser();
			record.setPassword(MD5Encrypt.getMD5Code(record.getPassword()));
			userService.insertSelective(record);
			user.setId(record.getId());
			userInfoService.insertSelective(user);
			if(user.getRoleId()!=null){//没有角色id的就是普通用户，不进里面
				CompanyStaff companyStaff = new CompanyStaff();
				companyStaff.setCompanyId(0);
				companyStaff.setRoleId(user.getRoleId());
				companyStaff.setUserId(record.getId());
				companyStaff.setIsDelete("1");
				companyStaffService.insert(companyStaff);
			}
			if(user.getSaleState().equals("1")){//赋予了业务员身份，写入数据库
				SaleMan saleMan = new SaleMan();
				saleMan.setId(record.getId());
				saleMan.setState("1");
				saleManService.insert(saleMan);
			}
			code="0";
		}catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
	}
	
	/**
	 * 功能描述：更新用户
	 * 作者：lijiaxing
	 * url：${webRoot}/userInfo/updateRecord
	 * 请求方式：POST
	 * @param  id
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
	@RequestMapping(value="updateRecord",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> updateRecord(@RequestBody UserInfo user){
		Map<String,Object> map=new HashMap<String,Object>();
		String code="";
		try{
			User record=user.getUser();
			SaleMan saleMan = new SaleMan();
			saleMan.setId(record.getId());
			saleMan.setState(user.getSaleState());
			userService.updateByPrimaryKeySelective(record);
			userInfoService.updateByPrimaryKeySelective(user);
			if(user.getSaleState().equals("1")){//赋予了业务员身份
				if(saleManService.selectByPrimaryKey(user.getId())!=null){
					saleManService.updateByPrimaryKey(saleMan);
				}
				else{
					saleManService.insert(saleMan);
				}
			}
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
   	 * url：${webRoot}/userInfo/selectRecordById
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
        	   UserInfo record=userInfoService.selectByPrimaryKey(id);
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
