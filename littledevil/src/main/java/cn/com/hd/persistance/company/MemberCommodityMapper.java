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
    
    List<MemberCommodity> selectByPage(Page page);
    
    List<MemberCommodity> selectPageByCompanyId(Page page);
    
    List<MemberCommodity> selectByCompanyId(int CompanyId);
    
    List<MemberCommodity> selectMemberCommodityByuserIdAndcompanyId(MemberCommodity record);
    
    int sumNumberByuserIdAndcompanyId(MemberCommodity record);
    
    int sumNumberByuserIdAndcommodityId(MemberCommodity record);
    
    List<MemberCommodity> selectMemberCommodityByuserIdAndcommodityId(MemberCommodity record);
    
}