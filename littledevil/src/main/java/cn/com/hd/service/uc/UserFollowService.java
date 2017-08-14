package cn.com.hd.service.uc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyInfo;
import cn.com.hd.domain.uc.User;
import cn.com.hd.domain.uc.UserFollow;
import cn.com.hd.persistance.uc.UserFollowMapper;


@Service("userFollowService")
public class UserFollowService {
	
	@Autowired
	private UserFollowMapper userFollowMapper;
	
	@Transactional
	public int deleteByPrimaryKey(Integer id){
		return userFollowMapper.deleteByPrimaryKey(id);
	}
	
	@Transactional
	public int insert(UserFollow record){
    	return userFollowMapper.insert(record);
    }
	
	@Transactional
	public int insertSelective(UserFollow record){
    	return userFollowMapper.insertSelective(record);
    }
	
	public UserFollow selectByPrimaryKey(Integer id){
    	return userFollowMapper.selectByPrimaryKey(id);
    }
	
	@Transactional
	public int updateByPrimaryKeySelective(UserFollow record){
    	return userFollowMapper.updateByPrimaryKeySelective(record);
    }
	@Transactional
	public int updateByPrimaryKey(UserFollow record){
    	return userFollowMapper.updateByPrimaryKey(record);
    }

	
	public List<UserFollow> selectCompanyByuserId(int userId){
		return userFollowMapper.selectCompanyByuserId(userId);
    }
	
}
