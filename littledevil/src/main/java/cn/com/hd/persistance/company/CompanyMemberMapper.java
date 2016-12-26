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
    
    List<CompanyMember> selectCompanyMemberByPage(Page page);
    
    CompanyMember selectByCondition(CompanyMember record);
}