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

import cn.com.hd.common.Constants;
import cn.com.hd.common.MD5Encrypt;
import cn.com.hd.common.http.HttpRequest;
import cn.com.hd.common.security.AESUtils;
import cn.com.hd.domain.company.CompanyAuth;
import cn.com.hd.domain.sys.RegVerification;
import cn.com.hd.domain.uc.User;
import cn.com.hd.service.company.CompanyAuthService;
import cn.com.hd.service.sys.RegVerificationService;
import cn.com.hd.service.uc.UserService;
import net.sf.json.JSONObject;

/**
 *类说明：系统初始化页面控制器
 *@author lijiaxing 2016/10/17
 *${webRoot}:系统运行根目录 
 **/
@Controller
@RequestMapping("/wxpay")
public class WxController {
	@Autowired
	HttpSession session;
	@Resource
	private UserService userService;
	@Resource
	RegVerificationService regVerificationService;
	@Resource
	CompanyAuthService companyAuthService;
	//微信登录
	@RequestMapping("openIdLogin")
	public @ResponseBody Map<String,Object> openIdLogin(User user) throws IOException {
		Map<String,Object> map=new HashMap<String,Object>();
		try{
			User record=userService.userLogin(user);
			if(record ==null){
				try{
					user.setState("0");
					userService.insert(user);
				}
				catch(Exception e){
					map.put("msg", "注册失败!!请重新打开");
				}
				
			}else{
				userService.updateByPrimaryKey(record);
				String state=record.getState();
				if("0".equals(state)){
					map.put("msg", "登录失败：帐号禁止登录，请联系管理员！");
					return map;
				}
				session.setAttribute("user", record);
				//查找companyId
				
				if(record.getUserType().equals("sys")){
					map.put("userType", "sys");
					map.put("companyId", 0);
					session.setAttribute("companyId", 0);
				}
				else if(record.getUserType().equals("company")){
					map.put("userType", "company");
					map.put("companyId", record.getId());
					session.setAttribute("companyId", record.getId());
				}
				else {
					map.put("userType", "person");
				}
			}
			
			map.put("msg", "ok");
		}catch(Exception e){
			map.put("msg", "服务器异常，请稍后重试！");
		}
		return map;
	}
	
	
	/**
	 * 功能描述：更新用户状态
	 * 作者：wanglin
	 * url：${webRoot}/wxpay/updateStatus
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
	 * 作者：wanglin
	 * url：${webRoot}/wxpay/isExitsByCondition
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
	 * 功能描述：更新用户
	 * 作者：wanglin
	 * url：${webRoot}/wxpay/updateRecord
	 * 请求方式：POST
	 * @param  id
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
	@RequestMapping(value="updateRecord",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> updateRecord(@RequestBody User user){
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
     * 解密用户敏感数据
     *
     * @param encryptedData 明文,加密数据
     * @param iv            加密算法的初始向量
     * @param code          用户允许登录后，回调内容会带上 code（有效期五分钟），开发者需要将 code 发送到开发者服务器后台，使用code 换取 session_key api，将 code 换成 openid 和 session_key
     * @return
     */
    @RequestMapping(value = "/decodeUserInfo", method = RequestMethod.POST)
    public @ResponseBody Map<String,Object> decodeUserInfo(String encryptedData, String iv, String code)  throws IOException{
 
        Map<String, Object> map = new HashMap<String, Object>();
        //登录凭证不能为空
        if (code == null || code.length() == 0 ||code.equals("undifinded")) {
            map.put("status", 0);
            map.put("msg", "code 不能为空");
            return map;
        }
        JSONObject json = userService.getOpenidAndSessionKey(Constants.wxspAppid, Constants.wxspSecret, code, Constants.grant_type);
       
        //获取会话密钥（session_key）
        String session_key = json.get("session_key").toString();
        //用户的唯一标识（openid）
        String openid = (String) json.get("openid");
 
        //////////////// 2、对encryptedData加密数据进行AES解密 ////////////////
        try {
            String result = AESUtils.decrypt(encryptedData, session_key, iv, "UTF-8");
            if (null != result && result.length() > 0) {
            	Map<String, Object> userInfo = userService.getWxUserInfo(encryptedData, session_key, iv);
                map.put("status", 0);
                map.put("msg", "解密成功");
                map.put("userInfo", userInfo);
                return map;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        map.put("status", 1);
        map.put("msg", "解密失败");
        return map;
    }

	
    /**
	 * 功能描述：更新用户
	 * 作者：wanglin
	 * url：${webRoot}/wxpay/getOpenId
	 * 请求方式：POST
	 * @param  id
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
	@RequestMapping(value="getOpenId",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> getOpenId(String wxcode){
		Map<String,Object> map=new HashMap<String,Object>();
		String code="";
		try{
			JSONObject result = userService.getOpenidAndSessionKey(Constants.wxspAppid, Constants.wxspSecret, wxcode, Constants.grant_type);
			code="0";
			map.put("result", result);
		}catch(Exception e){
            code="1";
            e.printStackTrace();
        }
        map.put("code", code);
        return map;
	}
	
	 /**
		 * 功能描述：申请成为业务员
		 * 作者：wanglin
		 * url：${webRoot}/wxpay/applySaleMan
		 * 请求方式：POST
		 * @param  id
		 * @return Map<String,Object>
		 *         key:code["0":"成功","1":"失败"]
		 */
		@RequestMapping(value="applySaleMan",method=RequestMethod.POST)
		public @ResponseBody Map<String,Object> applySaleMan(String wxcode){
			Map<String,Object> map=new HashMap<String,Object>();
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
		
		/**
		 * 功能描述：商户认证
		 * 作者：wanglin
		 * url：${webRoot}/wxpay/applyCompany
		 * 请求方式：POST
		 * @param  id
		 * @return Map<String,Object>
		 *         key:code["0":"成功","1":"失败"]
		 */
		@RequestMapping(value="applyCompany",method=RequestMethod.POST)
		public @ResponseBody Map<String,Object> applyCompany(int userid ,String invitationCode){
			Map<String,Object> map=new HashMap<String,Object>();
			String code="";
			String message="";
			try{
				RegVerification record = new RegVerification();
				record.setState("0");
				record.setInvitationCode(invitationCode);
				if(regVerificationService.selectBySelective(record).size()==0){
					code="1";
					message="该邀请码不可用，请更换!";
					map.put("code", code);
					map.put("message", message);
					return  map;
				}
				CompanyAuth companyAuth = new CompanyAuth();
				companyAuth.setInvitationCode(invitationCode);
				companyAuth.setCompanyId(userid);
				companyAuth.setSalemanId(regVerificationService.selectBySelective(record).get(0).getSalemanId());
				companyAuth.setState("1");
				companyAuthService.insertSelective(companyAuth);
				code="0";
			}catch(Exception e){
	            code="2";
	            message="未知异常，请重试";
	            e.printStackTrace();
	        }
			map.put("message", message);
	        map.put("code", code);
	        return map;
		}
		
		/**
		 * 功能描述：获取邀请码
		 * 作者：wanglin
		 * url：${webRoot}/wxpay/getInvitationCode
		 * 请求方式：POST
		 * @param  id
		 * @return Map<String,Object>
		 *         key:code["0":"成功","1":"失败"]
		 */
		@RequestMapping(value="getInvitationCode",method=RequestMethod.GET)
		public @ResponseBody Map<String,Object> getInvitationCode(int salemanId){
			Map<String,Object> map=new HashMap<String,Object>();
			String code="";
			try{
				RegVerification record = new RegVerification();
				record.setSalemanId(salemanId);
				record.setState("0");
				if(regVerificationService.selectBySelective(record).size()==0){
					for(int i=0;i<=5;i++){
						int invitationCode =(int) ((Math.random()*9+1)*100000);
						//int invitationCode =(int) ((Math.random()*4+1));
						record.setInvitationCode( String.valueOf(invitationCode));
						try{
							regVerificationService.insert(record);
							code="0";
							map.put("code", code);
							map.put("InvitationCode",invitationCode);
							break;
						}catch(Exception e){
				            code="1";
				            e.printStackTrace();
				            continue;
				        }	
					} 
					map.put("code", code);
					return map;
				}
				String invitationCode = regVerificationService.selectBySelective(record).get(0).getInvitationCode();
				map.put("InvitationCode",invitationCode);
				code="0";
			}catch(Exception e){
	            code="1";
	            e.printStackTrace();
	        }
	        map.put("code", code);
	        return map;
		}
		public static void main(String args[]) { 
	        System.out.println((int)((Math.random()*9+1)*100000)); 
	    } 
}
