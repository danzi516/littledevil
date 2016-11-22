package cn.com.hd.persistance.uc;

import cn.com.hd.domain.uc.User;


public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    User userLogin(User record);
    
    User selectByCondition(User record);
}