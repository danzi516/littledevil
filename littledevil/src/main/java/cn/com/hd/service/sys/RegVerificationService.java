package cn.com.hd.service.sys;



import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.hd.common.Page;
import cn.com.hd.domain.sys.RegVerification;
import cn.com.hd.domain.sys.AppOperation;
import cn.com.hd.domain.uc.UserInfo;
import cn.com.hd.persistance.sys.RegVerificationMapper;
import cn.com.hd.persistance.uc.UserInfoMapper;

@Service("RegVerificationService")
public class RegVerificationService {
	@Autowired
	private RegVerificationMapper RegVerificationMapper;
	@Transactional
	public int deleteByPrimaryKey(Integer id){
		return RegVerificationMapper.deleteByPrimaryKey(id);
	}
	@Transactional
	public int insert(RegVerification record){
    	return RegVerificationMapper.insert(record);
    }
	@Transactional
    public int insertSelective(RegVerification record){
    	return RegVerificationMapper.insertSelective(record);
    }
	@Transactional
    public int insert111(RegVerification record){Insert.class.getClass();
    	return RegVerificationMapper.insertSelective(record);
    }

    public RegVerification selectByPrimaryKey(Integer id){
    	return RegVerificationMapper.selectByPrimaryKey(id);
    }
    
    public List<RegVerification> selectBySelective(RegVerification record){
    	return RegVerificationMapper.selectBySelective(record);
    }
    
    @Transactional
    public int updateByPrimaryKeySelective(RegVerification record){
    	return RegVerificationMapper.updateByPrimaryKeySelective(record);
    }
    @Transactional
    public int updateByPrimaryKey(RegVerification record){
    	return RegVerificationMapper.updateByPrimaryKey(record);
    }
    
    
}
