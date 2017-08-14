package cn.com.hd.persistance.uc;

import java.util.List;

import cn.com.hd.domain.uc.UserFollow;

public interface UserFollowMapper {
	int deleteByPrimaryKey(Integer id);

    int insert(UserFollow record);

    int insertSelective(UserFollow record);

    UserFollow selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserFollow record);

    int updateByPrimaryKey(UserFollow record);
    
    List<UserFollow> selectCompanyByuserId(int userId);
    
}
