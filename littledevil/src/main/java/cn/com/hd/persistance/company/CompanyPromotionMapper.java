package cn.com.hd.persistance.company;

import java.util.List;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyPromotion;


public interface CompanyPromotionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CompanyPromotion record);

    int insertSelective(CompanyPromotion record);

    CompanyPromotion selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CompanyPromotion record);

    int updateByPrimaryKeyWithBLOBs(CompanyPromotion record);

    int updateByPrimaryKey(CompanyPromotion record);
    
    List<CompanyPromotion> selectByPage(Page page);
    
    List<CompanyPromotion> selectBySelective(CompanyPromotion record);
    
    List<CompanyPromotion> selectByCompanyId(Integer companyId);
}