package cn.com.hd.persistance.sys;

import java.util.List;

import cn.com.hd.common.Page;
import cn.com.hd.domain.sys.AppExtendInfo;
import cn.com.hd.domain.sys.AppInfo;


public interface AppExtendInfoMapper {
    int deleteByPrimaryKey(Integer id);
    
    int deleteByAppId(Integer appId);

    int insert(AppExtendInfo record);

    int insertSelective(AppExtendInfo record);

    AppExtendInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AppExtendInfo record);

    int updateByPrimaryKey(AppExtendInfo record);
    
    List<AppExtendInfo> selectByAppId(Integer appId);
}