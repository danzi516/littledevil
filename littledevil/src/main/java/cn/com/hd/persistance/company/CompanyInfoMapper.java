package cn.com.hd.persistance.company;

import java.util.List;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyInfo;


public interface CompanyInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CompanyInfo record);

    int insertSelective(CompanyInfo record);

    CompanyInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CompanyInfo record);

    int updateByPrimaryKey(CompanyInfo record);
    
    List<CompanyInfo> selectCompanyByPage(Page page);
    
    List<CompanyInfo> selectCompanyAllList();
}