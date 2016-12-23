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

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyRoleOperation;
import cn.com.hd.domain.sys.AppExtendInfo;
import cn.com.hd.domain.sys.AppOperation;
import cn.com.hd.service.company.CompanyRoleOperationService;
import cn.com.hd.service.sys.AppOperationService;
import cn.com.hd.service.uc.UserService;

@Controller
@RequestMapping("/companyRoleOperation")
public class CompanyRoleOperationController {
	@Resource
	private CompanyRoleOperationService companyRoleOperationService;
	@Resource
	private UserService userService;
	@Resource
	private AppOperationService appOperationService;
	/**
	 * 功能描述：跳转到列表页面
	 * 作者：lijiaxing
	 * url：${webRoot}/companyRoleOperation/toCompanyRoleOperationList
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/toCompanyRoleOperationList")
	public  ModelAndView toCompanyRoleOperationList(){
		ModelAndView mv=new ModelAndView("company/companyRoleOperation_list");
		return mv;
	}
	/**
	 * 功能描述：跳转到系统页面
	 * 作者：lijiaxing
	 * url：${webRoot}/companyRoleOperation/toSysRoleOperationList
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
	 * 功能描述：跳转到添加页面
	 * 作者：lijiaxing
	 * url：${webRoot}/companyRoleOperation/toAddCompany
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 *          值 ：含义【userInfo：个人扩展信息，user：帐号信息】
	 **/
	@RequestMapping("/toAddcompanyRoleOperation")
	public  ModelAndView toAddCompany(){
		ModelAndView mv=new ModelAndView("company/companyRoleOperation_add");
		return mv;
	}
	/**
	 * 功能描述：通过角色查询
	 * 作者：lijiaxing
	 * url：${webRoot}/companyRoleOperation/selectRoleOperationByRoleId/{id}
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 *          值 ：含义【userInfo：个人扩展信息，user：帐号信息】
	 **/
	@RequestMapping("/selectRoleOperationByRoleId/{id}")
	 public @ResponseBody Map<String, Object> selectRoleOperationByRoleId(@PathVariable("id") int id){
		Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
        	List<CompanyRoleOperation> companyRoleOperationList = companyRoleOperationService.selectByRoleId(id);
            code="0";
            map.put("list", companyRoleOperationList);
        }catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
	}
	
	
	
	/**
	 * 功能描述：跳转到修改页面
	 * 作者：lijiaxing
	 * url：${webRoot}/companyRoleOperation/toEditcompanyRoleOperation/{id}
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 *          值 ：含义【userInfo：个人扩展信息，user：帐号信息】
	 **/
	@RequestMapping("/toEditcompanyRoleOperation/{id}")
	public  ModelAndView toEditCompany(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("company/companyRoleOperation_edit");
		mv.addObject("roleId", id);
		return mv;
	}
	/**
	 * 功能描述：跳转到企业详细页面
	 * 作者：lijiaxing
	 * url：${webRoot}/companyRoleOperation/companyDetail/{id}
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 *          值 ：含义【userInfo：个人扩展信息，user：帐号信息】
	 **/
	@RequestMapping("/companyRoleOperationDetail/{id}")
	public  ModelAndView companyDetail(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("company/companyRoleOperation_detail");
		CompanyRoleOperation record=companyRoleOperationService.selectByPrimaryKey(id);
		mv.addObject("record", record);
		return mv;
	}
	
	/**
	 * 功能描述：分页查询所有企业
	 * 作者：lijiaxing
	 * url：${webRoot}/companyRoleOperation/selectByPage
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
            //page = companyRoleOperationService.selectCompanyByPage(page);
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
	 * url：${webRoot}/companyRoleOperation/insert
	 * 请求方式：POST
	 * @param  Page page
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 *         key:rows[查询结果ist]
	 *         key:total[记录总数]
	 */
    @RequestMapping(value="insert",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> insert(@RequestBody CompanyRoleOperation record){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
        	companyRoleOperationService.insertSelective(record);
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
	 * url：${webRoot}/companyRoleOperation/update
	 * 请求方式：POST
	 * @param  Page page
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 *         key:rows[查询结果ist]
	 *         key:total[记录总数]
	 */
    @RequestMapping(value="update",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> update(@RequestBody CompanyRoleOperation record){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
        	companyRoleOperationService.deleteByRoleId(record.getRoleId());
        	//companyRoleOperationService.updateByPrimaryKeySelective(record);
        	String[] list = record.getOperationIdArry().split(",");
        	for (int i=0;i<list.length;i++){
        		CompanyRoleOperation companyRoleOperation = new CompanyRoleOperation();
        		companyRoleOperation.setRoleId(record.getRoleId());
        		companyRoleOperation.setAppId(appOperationService.selectByPrimaryKey(Integer.parseInt(list[i])).getAppId());
        		companyRoleOperation.setOperationId(Integer.parseInt(list[i]));
        		companyRoleOperationService.insert(companyRoleOperation);
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
	 * 功能描述：删除
	 * 作者：lijiaxing
	 * url：${webRoot}/companyRoleOperation/delete
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
        	companyRoleOperationService.deleteByPrimaryKey(id);
            code="0";
        }catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
    }
}
