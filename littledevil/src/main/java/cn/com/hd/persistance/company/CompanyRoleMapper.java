package cn.com.hd.persistance.company;

import cn.com.hd.domain.company.CompanyRole;


public interface CompanyRoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CompanyRole record);

    int insertSelective(CompanyRole record);

    CompanyRole selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CompanyRole record);

    int updateByPrimaryKey(CompanyRole record);
}