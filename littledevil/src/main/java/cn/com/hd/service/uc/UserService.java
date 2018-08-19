package cn.com.hd.service.uc;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.hd.common.http.HttpRequest;
import cn.com.hd.common.security.AESUtils;
import cn.com.hd.domain.uc.User;
import cn.com.hd.persistance.uc.UserMapper;

@Service("userService")
public class UserService {
	@Autowired
	private UserMapper userMapper;
	@Transactional
	public int deleteByPrimaryKey(Integer id){
		return userMapper.deleteByPrimaryKey(id);
	}
	@Transactional
	public int insert(User record){
    	return userMapper.insert(record);
    }
	@Transactional
    public int insertSelective(User record){
    	return userMapper.insertSelective(record);
    }
    
    public User selectByPrimaryKey(Integer id){
    	return userMapper.selectByPrimaryKey(id);
    }
    @Transactional
    public int updateByPrimaryKeySelective(User record){
    	return userMapper.updateByPrimaryKeySelective(record);
    }
    @Transactional
    public int updateByPrimaryKey(User record){
    	return userMapper.updateByPrimaryKey(record);
    }
    
    public User userLogin(User record){
    	return userMapper.userLogin(record);
    }
    
    public User selectByCondition(User record){
    	return userMapper.selectByCondition(record);
    }
    
    public Map<String, Object> getWxUserInfo(String encryptedData, String session_key, String iv) throws Exception{
        //////////////// 2、对encryptedData加密数据进行AES解密 ////////////////
            String result = AESUtils.decrypt(encryptedData, session_key, iv, "UTF-8");
                JSONObject userInfoJSON = JSONObject.fromObject(result);
                Map<String, Object> userInfo = new HashMap<String, Object>();
                userInfo.put("openId", userInfoJSON.get("openId"));
                userInfo.put("nickName", userInfoJSON.get("nickName"));
                userInfo.put("gender", userInfoJSON.get("gender"));
                userInfo.put("city", userInfoJSON.get("city"));
                userInfo.put("province", userInfoJSON.get("province"));
                userInfo.put("country", userInfoJSON.get("country"));
                userInfo.put("avatarUrl", userInfoJSON.get("avatarUrl"));
                userInfo.put("unionId", userInfoJSON.get("unionId"));
                //userInfo.put("userInfo", userInfo);
                return userInfo;
    }
    public JSONObject getOpenIdAndSessionKey(String wxspAppid, String wxspSecret, String code,String grant_type){
    	  //////////////// 1、向微信服务器 使用登录凭证 code 获取 session_key 和 openid ////////////////
        //请求参数
    	  String params = "appid=" + wxspAppid + "&secret=" + wxspSecret + "&js_code=" + code + "&grant_type=" + grant_type;
          //发送请求
          String sr = HttpRequest.sendGet("https://api.weixin.qq.com/sns/jscode2session", params);
          //解析相应内容（转换成json对象）
          JSONObject json = JSONObject.fromObject(sr);
          //获取会话密钥（session_key）
          String session_key = json.get("session_key").toString();
          //用户的唯一标识（openid）
          String openId = (String) json.get("openid");
          return json;
    }
    
}
