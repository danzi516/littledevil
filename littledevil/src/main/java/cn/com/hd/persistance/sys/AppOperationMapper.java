package cn.com.hd.persistance.sys;

import java.util.List;

import cn.com.hd.domain.sys.AppOperation;
import cn.com.hd.domain.uc.User;


public interface AppOperationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AppOperation record);

    int insertSelective(AppOperation record);

    AppOperation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AppOperation record);

    int updateByPrimaryKey(AppOperation record);
    
    List<AppOperation> selectByAppId(Integer appId);
    
    AppOperation selectByCondition(AppOperation record);
}