package cn.com.hd.service.sys;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.hd.common.Page;
import cn.com.hd.domain.sys.AppInfo;
import cn.com.hd.domain.sys.AppOperation;
import cn.com.hd.domain.uc.UserInfo;
import cn.com.hd.persistance.sys.AppInfoMapper;
import cn.com.hd.persistance.sys.AppOperationMapper;
import cn.com.hd.persistance.uc.UserInfoMapper;

@Service("appOperationService")
public class AppOperationService {
	@Autowired
	private AppOperationMapper appOperationMapper;
	@Transactional
	public int deleteByPrimaryKey(Integer id){
		return appOperationMapper.deleteByPrimaryKey(id);
	}
	@Transactional
	public int insert(AppOperation record){
    	return appOperationMapper.insert(record);
    }
	@Transactional
    public int insertSelective(AppOperation record){
    	return appOperationMapper.insertSelective(record);
    }

    public AppOperation selectByPrimaryKey(Integer id){
    	return appOperationMapper.selectByPrimaryKey(id);
    }
    @Transactional
    public int updateByPrimaryKeySelective(AppOperation record){
    	return appOperationMapper.updateByPrimaryKeySelective(record);
    }
    @Transactional
    public int updateByPrimaryKey(AppOperation record){
    	return appOperationMapper.updateByPrimaryKey(record);
    }
    
   /* public Page selectAppInfoByPage(Page page){
    	page.setData(appOperationMapper.selectAppInfoByPage(page));
    	return page;
    }*/
}
