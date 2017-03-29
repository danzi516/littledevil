package cn.com.hd.service.sys;



import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.hd.common.Page;
import cn.com.hd.domain.sys.ApplyInfo;
import cn.com.hd.domain.sys.AppOperation;
import cn.com.hd.domain.uc.UserInfo;
import cn.com.hd.persistance.sys.ApplyInfoMapper;
import cn.com.hd.persistance.uc.UserInfoMapper;

@Service("ApplyInfoService")
public class ApplyInfoService {
	@Autowired
	private ApplyInfoMapper ApplyInfoMapper;
	@Transactional
	public int deleteByPrimaryKey(Integer id){
		return ApplyInfoMapper.deleteByPrimaryKey(id);
	}
	@Transactional
	public int insert(ApplyInfo record){
    	return ApplyInfoMapper.insert(record);
    }
	@Transactional
    public int insertSelective(ApplyInfo record){
    	return ApplyInfoMapper.insertSelective(record);
    }
	@Transactional
    public int insert111(ApplyInfo record){Insert.class.getClass();
    	return ApplyInfoMapper.insertSelective(record);
    }

    public ApplyInfo selectByPrimaryKey(Integer id){
    	return ApplyInfoMapper.selectByPrimaryKey(id);
    }
    @Transactional
    public int updateByPrimaryKeySelective(ApplyInfo record){
    	return ApplyInfoMapper.updateByPrimaryKeySelective(record);
    }
    @Transactional
    public int updateByPrimaryKey(ApplyInfo record){
    	return ApplyInfoMapper.updateByPrimaryKey(record);
    }
    
    public Page selectApplyInfoByPage(Page page){
    	page.setData(ApplyInfoMapper.selectApplyInfoByPage(page));
    	return page;
    }
    
    public List<ApplyInfo> selectAllApplyInfo(){
		List<ApplyInfo> ApplyInfoList = ApplyInfoMapper.selectAllApplyInfo();
    	return ApplyInfoList;
    }
}
