package cn.com.hd.persistance.sys;



import java.util.List;

import cn.com.hd.common.Page;
import cn.com.hd.domain.sys.AppInfo;
import cn.com.hd.domain.sys.AppOperation;


public interface AppInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AppInfo record);

    int insertSelective(AppInfo record);

    AppInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AppInfo record);

    int updateByPrimaryKey(AppInfo record);
    
    List<AppInfo> selectAppInfoByPage(Page page);
    
    List<AppInfo> selectAllAppInfo();
}