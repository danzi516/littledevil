package cn.com.hd.service.sys;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.hd.common.Page;
import cn.com.hd.domain.sys.AppInfo;
import cn.com.hd.domain.sys.AppOperation;
import cn.com.hd.domain.uc.UserInfo;
import cn.com.hd.persistance.sys.AppInfoMapper;
import cn.com.hd.persistance.uc.UserInfoMapper;

@Service("appInfoService")
public class AppInfoService {
	@Autowired
	private AppInfoMapper appInfoMapper;
	@Transactional
	public int deleteByPrimaryKey(Integer id){
		return appInfoMapper.deleteByPrimaryKey(id);
	}
	@Transactional
	public int insert(AppInfo record){
    	return appInfoMapper.insert(record);
    }
	@Transactional
    public int insertSelective(AppInfo record){
    	return appInfoMapper.insertSelective(record);
    }

    public AppInfo selectByPrimaryKey(Integer id){
    	return appInfoMapper.selectByPrimaryKey(id);
    }
    @Transactional
    public int updateByPrimaryKeySelective(AppInfo record){
    	return appInfoMapper.updateByPrimaryKeySelective(record);
    }
    @Transactional
    public int updateByPrimaryKey(AppInfo record){
    	return appInfoMapper.updateByPrimaryKey(record);
    }
    
    public Page selectAppInfoByPage(Page page){
    	page.setData(appInfoMapper.selectAppInfoByPage(page));
    	return page;
    }
    
    public List<AppInfo> selectAllAppInfo(){
		List<AppInfo> AppInfoList = appInfoMapper.selectAllAppInfo();
    	return AppInfoList;
    }
}
