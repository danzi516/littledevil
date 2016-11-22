package cn.com.hd.service.uc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
}
