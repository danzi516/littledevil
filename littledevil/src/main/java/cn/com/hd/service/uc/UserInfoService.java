package cn.com.hd.service.uc;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.hd.common.Page;
import cn.com.hd.domain.uc.UserInfo;
import cn.com.hd.persistance.uc.UserInfoMapper;

@Service("userInfoService")
public class UserInfoService {
	@Autowired
	private UserInfoMapper userInfoMapper;
	@Transactional
	public int deleteByPrimaryKey(Integer id){
		return userInfoMapper.deleteByPrimaryKey(id);
	}
	@Transactional
	public int insert(UserInfo record){
    	return userInfoMapper.insert(record);
    }
	@Transactional
    public int insertSelective(UserInfo record){
    	return userInfoMapper.insertSelective(record);
    }

    public UserInfo selectByPrimaryKey(Integer id){
    	return userInfoMapper.selectByPrimaryKey(id);
    }
    @Transactional
    public int updateByPrimaryKeySelective(UserInfo record){
    	return userInfoMapper.updateByPrimaryKeySelective(record);
    }
    @Transactional
    public int updateByPrimaryKey(UserInfo record){
    	return userInfoMapper.updateByPrimaryKey(record);
    }
    
    public Page selectUserInfoByPage(Page page){
    	page.setData(userInfoMapper.selectUserInfoByPage(page));
    	return page;
    }
}
