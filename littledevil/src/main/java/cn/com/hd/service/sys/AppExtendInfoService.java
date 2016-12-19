package cn.com.hd.service.sys;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.hd.domain.sys.AppExtendInfo;
import cn.com.hd.persistance.sys.AppExtendInfoMapper;

@Service("appExtendInfoService")
public class AppExtendInfoService {
	@Autowired
	private AppExtendInfoMapper appExtendInfoMapper;
	@Transactional
	public int deleteByPrimaryKey(Integer id){
		return appExtendInfoMapper.deleteByPrimaryKey(id);
	}
	@Transactional
	public int deleteByAppId(Integer appId){
		return appExtendInfoMapper.deleteByAppId(appId);
	}
	@Transactional
	public int insert(AppExtendInfo record){
    	return appExtendInfoMapper.insert(record);
    }
	@Transactional
    public int insertSelective(AppExtendInfo record){
    	return appExtendInfoMapper.insertSelective(record);
    }

    public AppExtendInfo selectByPrimaryKey(Integer id){
    	return appExtendInfoMapper.selectByPrimaryKey(id);
    }
    @Transactional
    public int updateByPrimaryKeySelective(AppExtendInfo record){
    	return appExtendInfoMapper.updateByPrimaryKeySelective(record);
    }
    @Transactional
    public int updateByPrimaryKey(AppExtendInfo record){
    	return appExtendInfoMapper.updateByPrimaryKey(record);
    }
    
    public List<AppExtendInfo> selectByappId(Integer appId){
		List<AppExtendInfo> AppExtendInfoList = appExtendInfoMapper.selectByAppId(appId);
    	return AppExtendInfoList;
    }
    
}
