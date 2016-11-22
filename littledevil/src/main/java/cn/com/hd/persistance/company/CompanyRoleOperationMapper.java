package cn.com.hd.persistance.company;

import cn.com.hd.domain.company.CompanyRoleOperation;


public interface CompanyRoleOperationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CompanyRoleOperation record);

    int insertSelective(CompanyRoleOperation record);

    CompanyRoleOperation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CompanyRoleOperation record);

    int updateByPrimaryKey(CompanyRoleOperation record);
}