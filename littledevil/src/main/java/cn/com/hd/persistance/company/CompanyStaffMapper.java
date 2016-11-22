package cn.com.hd.persistance.company;

import cn.com.hd.domain.company.CompanyStaff;

public interface CompanyStaffMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CompanyStaff record);

    int insertSelective(CompanyStaff record);

    CompanyStaff selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CompanyStaff record);

    int updateByPrimaryKey(CompanyStaff record);
}