package cn.com.hd.controller.uc;

import java.io.IOException;
import java.util.HashMap;
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
import cn.com.hd.domain.uc.User;
import cn.com.hd.service.uc.UserService;

/**
 *类说明：系统初始化页面控制器
 *@author lijiaxing 2016/10/17
 *${webRoot}:系统运行根目录 
 **/
@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService userService;
	@Autowired
	HttpSession session;
	
	/**
	 * 功能描述：后端用户登录
	 * 作者：fengcaizhi
	 * url：${webRoot}/user/login
	 * 请求方式：GET
	 * @param  User user
	 * @return Map<String,Object>
	 *         key:msg[返回信息]
	 */
	@RequestMapping("login")
	public @ResponseBody Map<String,Object> adminLogin(User user) throws IOException {
		Map<String,Object> map=new HashMap<String,Object>();
		try{
			String userName=user.getUserName();
			String password=user.getPassword();
			if(null==userName||"".equals(userName.trim())||null==password||"".equals(password.trim())){
				map.put("msg", "登录失败：请输入用户名和密码！");
				return map;
			}
			user.setPassword(MD5Encrypt.getMD5Code(password));
			User record=userService.userLogin(user);
			userService.updateByPrimaryKey(record);
			if(null==record){
				map.put("msg", "登录失败：用户名/密码错误！");
				return map;
			}
			/*String userType=record.getUserType();
			if(!"sys".equals(userType)){
					map.put("msg", "登录失败：非管理员用户，禁止后台登录！");
					return map;
			}*/
			String state=record.getState();
			if("0".equals(state)){
				map.put("msg", "登录失败：帐号禁止登录，请联系管理员！");
				return map;
			}
			session.setAttribute("user", record);
			if(record.getUserType().equals("sys")){
				map.put("userType", "sys");
			}
			else{
				map.put("userType", "person");
			}
			map.put("msg", "ok");
		}catch(Exception e){
			map.put("msg", "服务器异常，请稍后重试！");
		}
		return map;
	}
	
	/**
	 * 功能描述：重置用户密码
	 * 作者：lijiaxing
	 * url：${webRoot}/user/resetPassword
	 * 请求方式：GET
	 * @param  id
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
	@RequestMapping("resetPassword/{id}")
	public @ResponseBody Map<String,Object> resetPassword(@PathVariable("id") int id){
		Map<String,Object> map=new HashMap<String,Object>();
		String code="";
		try{
			User record = new User();
			record.setId(id);
			record.setPassword(MD5Encrypt.getMD5Code("123456"));
			userService.updateByPrimaryKeySelective(record);
			code="0";
		}catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
	}
	
	/**
	 * 功能描述：更新用户状态
	 * 作者：fengcaizhi
	 * url：${webRoot}/user/updateStatus
	 * 请求方式：GET
	 * @param  user User
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
	@RequestMapping("updateStatus")
	public @ResponseBody Map<String,Object> updateStatus(User user){
		Map<String,Object> map=new HashMap<String,Object>();
		String code="";
		try{
			userService.updateByPrimaryKeySelective(user);
			code="0";
		}catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
	}
	
	/**
	 * 功能描述：验证用户名,手机,邮箱,身份证号是否存在
	 * 作者：fengcaizhi
	 * url：${webRoot}/user/isExitsByCondition
	 * 请求方式：GET
	 * @param user User
	 * @return Boolean
	 *          值 ：含义【false：用户名已存在，true：用户名可用】
	 * */
	@RequestMapping(value="/isExitsByCondition",method=RequestMethod.GET)
	public @ResponseBody Boolean isExitsByCondition(User user){
		if(userService.selectByCondition(user)!=null){
			return false;
		}else{
			return true;
		}
	}
	
	/**
	 * 功能描述：删除用户
	 * 作者：fengcaizhi
	 * url：${webRoot}/user/deleteUser
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
	 * 作者：fengcaizhi
	 * url：${webRoot}/user/insert
	 * 请求方式：POST
	 * @param  id
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
	@RequestMapping(value="insert",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> insertAdmin(@RequestBody User user){
		Map<String,Object> map=new HashMap<String,Object>();
		String code="";
		try{
			userService.insertSelective(user);
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
	 * 作者：fengcaizhi
	 * url：${webRoot}/user/update
	 * 请求方式：POST
	 * @param  id
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
	@RequestMapping(value="update",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> updatePerson(@RequestBody User user){
		Map<String,Object> map=new HashMap<String,Object>();
		String code="";
		try{
			userService.updateByPrimaryKeySelective(user);
			code="0";
		}catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
	}
	
}
