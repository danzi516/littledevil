package cn.com.hd.persistance.company;

import java.util.List;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CommodityCategory;
import cn.com.hd.domain.company.CompanyCommodity;


public interface CommodityCategoryMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(CommodityCategory record);

    int insertSelective(CommodityCategory record);

    CommodityCategory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CommodityCategory record);

    int updateByPrimaryKeyWithBLOBs(CommodityCategory record);

    int updateByPrimaryKey(CommodityCategory record);
    
    List<CommodityCategory> selectByCompanyIdByPage(Page page);
    
    List<CommodityCategory> selectByCompanyId(Integer companyId);
}