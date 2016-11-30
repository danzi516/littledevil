package cn.com.hd.persistance.company;

import java.util.List;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyCommodity;


public interface CompanyCommodityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CompanyCommodity record);

    int insertSelective(CompanyCommodity record);

    CompanyCommodity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CompanyCommodity record);

    int updateByPrimaryKeyWithBLOBs(CompanyCommodity record);

    int updateByPrimaryKey(CompanyCommodity record);
    
    List<CompanyCommodity> selectCompanyCommodityByPage(Page page);
    
    List<CompanyCommodity> selectByCompanyId(Integer companyId);
}