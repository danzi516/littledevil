package cn.com.hd.persistance.company;

import cn.com.hd.domain.company.CompanyCommodity;


public interface CompanyCommodityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CompanyCommodity record);

    int insertSelective(CompanyCommodity record);

    CompanyCommodity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CompanyCommodity record);

    int updateByPrimaryKeyWithBLOBs(CompanyCommodity record);

    int updateByPrimaryKey(CompanyCommodity record);
}