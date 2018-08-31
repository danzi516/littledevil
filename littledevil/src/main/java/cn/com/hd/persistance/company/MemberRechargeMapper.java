package cn.com.hd.persistance.company;


import java.util.List;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyInfo;
import cn.com.hd.domain.company.MemberConsume;
import cn.com.hd.domain.company.MemberRecharge;


public interface MemberRechargeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MemberRecharge record);

    int insertSelective(MemberRecharge record);

    MemberRecharge selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MemberRecharge record);

    int updateByPrimaryKey(MemberRecharge record);
    
    List<MemberRecharge> selectByPage(Page page);
    
    List<MemberRecharge>  selectBySelective(MemberRecharge record);
}