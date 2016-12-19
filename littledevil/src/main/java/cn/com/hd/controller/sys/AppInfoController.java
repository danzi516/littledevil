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
import cn.com.hd.domain.sys.AppInfo;
import cn.com.hd.domain.uc.User;
import cn.com.hd.domain.uc.UserInfo;
import cn.com.hd.service.sys.AppExtendInfoService;
import cn.com.hd.service.sys.AppInfoService;
import cn.com.hd.service.uc.UserService;
import net.sf.json.JSONObject;

/**
 *类说明：系统初始化页面控制器
 *@author lijiaxing 2016/10/17
 *${webRoot}:系统运行根目录 
 **/
@Controller
@RequestMapping("/appInfo")
public class AppInfoController {
	@Resource
	private AppInfoService appInfoService;
	@Resource
	private AppExtendInfoService appExtendInfoService;
	
	
	@Autowired
	HttpSession session;
	
	/**
	 * 功能描述：分页查询所有应用
	 * 作者：lijiaxing
	 * url：${webRoot}/appInfo/selectAppInfoByPage
	 * 请求方式：POST
	 * @param  Page page
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 *         key:rows[查询结果ist]
	 *         key:total[记录总数]
	 */
    @RequestMapping(value="selectAppInfoByPage",method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectByPage(Page page){
        Map<String,Object> map = new HashMap<String,Object>();
        String code="";
        try{
            page = appInfoService.selectAppInfoByPage(page);
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
    * 功能描述：跳转到应用添加页面
	 * 作者：lijiaxing
	 * url：${webRoot}/appInfo/toAddAppInfo
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 *          值 ：含义【AppInfo：应用信息】
	 **/
	@RequestMapping("/toAddAppInfo")
	public  ModelAndView toAddCompany(){
		ModelAndView mv=new ModelAndView("sys/appinfo_add");
		return mv;
	}
    /**
	 * 功能描述：跳转到应用详细页面
	 * 作者：lijiaxing
	 * url：${webRoot}/appInfo/appInfoDetail/{id}
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 *          值 ：含义【appInfo：个人扩展信息，user：帐号信息】
	 * */
	@RequestMapping("/appInfoDetail/{id}")
	public  ModelAndView userInfoDetail(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("sys/person_user_detail");
		AppInfo appInfo=appInfoService.selectByPrimaryKey(id);
		if(appInfo==null){
			appInfo=new AppInfo();
		}
		mv.addObject("appInfo", appInfo);
		return mv;
	}
	
	/**
	 * 功能描述：跳转到应用列表页面
	 * 作者：lijiaxing
	 * url：${webRoot}/appInfo/toAppInfoList
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 **/
	@RequestMapping("/toAppInfoList")
	public  ModelAndView toAppInfoList(){
		ModelAndView mv=new ModelAndView("sys/appinfo_list");
		return mv;
	}
	
	/**
	 * 功能描述：跳转到应用修改页面
	 * 作者：lijiaxing
	 * url：${webRoot}/appInfo/toEditAppInfo/{id}
	 * 请求方式：GET
	 * @param id int
	 * @return ModelAndView
	 *          值 ：含义【userInfo：个人扩展信息，user：帐号信息】
	 **/
	@RequestMapping("/toEditAppInfo/{id}")
	public  ModelAndView toEditAppInfo(@PathVariable("id") int id){
		ModelAndView mv=new ModelAndView("sys/appinfo_edit");
		AppInfo record=appInfoService.selectByPrimaryKey(id);
		List<AppExtendInfo> appExtendInfoList = appExtendInfoService.selectByappId(id);
		mv.addObject("appInfo", record);
		List<String> appExtendInfo = new ArrayList<String>();
		for (int i =0;i<=appExtendInfoList.size()-1;i++){
			JSONObject json = JSONObject.fromObject(appExtendInfoList.get(i));
			appExtendInfo.add(json.toString());
		}
		mv.addObject("appExtendInfo", appExtendInfo);
		return mv;
	}
	
	 /**
		 * 功能描述：添加应用
		 * 作者：lijiaxing
		 * url：${webRoot}/appInfo/insert
		 * 请求方式：POST
		 * @param  Page page
		 * @return Map<String,Object>
		 *         key:code["0":"成功","1":"失败"]
		 *         key:rows[查询结果ist]
		 *         key:total[记录总数]
		 */
	    @RequestMapping(value="insert",method=RequestMethod.POST)
	    public @ResponseBody Map<String, Object> insert(@RequestBody AppInfo record){
	        Map<String,Object> map = new HashMap<String,Object>();
	        String code="";
	        try{
	        	appInfoService.insertSelective(record);
	        	AppExtendInfo appExtendInfo = new AppExtendInfo();
	        	appExtendInfo.setAppId(record.getId());
	        	String[] list = record.getAppExtendInfo().getUserType().split(",");
	        	for (int i=0;i<list.length;i++){
	        		appExtendInfo.setUserType(list[i]);
	        		appExtendInfoService.insertSelective(appExtendInfo);
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
		 * 功能描述：删除应用
		 * 作者：lijiaxing
		 * url：${webRoot}/appInfo/delete
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
	        	appInfoService.deleteByPrimaryKey(id);
	        	
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
		 * url：${webRoot}/appInfo/update
		 * 请求方式：POST
		 * @param  Page page
		 * @return Map<String,Object>
		 *         key:code["0":"成功","1":"失败"]
		 *         key:rows[查询结果ist]
		 *         key:total[记录总数]
		 */
	    @RequestMapping(value="update",method=RequestMethod.POST)
	    public @ResponseBody Map<String, Object> update(@RequestBody AppInfo record){
	        Map<String,Object> map = new HashMap<String,Object>();
	        String code="";
	        try{
	        	appInfoService.updateByPrimaryKeySelective(record);
	        	appExtendInfoService.deleteByAppId(record.getId());
	        	AppExtendInfo appExtendInfo = new AppExtendInfo();
	        	appExtendInfo.setAppId(record.getId());
	        	String[] list = record.getAppExtendInfo().getUserType().split(",");
	        	for (int i=0;i<list.length;i++){
	        		appExtendInfo.setUserType(list[i]);
	        		appExtendInfoService.insertSelective(appExtendInfo);
	        	}
	        
	            code="0";
	        }catch(Exception e){
	            code="1";
	            e.printStackTrace();
	        }
	        map.put("code", code);
	        return map;
	    }
}
