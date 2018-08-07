package cn.com.hd.persistance.company;

import java.util.List;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyAuth;


public interface CompanyAuthMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CompanyAuth record);

    int insertSelective(CompanyAuth record);

    CompanyAuth selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CompanyAuth record);

    int updateByPrimaryKey(CompanyAuth record);
    
    int updateByCompanyId(CompanyAuth record);
    
    List<CompanyAuth> selectByPage(Page page);
    
    List<CompanyAuth> selectBySelective(CompanyAuth record);
}