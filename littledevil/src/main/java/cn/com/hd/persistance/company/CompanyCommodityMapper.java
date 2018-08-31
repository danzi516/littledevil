package cn.com.hd.persistance.company;

import java.util.List;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyCommodity;
import cn.com.hd.domain.company.CompanyInfo;


public interface CompanyCommodityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CompanyCommodity record);

    int insertSelective(CompanyCommodity record);

    CompanyCommodity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CompanyCommodity record);

    int updateByPrimaryKeyWithBLOBs(CompanyCommodity record);

    int updateByPrimaryKey(CompanyCommodity record);
    
    List<CompanyCommodity>  selectBySelective(CompanyCommodity record);
    
    List<CompanyCommodity> selectByPage(Page page);
    
    List<CompanyCommodity> selectByCompanyId(Integer companyId);
}