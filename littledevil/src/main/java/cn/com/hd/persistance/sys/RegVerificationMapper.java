package cn.com.hd.persistance.sys;



import java.util.List;

import cn.com.hd.common.Page;
import cn.com.hd.domain.sys.AppInfo;
import cn.com.hd.domain.sys.AppOperation;
import cn.com.hd.domain.sys.RegVerification;


public interface RegVerificationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RegVerification record);

    int insertSelective(RegVerification record);

    RegVerification selectByPrimaryKey(Integer id);
    
    List<RegVerification>  selectBySelective(RegVerification record);
    
    int updateByPrimaryKeySelective(RegVerification record);

    int updateByPrimaryKey(RegVerification record);
    
    List<RegVerification> selectByPage(Page page);
    
    List<RegVerification> selectAll();
}