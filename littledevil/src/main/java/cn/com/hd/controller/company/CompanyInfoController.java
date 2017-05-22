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
import cn.com.hd.domain.company.CompanyInfo;
import cn.com.hd.domain.uc.User;
import cn.com.hd.domain.uc.UserInfo;
import cn.com.hd.service.company.CompanyInfoService;
import cn.com.hd.service.uc.UserService;

@Controller
@RequestMapping("/companyInfo")
public class CompanyInfoController {
	@Resource
	private CompanyInfoService companyInfoService;
	@Resource
	private UserService userService;
	/**
	 * 功能描述：跳转到企业列表页面
	 * 作者：lijiaxing
	 * url：${webRoot}/companyInfo/toCompanyList
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/toCompanyList")
	public  ModelAndView toCompanyList(){
		ModelAndView mv=new ModelAndView("sys/company_list");
		return mv;
	}
	
	 /**
	 * 功能描述：跳转到企业添加页面
	 * 作者：lijiaxing
	 * url：${webRoot}/companyInfo/toAddCompany
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 *          值 ：含义【userInfo：个人扩展信息，user：帐号信息】
	 **/
	@RequestMapping("/toAddCompany")
	public  ModelAndView toAddCompany(){
		ModelAndView mv=new ModelAndView("sys/company_add");
		return mv;
	}
	/**
	 * 功能描述：跳转到企业详细页面
	 * 作者：lijiaxing
	 * url：${webRoot}/companyInfo/toEditCompany/{id}
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 *          值 ：含义【userInfo：个人扩展信息，user：帐号信息】
	 **/
	@RequestMapping("/toEditCompany/{id}")
	public  ModelAndView toEditCompany(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("sys/company_edit");
		CompanyInfo record=companyInfoService.selectByPrimaryKey(id);
		mv.addObject("record", record);
		return mv;
	}
	/**
	 * 功能描述：跳转到企业详细页面
	 * 作者：lijiaxing
	 * url：${webRoot}/companyInfo/companyDetail/{id}
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 *          值 ：含义【userInfo：个人扩展信息，user：帐号信息】
	 **/
	@RequestMapping("/companyDetail/{id}")
	public  ModelAndView companyDetail(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("sys/company_detail");
		CompanyInfo record=companyInfoService.selectByPrimaryKey(id);
		mv.addObject("record", record);
		return mv;
	}
	
	/**
	 * 功能描述：分页查询所有企业
	 * 作者：lijiaxing
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
            page = companyInfoService.selectCompanyByPage(page);
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
	 * 功能描述：查询所有企业
	 * 作者：lijiaxing
	 * url：${webRoot}/companyInfo/selectCompanyAllList
	 * 请求方式：GET
	 * @param  
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 *         key:rows[查询结果list]
	 *         key:total[记录总数]
	 */
    @RequestMapping(value="selectCompanyAllList",method=RequestMethod.GET)
    public @ResponseBody Map<String, Object> selectCompanyAllList(){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
        	List<CompanyInfo> List = companyInfoService.selectCompanyAllList();
            code="0";
            map.put("List",List);
        }catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
    }
    
    /**
	 * 功能描述：添加企业
	 * 作者：lijiaxing
	 * url：${webRoot}/companyInfo/insert
	 * 请求方式：POST
	 * @param  Page page
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 *         key:rows[查询结果ist]
	 *         key:total[记录总数]
	 */
    @RequestMapping(value="insert",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> insert(@RequestBody CompanyInfo record){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
        	User user=record.getUser();
        	user.setPassword(MD5Encrypt.getMD5Code(record.getUser().getPassword()));
        	userService.insertSelective(user);
        	record.setId(user.getId());
        	companyInfoService.insertSelective(record);
            code="0";
        }catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
    }
    
    /**
	 * 功能描述：更新企业
	 * 作者：lijiaxing
	 * url：${webRoot}/companyInfo/update
	 * 请求方式：POST
	 * @param  Page page
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 *         key:rows[查询结果ist]
	 *         key:total[记录总数]
	 */
    @RequestMapping(value="update",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> update(@RequestBody CompanyInfo record){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
        	User user=record.getUser();
        	userService.updateByPrimaryKeySelective(user);
        	companyInfoService.updateByPrimaryKeySelective(record);
            code="0";
        }catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
    }
    
    /**
	 * 功能描述：删除企业
	 * 作者：lijiaxing
	 * url：${webRoot}/companyInfo/update
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
        	companyInfoService.deleteByPrimaryKey(id);
            code="0";
        }catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
    }
}
