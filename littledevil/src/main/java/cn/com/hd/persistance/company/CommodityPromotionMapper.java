package cn.com.hd.persistance.company;

import java.util.List;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CommodityPromotion;


public interface CommodityPromotionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CommodityPromotion record);

    int insertSelective(CommodityPromotion record);

    CommodityPromotion selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CommodityPromotion record);

    int updateByPrimaryKey(CommodityPromotion record);
    
    List<CommodityPromotion> selectByPage(Page page);
    
    List<CommodityPromotion> selectBySelective(CommodityPromotion record);
    
    List<CommodityPromotion> selectByCompanyId(Integer companyId);
}