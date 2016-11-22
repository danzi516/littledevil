package cn.com.hd.persistance.sys;

import cn.com.hd.domain.sys.AppInfo;


public interface AppInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AppInfo record);

    int insertSelective(AppInfo record);

    AppInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AppInfo record);

    int updateByPrimaryKey(AppInfo record);
}