package cn.com.hd.persistance.company;

import cn.com.hd.domain.company.CompanyPayType;


public interface CompanyPayTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CompanyPayType record);

    int insertSelective(CompanyPayType record);

    CompanyPayType selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CompanyPayType record);

    int updateByPrimaryKey(CompanyPayType record);
}