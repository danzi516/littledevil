package cn.com.hd.controller.uc;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

import cn.com.hd.common.Constants;
import cn.com.hd.common.MD5Encrypt;
import cn.com.hd.common.http.HttpRequest;
import cn.com.hd.common.security.AESUtils;
import cn.com.hd.domain.company.CompanyAuth;
import cn.com.hd.domain.company.CompanyCommodity;
import cn.com.hd.domain.company.CompanyMember;
import cn.com.hd.domain.company.CompanyPromotion;
import cn.com.hd.domain.company.MemberBillFlow;
import cn.com.hd.domain.company.MemberCommodity;
import cn.com.hd.domain.sys.RegVerification;
import cn.com.hd.domain.uc.SaleMan;
import cn.com.hd.domain.uc.User;
import cn.com.hd.domain.uc.UserInfo;
import cn.com.hd.domain.uc.WxUserInfo;
import cn.com.hd.service.company.CompanyAuthService;
import cn.com.hd.service.company.CompanyCommodityService;
import cn.com.hd.service.company.CompanyMemberService;
import cn.com.hd.service.company.CompanyPromotionService;
import cn.com.hd.service.company.MemberCommodityService;
import cn.com.hd.service.company.MemberPaymentService;
import cn.com.hd.service.sys.RegVerificationService;
import cn.com.hd.service.uc.SaleManService;
import cn.com.hd.service.uc.UserInfoService;
import cn.com.hd.service.uc.UserService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *类说明：系统初始化页面控制器
 *@author wanglin 
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
	private SaleManService saleManService;
	@Resource
	private UserInfoService userInfoService;
	@Resource
	private CompanyMemberService companyMemberService;
	@Resource
	RegVerificationService regVerificationService;
	@Resource
	CompanyAuthService companyAuthService;
	@Resource
	private CompanyPromotionService companyPromotionService;
	@Resource
	private CompanyCommodityService companyCommodityService;
	@Resource
	MemberCommodityService memberCommodityService;
	@Resource
	MemberPaymentService memberPaymentService;
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
	 * 功能描述：验证用户是否存在
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
	 * 功能描述：通过code验证用户是否存在
	 * 作者：wanglin
	 * url：${webRoot}/wxpay/isExitsByCode
	 * 请求方式：Post
	 * @param String code
	 * @return Boolean
	 *          值 ：含义【false：用户已存在，true：用户不存在】
	 * */
	@RequestMapping(value="/isExitsByCode",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> isExitsByCode(String code){
		Map<String,Object> map=new HashMap<String,Object>();
		JSONObject json = userService.getOpenIdAndSessionKey(Constants.wxspAppid, Constants.wxspSecret, code, Constants.grant_type);
		User user = new User();
		user.setOpenId(json.getString("openid"));
		if(userService.selectByCondition(user)!=null){
			map.put("id",userService.selectByCondition(user).getId());
			map.put("code", "1"); //1代表已经注册
			return map;
		}else{
			user.setState("1");
			userService.insertSelective(user);
			map.put("id", user.getId());
			map.put("code", "0");//0代表未注册
			return map;
		}
	}
	
	/**
	 * 功能描述：微信注册
	 * 作者：wanglin
	 * url：${webRoot}/wxpay/openIdInsert
	 * 请求方式：Post
	 * @param String code
	 * @return Boolean
	 *          值 ：含义【false：用户已存在，true：用户不存在】
	 * */
	@RequestMapping(value="/openIdInsert",method=RequestMethod.POST)
	public @ResponseBody Boolean openIdInsert(int id,String userInfo){
		JSONObject json = JSONObject.fromObject(userInfo);
		UserInfo userinfo = new UserInfo();
		userinfo.setLogo(json.getString("avatarUrl"));
		userinfo.setUcName(json.getString("nickName"));
		userinfo.setId(id);
		userInfoService.insert(userinfo);
		return true;
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
     * @param code          用户允许登录后，回调内容会带上 code（有效期五分钟），开发者需要将 code 发送到开发者服务器后台，使用code 换取 session_key api，将 code 换成 openId 和 session_key
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
        JSONObject json = userService.getOpenIdAndSessionKey(Constants.wxspAppid, Constants.wxspSecret, code, Constants.grant_type);
       
        //获取会话密钥（session_key）
        String session_key = json.get("session_key").toString();
        //用户的唯一标识（openId）
        String openId = (String) json.get("openId");
 
        //////////////// 对encryptedData加密数据进行AES解密 ////////////////
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
	 * 功能描述：getopenId
	 * 作者：wanglin
	 * url：${webRoot}/wxpay/getopenId
	 * 请求方式：POST
	 * @param  id
	 * @return Map<String,Object>
	 *         key:code["0":"成功","1":"失败"]
	 */
	@RequestMapping(value="getopenId",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> getopenId(String wxcode){
		Map<String,Object> map=new HashMap<String,Object>();
		String code="";
		try{
			JSONObject result = userService.getOpenIdAndSessionKey(Constants.wxspAppid, Constants.wxspSecret, wxcode, Constants.grant_type);
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
		public @ResponseBody Map<String,Object> applySaleMan(int salemanId){
			Map<String,Object> map=new HashMap<String,Object>();
			SaleMan saleMan = new SaleMan();
			String code="";
			try{
				if(saleManService.selectByPrimaryKey(salemanId)!=null){//已申请
					code="2";
				}
				else{
					saleMan.setId(salemanId);
					saleMan.setState("0");
					saleManService.insert(saleMan);
					code="0";
				}
			}
			catch(Exception e){
	            code="1";
	            e.printStackTrace();
	        }
	        map.put("code", code);
	        return map;
		}
		
		/**
		 * 功能描述：商户申请认证
		 * 作者：wanglin
		 * url：${webRoot}/wxpay/applyCompany
		 * 请求方式：POST
		 * @param  id
		 * @return Map<String,Object>
		 *         key:code["0":"成功","1":"失败"]
		 */
		@RequestMapping(value="applyCompany",method=RequestMethod.POST)
		public @ResponseBody Map<String,Object> applyCompany(int userId ,String invitationCode){
			Map<String,Object> map=new HashMap<String,Object>();
			String code="";
			String message="";
			try{
				CompanyAuth companyAuth = new CompanyAuth();
				companyAuth.setCompanyId(userId);
				companyAuth.setInvitationCode(invitationCode);
				if(companyAuthService.selectBySelective(companyAuth).get(0).getState().equals("0")){
					message="该用户已认证";
					map.put("code", "3");
					map.put("message", message);
					return  map;
				}
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
				int id = regVerificationService.selectBySelective(record).get(0).getId();
				companyAuth.setSalemanId(regVerificationService.selectBySelective(record).get(0).getSalemanId());
				companyAuth.setState("1");
				companyAuthService.insertSelective(companyAuth);
				record.setState("1");
				record.setId(id);
				regVerificationService.updateByPrimaryKeySelective(record);
				message="申请成功";
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
		 * 功能描述：业务员获取邀请码
		 * 作者：wanglin
		 * url：${webRoot}/wxpay/getInvitationCode
		 * 请求方式：POST
		 * @param  id
		 * @return Map<String,Object>
		 *         key:code["0":"成功","1":"失败"]
		 */
		@RequestMapping(value="getInvitationCode",method=RequestMethod.POST)
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
						}catch(org.springframework.dao.DuplicateKeyException e){
				            continue;
				        }	
						catch(Exception e){
				            code="1";
				            e.printStackTrace();
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
	
		
		/**
		 * 功能描述：商户认证通过
		 * 作者：wanglin
		 * url：${webRoot}/wxpay/companyThrough
		 * 请求方式：POST
		 * @param  id
		 * @return Map<String,Object>
		 *         key:code["0":"成功","1":"失败"]
		 */
		@RequestMapping(value="companyThrough",method=RequestMethod.POST)
		public @ResponseBody Map<String,Object> companyThrough(int companyId,String validityTime){
			Map<String,Object> map=new HashMap<String,Object>();
			String code="";
			String message="";
			try{
				CompanyAuth record = new CompanyAuth();
				record.setValidityTime(validityTime);
				record.setState("0");
				record.setCompanyId(companyId);
				companyAuthService.updateByCompanyId(record);
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
		 * 功能描述：会员注册登录
		 * 作者：wanglin
		 * url：${webRoot}/wxpay/memberInsert
		 * 请求方式：POST
		 * @param  id
		 * @return Map<String,Object>
		 *         key:code["0":"成功","1":"失败"]
		 */
		@RequestMapping(value="memberInsert",method=RequestMethod.POST)
		public @ResponseBody Map<String,Object> memberInsert(int companyId,String wxcode,String wxUserInfo){
			Map<String,Object> map=new HashMap<String,Object>();
			JSONObject UserInfo = JSONObject.fromObject(wxUserInfo);
			String code="";
			String message="";
			User User= new User();
			UserInfo userInfo = new UserInfo();
			try{
				JSONObject result = userService.getOpenIdAndSessionKey(Constants.wxspAppid, Constants.wxspSecret, wxcode, Constants.grant_type);
				String openId = (String) result.get("openId");
				User.setOpenId(openId);
				if(userService.selectByCondition(User)!=null){
					code = "1";
					message = "已经注册！！";
					map.put("message", message);
			        map.put("code", code);
			        return map;
				}
					userInfo.setLogo(UserInfo.getString("avatarUrl"));
					userInfo.setUcName(UserInfo.getString("nickName"));
					userService.insert(User);
					userInfo.setId(User.getId());
					userInfoService.insert(userInfo);
				CompanyMember companyMember = new CompanyMember();
				companyMember.setCompanyId(companyId);
				companyMember.setUserId(User.getId());
				companyMember.setIsDelete("1");
				int MemberCard = 100001234+User.getId();
				companyMember.setMemberCard(String.valueOf(MemberCard));
				companyMemberService.insert(companyMember);
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
		 * 功能描述：会员流水-购买
		 * 作者：wanglin
		 * url：${webRoot}/wxpay/memberBillBuy_old
		 * 请求方式：POST
		 //@param  list[int userId,int commodityId,int promotionId,int num]
		 * @param {info,commodityIds,promotionIds} 
		 * @return Map<String,Object>
		 *         key:code["0":"成功","1":"失败"]
		 */
		@RequestMapping(value="memberBillBuy_old",method=RequestMethod.POST)
		public @ResponseBody Map<String,Object> memberBillBuy_old(String List){
			Map<String,Object> map=new HashMap<String,Object>();
			String code="";
			String message="";
			try{
				JSONObject json = JSONObject.fromObject(List);
				int userId = Integer.parseInt((String) json.get("userId"));
				int companyMemberId = Integer.parseInt((String) json.get("companyMemberId"));
				int companyId = Integer.parseInt((String) json.get("companyId"));
				int memberCommodityId = Integer.parseInt((String) json.get("memberCommodityId"));
				int recorderId = Integer.parseInt((String) json.get("recorderId"));
				double totalCash = Double.parseDouble((String)json.get("totalCash"));
				double cash = companyMemberService.selectByPrimaryKey(companyMemberId).getCash();
				if(cash<totalCash){
					code = "1";
					message = "余额不足";
					map.put("message", message);
			        map.put("code", code);
			        return map; 
				}
				else{
					String memberBuyList=json.getString("memberBuyList");
					JSONArray jsonArray = JSONArray.fromObject(memberBuyList);
					if(jsonArray.size()>0){
						for(int i=0;i<jsonArray.size();i++){
							MemberBillFlow memberBillFlow = new MemberBillFlow();
							memberBillFlow.setUserId(userId);
							memberBillFlow.setCompanyId(companyId);
							memberBillFlow.setCompanyMemberId(companyMemberId);
							memberBillFlow.setMemberCommodityId(memberCommodityId);
							memberBillFlow.setRecorderId(recorderId);
							memberBillFlow.setBillModel((String) json.get("billModel"));
							JSONObject job = jsonArray.getJSONObject(i);
							String flowType = (String)job.get("flowType");
							memberBillFlow.setFlowType(flowType);
							int number = Integer.parseInt((String) job.get("num"));
							int promotionId = Integer.parseInt((String) job.get("promotionId"));
							int commodityId = Integer.parseInt((String) job.get("commodityId"));
							double consumeCash = Double.parseDouble((String)job.get("consumeCash"));
							double payCash = Double.parseDouble((String)job.get("payCash"));
							memberBillFlow.setConsumeNumber(number);
							memberBillFlow.setBillCash(consumeCash);
							memberBillFlow.setPayCash(payCash);
							memberBillFlow.setPromotionId(promotionId);
							memberBillFlow.setCommodityId(commodityId);
							memberBillFlow.setIsDelete("1");
							if(flowType.equals("1")){//购买活动
								memberPaymentService.memberBuyPromotion(memberBillFlow);
								code="0";
							}
							else if(flowType.equals("2")){//购买商品
								memberPaymentService.memberBuyCommodity(memberBillFlow);
								code="0";
							}
							else{
								code="1";
							}
						}
					}
					else{
						code="1";
					}
				}
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
		 * 功能描述：会员流水-购买
		 * 作者：wanglin
		 * url：${webRoot}/wxpay/memberBillBuy
		 * 请求方式：POST
		 * @param {info,commodityIds,promotionIds} 
		 * @return Map<String,Object>
		 *         key:code["0":"成功","1":"失败"]
		 */
		@RequestMapping(value="memberBillBuy",method=RequestMethod.POST)
		public @ResponseBody Map<String,Object> memberBillBuy(@RequestBody Map<String,Object> billMap){
			Map<String,Object> map=new HashMap<String,Object>();
			String code="";
			String message="";
			double cash = -1000000,totalCash=0;
			int number = 0,userId = 0,companyMemberId=0,companyId=0,memberCommodityId=0,recorderId=0;
			try{
				if(billMap.get("userId")!=null){
					userId = (Integer)billMap.get("userId");
				}
				if(billMap.get("companyMemberId")!=null){
					companyMemberId =  (Integer)billMap.get("companyMemberId");
				}
				if(billMap.get("companyId")!=null){
					companyId =  (Integer)billMap.get("companyId");
				}
				if(billMap.get("memberCommodityId")!=null){
					memberCommodityId =  (Integer)billMap.get("memberCommodityId");
				}
				if(billMap.get("recorderId")!=null){
					recorderId = (Integer)billMap.get("recorderId");
				}
				if(billMap.get("totalCash")!=null){
					totalCash =(Double) billMap.get("totalCash");
				}
				if(companyMemberService.selectByPrimaryKey(companyMemberId)!=null){
					cash = companyMemberService.selectByPrimaryKey(companyMemberId).getCash();
				}
				String flowType = billMap.get("flowType").toString();
				if(billMap.get("num")!=null){
					number = (Integer)billMap.get("num");
				}
				double consumeCash =(Double) billMap.get("consumeCash");
				double payCash = (Double) billMap.get("payCash");
				MemberBillFlow memberBillFlow = new MemberBillFlow();
				memberBillFlow.setUserId(userId);
				memberBillFlow.setCompanyId(companyId);
				memberBillFlow.setCompanyMemberId(companyMemberId);
				memberBillFlow.setMemberCommodityId(memberCommodityId);
				memberBillFlow.setRecorderId(recorderId);
				memberBillFlow.setBillModel(billMap.get("billModel").toString());
				memberBillFlow.setFlowType(flowType);
				memberBillFlow.setConsumeNumber(number);
				memberBillFlow.setBillCash(consumeCash);
				memberBillFlow.setPayCash(payCash);
				memberBillFlow.setIsDelete("1");
				if(cash ==-1000000){
					code = "1";
					message = "数据错误";
					map.put("message", message);
			        map.put("code", code);
			        return map;
				}
				else if(cash<totalCash){
					code = "1";
					message = "余额不足";
					map.put("message", message);
			        map.put("code", code);
			        return map; 
				}
				else{
					String[] commodityIds = billMap.get("commodityIds").toString().split(",");
					 for (int i = 0; i < commodityIds.length; i++) {
						 memberBillFlow.setCommodityId(Integer.parseInt(commodityIds[i]));
						 memberPaymentService.memberBuyCommodity(memberBillFlow); 
					 }
					 String[] promotionIds = billMap.get("promotionIds").toString().split(",");
					 for (int i = 0; i < commodityIds.length; i++) {
						 memberBillFlow.setCommodityId(Integer.parseInt(promotionIds[i]));
						 memberPaymentService.memberBuyPromotion(memberBillFlow);
					 }
				}
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
		 * 功能描述：会员流水-非购买
		 * 作者：wanglin
		 * url：${webRoot}/wxpay/memberBillFlow
		 * 请求方式：POST
		 * @param  list[int userId,int commodityId,int promotionId,int num]
		 * @return Map<String,Object>
		 *         key:code["0":"成功","1":"失败"]
		 */
		@RequestMapping(value="memberBillFlow",method=RequestMethod.POST)
		public @ResponseBody Map<String,Object> memberBillFlow(String BillFlow){
			Map<String,Object> map=new HashMap<String,Object>();
			String code="";
			String message="";
			try{
				JSONObject json = JSONObject.fromObject(BillFlow);
				String flowType = (String)json.get("flowType");
				MemberBillFlow memberBillFlow = new MemberBillFlow();
				memberBillFlow.setUserId((Integer)json.get("userId"));
				memberBillFlow.setCompanyId((Integer)json.get("companyId"));
				memberBillFlow.setCompanyMemberId((Integer)json.get("companyMemberId"));
				memberBillFlow.setMemberCommodityId((Integer)json.get("memberCommodityId"));
				memberBillFlow.setBillCash((Double)json.get("billCash"));
				memberBillFlow.setPayCash((Double)json.get("payCash"));
				memberBillFlow.setIsDelete("1");
				memberBillFlow.setRecorderId((Integer)json.get("recorderId"));
				memberBillFlow.setBillModel((String) json.get("billModel"));
				memberBillFlow.setFlowType(flowType);
				if(flowType.equals("1")){//消费券
					memberPaymentService.memberConsume(memberBillFlow);
					code="0";
				}
				else if(flowType.equals("3")){//现金消费
					memberPaymentService.memberCash(memberBillFlow);
					code="0";
				}
				else if (flowType.equals("4")){//充值
					memberPaymentService.memberRecharge(memberBillFlow);
					code="0";
				}
				else{
					code="1";
				}
				
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
		 * 功能描述：获取门店活动和商品
		 * 作者：wanglin
		 * url：${webRoot}/wxpay/getSaleList
		 * 请求方式：POST
		 * @param  list[int userId,int commodityId,int promotionId,int num]
		 * @return Map<String,Object>
		 *         key:code["0":"成功","1":"失败"]
		 */
		@RequestMapping(value="getSaleList",method=RequestMethod.POST)
		public @ResponseBody Map<String,Object> getSaleList(int companyId){
			Map<String,Object> map=new HashMap<String,Object>();
			String code="";
			String message="";
			try{
				List<CompanyPromotion> companyPromotionList = companyPromotionService.selectByCompanyId(companyId);
				List<CompanyCommodity> companyCommodityList = companyCommodityService.selectByCompanyId(companyId);
				code="0";
                map.put("companyPromotionList",companyPromotionList);
                map.put("companyCommodityList",companyCommodityList);
			}catch(Exception e){
	            code="2";
	            message="未知异常，请重试";
	            e.printStackTrace();
	        }
			map.put("message", message);
	        map.put("code", code);
	        return map;
		}	
		
		
		
		
		
		public static void main(String args[]) {
	        System.out.println((int)((Math.random()*9+1)*1000000000));
	        String aaa = "[{\"userId\":111,\"commodityId\":111,\"promotionId\":'',\"num\":4},{\"userId\":5,\"commodityId\":6,\"num\":8}]";
	        JSONArray jsonArray = JSONArray.fromObject(aaa);
	        System.out.println(jsonArray);
//	        JSONObject jsonObject = JSONObject.fromObject(aaa);
//	        System.out.println(jsonObject);
	        
	    } 
		
		
}
