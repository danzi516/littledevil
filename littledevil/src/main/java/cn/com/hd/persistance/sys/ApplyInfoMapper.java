package cn.com.hd.persistance.sys;



import java.util.List;

import cn.com.hd.common.Page;
import cn.com.hd.domain.sys.AppInfo;
import cn.com.hd.domain.sys.AppOperation;
import cn.com.hd.domain.sys.ApplyInfo;


public interface ApplyInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ApplyInfo record);

    int insertSelective(ApplyInfo record);

    ApplyInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ApplyInfo record);

    int updateByPrimaryKey(ApplyInfo record);
    
    List<ApplyInfo> selectApplyInfoByPage(Page page);
    
    List<ApplyInfo> selectAllApplyInfo();
}