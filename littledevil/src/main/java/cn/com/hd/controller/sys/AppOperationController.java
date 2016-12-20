package cn.com.hd.controller.sys;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
import cn.com.hd.domain.sys.AppExtendInfo;
import cn.com.hd.domain.sys.AppOperation;
import cn.com.hd.domain.uc.User;
import cn.com.hd.domain.uc.UserInfo;
import cn.com.hd.service.sys.AppExtendInfoService;
import cn.com.hd.service.sys.AppInfoService;
import cn.com.hd.service.sys.AppOperationService;
import cn.com.hd.service.uc.UserService;
import net.sf.json.JSONObject;

/**
 *类说明：系统初始化页面控制器
 *@author lijiaxing 2016/10/17
 *${webRoot}:系统运行根目录 
 **/
@Controller
@RequestMapping("/appOperation")
public class AppOperationController {
	@Resource
	private AppInfoService appInfoService;
	@Resource
	private AppExtendInfoService appExtendInfoService;
	@Resource
	private AppOperationService appOperationService;
	
	@Autowired
	HttpSession session;
	
	/**
	 * 功能描述：分页查询所有应用
	 * 作者：lijiaxing
	 * url：${webRoot}/appOperation/selectAppOperationByPage
	 * 请求方式：POST
	 * @param  Page page
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 *         key:rows[查询结果ist]
	 *         key:total[记录总数]
	 */
    @RequestMapping(value="selectAppOperationByPage",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectByPage(Page page){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
           // page = appOperationService.selectappOperationByPage(page);
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
	 * 功能描述：通过appId查询
	 * 作者：lijiaxing
	 * url：${webRoot}/appOperation/selectByAppId/{id}
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 *          值 ：含义【userInfo：个人扩展信息，user：帐号信息】
	 **/
	@RequestMapping("/selectByAppId/{id}")
	public  @ResponseBody Map<String, Object> selectByAppId(@PathVariable("id") int id){
		Map<String,Object> map = new HashMap<String,Object>();
        String code="";
		
		 try{
			 List<AppOperation>  record=appOperationService.selectByappId(id);
				map.put("list",record);
	            code="0";
	        }catch(Exception e){
	            code="1";
	            e.printStackTrace();
	        }
	        map.put("code", code);
	        return map;
	}
	
	/**
	 * 功能描述：跳转到应用修改页面
	 * 作者：lijiaxing
	 * url：${webRoot}/appOperation/toEditAppOperation/{id}
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 *          值 ：含义【userInfo：个人扩展信息，user：帐号信息】
	 **/
	@RequestMapping("/toEditAppOperation/{id}")
	public  ModelAndView toEditappOperation(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("sys/app_operation_set");
	/*	List<AppOperation>  record=appOperationService.selectByappId(id);
		List<String> AppOperation = new ArrayList<String>();
		for (int i =0;i<=record.size()-1;i++){
			JSONObject json = JSONObject.fromObject(record.get(i));
			AppOperation.add(json.toString());
		}
		mv.addObject("AppOperation", AppOperation);*/
		mv.addObject("appId", id);
		return mv;
	}
	
	/**
	 * 功能描述：唯一性验证
	 * 作者：lijiaxing
	 * url：${webRoot}/appOperation/isExitsByCondition
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 *          值 ：含义【userInfo：个人扩展信息，user：帐号信息】
	 **/
	@RequestMapping(value="/isExitsByCondition",method=RequestMethod.GET)
	public @ResponseBody Boolean isExitsByCondition(AppOperation appOperation){
		if(appOperationService.selectByCondition(appOperation)!=null){
			return false;
		}else{
			return true;
		}
	}
	 /**
		 * 功能描述：添加应用
		 * 作者：lijiaxing
		 * url：${webRoot}/appOperation/insert
		 * 请求方式：POST
		 * @param  Page page
		 * @return Map<String,Object>
		 *         key:code["0":"成功","1":"失败"]
		 *         key:rows[查询结果ist]
		 *         key:total[记录总数]
		 */
	    @RequestMapping(value="insert",method=RequestMethod.POST)
	    public @ResponseBody Map<String, Object> insert(@RequestBody AppOperation record){
	        Map<String,Object> map = new HashMap<String,Object>();
	        String code="";
	        try{
	        	appOperationService.insert(record);
	            code="0";
	        }catch(Exception e){
	            code="1";
	            e.printStackTrace();
	        }
	        map.put("code", code);
	        return map;
	    }
	    
	    /**
		 * 功能描述：删除应用
		 * 作者：lijiaxing
		 * url：${webRoot}/appOperation/delete
		 * 请求方式：POST
		 * @param  Page page
		 * @return Map<String,Object>
		 *         key:code["0":"成功","1":"失败"]
		 *         key:rows[查询结果ist]
		 *         key:total[记录总数]
		 */
	    @RequestMapping(value="delete/{id}")
	    public @ResponseBody Map<String, Object> delete(@PathVariable("id") int id){
	        Map<String,Object> map = new HashMap<String,Object>();
	        String code="";
	        try{
	        	appOperationService.deleteByPrimaryKey(id);
	            code="0";
	        }catch(Exception e){
	            code="1";
	            e.printStackTrace();
	        }
	        map.put("code", code);
	        return map;
	    }
	    
	    /**
		 * 功能描述：修改应用
		 * 作者：lijiaxing
		 * url：${webRoot}/appOperation/update
		 * 请求方式：POST
		 * @param  Page page
		 * @return Map<String,Object>
		 *         key:code["0":"成功","1":"失败"]
		 *         key:rows[查询结果ist]
		 *         key:total[记录总数]
		 */
	    @RequestMapping(value="update",method=RequestMethod.POST)
	    public @ResponseBody Map<String, Object> update(@RequestBody AppOperation record){
	        Map<String,Object> map = new HashMap<String,Object>();
	        String code="";
	        try{
	            code="0";
	        }catch(Exception e){
	            code="1";
	            e.printStackTrace();
	        }
	        map.put("code", code);
	        return map;
	    }
}
