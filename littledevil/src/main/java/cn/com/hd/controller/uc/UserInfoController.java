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
import cn.com.hd.domain.uc.User;
import cn.com.hd.domain.uc.UserInfo;
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
	
	/**
	 * 功能描述：分页查询所有用户
	 * 作者：lijiaxing
	 * url：${webRoot}/userInfo/selectUserInfoByPage
	 * 请求方式：POST
	 * @param  Page page
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
	 *方法说明：跳转到前台起始页面
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
	 *方法说明：跳转到前台起始页面
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
	
	/**
	 * 功能描述：删除用户
	 * 作者：lijiaxing
	 * url：${webRoot}/userInfo/deleteUser
	 * 请求方式：GET
	 * @param  id
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
	@RequestMapping("deleteUser/{id}")
	public @ResponseBody Map<String,Object> deleteUser(@PathVariable("id") int id){
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
	
	/**
	 * 功能描述：添加后台用户
	 * 作者：lijiaxing
	 * url：${webRoot}/userInfo/insert
	 * 请求方式：POST
	 * @param  id
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
	@RequestMapping(value="insert",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> insertAdmin(@RequestBody UserInfo user){
		Map<String,Object> map=new HashMap<String,Object>();
		String code="";
		try{
			User record=user.getUser();
			record.setPassword(MD5Encrypt.getMD5Code(record.getPassword()));
			userService.insertSelective(record);
			user.setId(record.getId());
			userInfoService.insertSelective(user);
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
	 * url：${webRoot}/userInfo/update
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
			User record=user.getUser();
			userService.updateByPrimaryKeySelective(record);
			userInfoService.updateByPrimaryKeySelective(user);
			code="0";
		}catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
	}
	
	
	
}
