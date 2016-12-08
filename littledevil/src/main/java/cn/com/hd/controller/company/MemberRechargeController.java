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
import cn.com.hd.domain.company.MemberConsume;
import cn.com.hd.domain.company.MemberRecharge;
import cn.com.hd.domain.uc.User;
import cn.com.hd.domain.uc.UserInfo;
import cn.com.hd.service.company.CompanyCommodityService;
import cn.com.hd.service.company.CompanyInfoService;
import cn.com.hd.service.company.CompanyMemberService;
import cn.com.hd.service.company.MemberRechargeService;
import cn.com.hd.service.company.MemberRechargeService;
import cn.com.hd.service.uc.UserInfoService;
import cn.com.hd.service.uc.UserService;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/memberRecharge")
public class MemberRechargeController {
	@Resource
	private MemberRechargeService memberRechargeService;
	@Resource
	private UserService userService;
	@Resource
	private UserInfoService userInfoService;
	@Resource
	private CompanyCommodityService companyCommodityService;
	@Resource
	private CompanyMemberService companyMemberService;
	@Autowired
	HttpSession session;
	/**
	 * 功能描述：跳转到消费列表页面
	 * 作者：lijiaxing
	 * url：${webRoot}/memberRecharge/toMemberRechargeList/{id}
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/toMemberRechargeList/{id}")
	public  ModelAndView toMemberConsumeList(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("company/memberRecharge_list");
		mv.addObject("companyMemberId",id);
		return mv;
	}
	 /**
	 * 功能描述：跳转到充值添加页面
	 * 作者：lijiaxing
	 * url：${webRoot}/memberRecharge/toAddMemberRecharge/{id}
	 * 请求方式：POST
	 * @param companyMember
	 * @return ModelAndView
	 *          值 ：含义【userInfo：个人扩展信息，user：帐号信息】
	 **/
	@RequestMapping("toAddMemberRecharge/{id}")
	public  ModelAndView toAddMemberConsume(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("company/memberRecharge_add");
		CompanyMember companyMember=companyMemberService.selectByPrimaryKey(id);
		UserInfo userInfo=userInfoService.selectByPrimaryKey(companyMember.getUserId());
		User user=userService.selectByPrimaryKey(companyMember.getUserId());
		List<CompanyCommodity> companyCommodityList = companyCommodityService.selectByCompanyId(companyMember.getCompanyId());
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
	 * url：${webRoot}/memberConsume/toEditMemberConsume/{id}
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 *          值 ：含义【userInfo：个人扩展信息，user：帐号信息】
	 **/
	@RequestMapping("/toEditCompany/{id}")
	public  ModelAndView toEditCompany(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("company/memberConsume_edit");
		MemberRecharge record=memberRechargeService.selectByPrimaryKey(id);
		mv.addObject("record", record);
		return mv;
	}

	
	/**
	 * 功能描述：分页查询所有消费记录
	 * 作者：lijiaxing
	 * url：${webRoot}/memberRecharge/selectByPage
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
            page = memberRechargeService.selectCompanyByPage(page);
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
	 * url：${webRoot}/memberRecharge/insert
	 * 请求方式：POST
	 * @param  Page page
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 *         key:rows[查询结果ist]
	 *         key:total[记录总数]
	 */
    @RequestMapping(value="insert",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> insert(@RequestBody MemberRecharge record){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
        	memberRechargeService.insert(record);
            code="0";
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
	 * url：${webRoot}/memberRecharge/update
	 * 请求方式：POST
	 * @param  Page page
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 *         key:rows[查询结果ist]
	 *         key:total[记录总数]
	 */
    @RequestMapping(value="update",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> update(@RequestBody MemberRecharge record){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
        	User user=record.getUser();
        	userService.updateByPrimaryKeySelective(user);
        	memberRechargeService.updateByPrimaryKeySelective(record);
            code="0";
        }catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
    }
    
    /**
	 * 功能描述：分页查询所有企业
	 * 作者：lijiaxing
	 * url：${webRoot}/memberRecharge/update
	 * 请求方式：POST
	 * @param  Page page
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 *         key:rows[查询结果ist]
	 *         key:total[记录总数]
	 */
    @RequestMapping(value="delete/{id}",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> delete(@PathVariable("id") int id){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
        	userService.deleteByPrimaryKey(id);
        	memberRechargeService.deleteByPrimaryKey(id);
            code="0";
        }catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
    }
}
