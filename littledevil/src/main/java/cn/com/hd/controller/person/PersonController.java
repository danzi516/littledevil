package cn.com.hd.controller.person;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import cn.com.hd.domain.company.CompanyMember;
import cn.com.hd.domain.company.CompanyStaff;
import cn.com.hd.domain.company.MemberCommodity;
import cn.com.hd.domain.company.MemberConsume;
import cn.com.hd.domain.person.myCompany;
import cn.com.hd.domain.uc.SaleMan;
import cn.com.hd.domain.uc.User;
import cn.com.hd.domain.uc.UserFollow;
import cn.com.hd.domain.uc.UserInfo;
import cn.com.hd.service.company.CompanyMemberService;
import cn.com.hd.service.company.CompanyStaffService;
import cn.com.hd.service.company.MemberCommodityService;
import cn.com.hd.service.company.MemberConsumeService;
import cn.com.hd.service.uc.SaleManService;
import cn.com.hd.service.uc.UserFollowService;
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
	
	@Resource
	private CompanyMemberService companyMemberService;
	
	@Resource
	private MemberConsumeService memberConsumeService;
	
	@Resource
	private MemberCommodityService memberCommodityService;
	
	@Resource
	private UserFollowService userFollowService;

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
	 * url：${webRoot}/person/memberSet
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/memberSet/{id}")
	public  ModelAndView memberSet(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("person/member_set");
		UserInfo userInfo=userInfoService.selectByPrimaryKey(id);
		if(userInfo==null){
			userInfo=new UserInfo();
		}
		mv.addObject("userInfo", userInfo);
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
	@RequestMapping("/storeList/{id}")
	public  ModelAndView storeList(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("person/store_list");
		List<CompanyMember> list = companyMemberService.selectCompanyMemberByuserId(id);
		for(int i=0;i<list.size();i++){
			list.get(i).getCompanyId();
		}
		return mv;
	}
	
	/**
	 * 功能描述：跳转到我的关注商店
	 * 作者：lijiaxing
	 * url：${webRoot}/person/followList
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/followList/{id}")
	public  ModelAndView followList(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("person/follow_list");
		return mv;
	}
	
	/**
	 * 功能描述：跳转到我的记录
	 * 作者：lijiaxing
	 * url：${webRoot}/person/recordList
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/recordList/{id}")
	public  ModelAndView recordList(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("person/record_list");
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
	
	/**
	 * 功能描述：更新用户
	 * 作者：lijiaxing
	 * url：${webRoot}/person/update
	 * 请求方式：POST
	 * @param  id
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
	@RequestMapping(value="update",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> updatePerson(@RequestBody UserInfo user){
		Map<String,Object> map=new HashMap<String,Object>();
		String code="";
		try{
			/*User record=userInfoService.selectByPrimaryKey(user.getId()).getUser();
			userService.updateByPrimaryKeySelective(record);*/
			userInfoService.updateByPrimaryKeySelective(user);
			
			code="0";
		}catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
	}
	
	/**
	 * 功能描述：根据用户id获取公司-我的商户
	 * 作者：lijiaxing
	 * url：${webRoot}/person/getCompanybyUserid
	 * 请求方式：POST
	 * @param  id
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
	@RequestMapping("/getCompanybyUserid/{id}")
	public @ResponseBody Map<String,Object> getCompanybyUserid(@PathVariable("id") int userId){
		Map<String,Object> map=new HashMap<String,Object>();
		ArrayList<myCompany> userConsumelist=new ArrayList<myCompany>() ;
		String code="";
		try{
			List<CompanyMember> CompanyMemberlist =	companyMemberService.selectCompanyMemberByuserId(userId);
			for(int i=0;i<CompanyMemberlist.size();i++){
				myCompany myCompany = new myCompany();
				String cash = CompanyMemberlist.get(i).getCash(); //剩余金额
				int companyId=CompanyMemberlist.get(i).getCompanyId();
				MemberCommodity record = new MemberCommodity();   
				record.setCompanyId(companyId);
				record.setUserId(userId);
				List<MemberCommodity>	MemberConsumelist = memberCommodityService.selectMemberCommodityByuserIdAndcompanyId(record);
				String companyName = CompanyMemberlist.get(i).getCompanyInfo().getCompanyName(); //商店名称
				String creatTime = CompanyMemberlist.get(i).getCreatTime();//创建时间
				String lastConsume;//最后一次消费时间
				String item="|";//剩余项目
				if(MemberConsumelist.size()!=0){
					lastConsume = MemberConsumelist.get(0).getCompanyCommodity().getCommodityName()+"("+MemberConsumelist.get(0).getConsumeTime()+")"; 
					for(int j=0;j<MemberConsumelist.size();j++){
						String itemOne= MemberConsumelist.get(j).getCompanyCommodity().getCommodityName()+"("+MemberConsumelist.get(j).getNumber()+")"+ "|";
						item = item+ itemOne;
					}
				}else{
					lastConsume = "没有消费";
					item = "没有购买项目";
				}
				
				int sumNumber = memberCommodityService.sumNumberByuserIdAndcompanyId(record);//总消费
				
				
				myCompany.setCash(cash);
				myCompany.setCompanyName(companyName);
				myCompany.setCreatTime(creatTime);
				myCompany.setItem(item);
				myCompany.setLastConsume(lastConsume);
				myCompany.setSumNumber(sumNumber);
				userConsumelist.add(myCompany);
			}
			map.put("userConsumelist", userConsumelist);
			code="0";
		}catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
	}
	
	/**
	 * 功能描述：根据用户id获取公司-我关注的商户
	 * 作者：lijiaxing
	 * url：${webRoot}/person/getCompanyNumberbyUserid
	 * 请求方式：POST
	 * @param  id
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
	@RequestMapping("/getCompanyNumberbyUserid/{id}")
	public @ResponseBody Map<String,Object> selectCompanyByuserId(@PathVariable("id") int userId){
		Map<String,Object> map=new HashMap<String,Object>();
		String code="";
		try{
			List<UserFollow> userFollowlist=userFollowService.selectCompanyByuserId(userId);
			map.put("userFollowlist", userFollowlist);
			code="0";
		}catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
	}
	
	/**
	 * 功能描述：根据用户id获取公司-我关注的商户
	 * 作者：lijiaxing
	 * url：${webRoot}/person/selectMemberConsumeByuserId
	 * 请求方式：POST
	 * @param  id
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
	@RequestMapping("/selectMemberConsumeByuserId/{id}")
	public @ResponseBody Map<String,Object> selectMemberConsumeByuserId(@PathVariable("id") int userId){
		Map<String,Object> map=new HashMap<String,Object>();
		String code="";
		try{
			List<MemberConsume> memberConsumelist=memberConsumeService.selectMemberConsumeByuserId(userId);
			map.put("memberConsumelist", memberConsumelist);
			code="0";
		}catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
	}
	
}
