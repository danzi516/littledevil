package cn.com.hd.persistance.company;

import java.util.List;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyMember;
import cn.com.hd.domain.uc.User;


public interface CompanyMemberMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CompanyMember record);

    int insertSelective(CompanyMember record);

    CompanyMember selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CompanyMember record);

    int updateByPrimaryKey(CompanyMember record);
    
    List<CompanyMember> selectByPage(Page page);
    
    List<CompanyMember> selectCompanyMemberByuserId(int userId);
    
    CompanyMember selectByCondition(CompanyMember record);
    
    CompanyMember selectCompanyMemberByuserIdAndcompanyId(CompanyMember record);
    
    List<CompanyMember> selectBySelective(CompanyMember record);
}