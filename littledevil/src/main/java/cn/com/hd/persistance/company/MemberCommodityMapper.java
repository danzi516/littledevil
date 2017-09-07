package cn.com.hd.persistance.company;


import java.util.List;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.MemberCommodity;


public interface MemberCommodityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MemberCommodity record);

    int insertSelective(MemberCommodity record);

    MemberCommodity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MemberCommodity record);

    int updateByPrimaryKey(MemberCommodity record);
    
    List<MemberCommodity> selectCompanyByPage(Page page);
    
    List<MemberCommodity> selectMemberCommodityByuserIdAndcompanyId(MemberCommodity record);
    
    int sumNumberByuserIdAndcompanyId(MemberCommodity record);
    
    MemberCommodity selectMemberCommodityByuserIdAndcommodityId(MemberCommodity record);
    
}