package cn.com.hd.controller.company;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyRole;
import cn.com.hd.service.company.CompanyRoleService;
import cn.com.hd.service.uc.UserService;

@Controller
@RequestMapping("/companyRole")
public class CompanyRoleController {
	@Resource
	private CompanyRoleService companyRoleService;
	@Resource
	private UserService userService;
	/**
	 * 功能描述：跳转到列表页面
	 * 作者：lijiaxing
	 * url：${webRoot}/companyRole/toCompanyRoleList
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/toCompanyRoleList")
	public  ModelAndView tocompanyRoleList(){
		ModelAndView mv=new ModelAndView("company/companyRole_list");
		return mv;
	}
	/**
	 * 功能描述：跳转到系统页面
	 * 作者：lijiaxing
	 * url：${webRoot}/companyRole/toSysRoleOperationList
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/toSysRoleOperationList")
	public  ModelAndView toSysRoleOperationList(){
		ModelAndView mv=new ModelAndView("company/sysRoleOperation_list");
		return mv;
	}
	 /**
	 * 功能描述：跳转到企业添加页面
	 * 作者：lijiaxing
	 * url：${webRoot}/companyRole/toAddCompany
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 *          值 ：含义【userInfo：个人扩展信息，user：帐号信息】
	 **/
	@RequestMapping("/toAddCompanyRole")
	public  ModelAndView toAddCompany(){
		ModelAndView mv=new ModelAndView("company/companyRole_add");
		return mv;
	}
	/**
	 * 功能描述：跳转到企业详细页面
	 * 作者：lijiaxing
	 * url：${webRoot}/companyRole/toEditCompany/{id}
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 *          值 ：含义【userInfo：个人扩展信息，user：帐号信息】
	 **/
	@RequestMapping("/toEditCompanyRole/{id}")
	public  ModelAndView toEditCompany(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("company/companyRole_edit");
		CompanyRole record=companyRoleService.selectByPrimaryKey(id);
		mv.addObject("record", record);
		return mv;
	}
	/**
	 * 功能描述：跳转到企业详细页面
	 * 作者：lijiaxing
	 * url：${webRoot}/companyRole/companyDetail/{id}
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 *          值 ：含义【userInfo：个人扩展信息，user：帐号信息】
	 **/
	@RequestMapping("/companyRoleDetail/{id}")
	public  ModelAndView companyDetail(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("company/companyRole_detail");
		CompanyRole record=companyRoleService.selectByPrimaryKey(id);
		mv.addObject("record", record);
		return mv;
	}
	
	/**
	 * 功能描述：分页查询所有企业
	 * 作者：lijiaxing
	 * url：${webRoot}/companyRole/selectByPage
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
            page = companyRoleService.selectByPage(page);
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
	 * 作者：lijiaxing
	 * url：${webRoot}/companyRole/insert
	 * 请求方式：POST
	 * @param  Page page
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 *         key:rows[查询结果ist]
	 *         key:total[记录总数]
	 */
    @RequestMapping(value="insert",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> insert(@RequestBody CompanyRole record){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
        	companyRoleService.insertSelective(record);
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
	 * url：${webRoot}/companyRole/update
	 * 请求方式：POST
	 * @param  Page page
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 *         key:rows[查询结果ist]
	 *         key:total[记录总数]
	 */
    @RequestMapping(value="update",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> update(@RequestBody CompanyRole record){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
        	companyRoleService.updateByPrimaryKeySelective(record);
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
	 * url：${webRoot}/companyRole/delete
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
        	companyRoleService.deleteByPrimaryKey(id);
            code="0";
        }catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
    }
}
