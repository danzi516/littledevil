package cn.com.hd.service.company;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CommodityPromotion;
import cn.com.hd.domain.company.CompanyInfo;
import cn.com.hd.persistance.company.CommodityPromotionMapper;


@Service("commodityPromotionService")
public class CommodityPromotionService {
	@Autowired
	private CommodityPromotionMapper CommodityPromotionMapper;
	@Transactional
	public int deleteByPrimaryKey(Integer id){
		return CommodityPromotionMapper.deleteByPrimaryKey(id);
	}
	@Transactional
	public int insert(CommodityPromotion record){
    	return CommodityPromotionMapper.insert(record);
    }
	@Transactional
	public int insertSelective(CommodityPromotion record){
    	return CommodityPromotionMapper.insertSelective(record);
    }
	public CommodityPromotion selectByPrimaryKey(Integer id){
    	return CommodityPromotionMapper.selectByPrimaryKey(id);
    }
	@Transactional
	public int updateByPrimaryKeySelective(CommodityPromotion record){
    	return CommodityPromotionMapper.updateByPrimaryKeySelective(record);
    }
	@Transactional
	public int updateByPrimaryKey(CommodityPromotion record){
    	return CommodityPromotionMapper.updateByPrimaryKey(record);
    }
	
	public Page selectByPage(Page page){
		page.setData(CommodityPromotionMapper.selectByPage(page));
    	return page;
    }
	
	public List<CommodityPromotion> selectBySelective(CommodityPromotion record){
		List<CommodityPromotion> CommodityPromotionList = CommodityPromotionMapper.selectBySelective(record);
    	return CommodityPromotionList;
    }
	
	public List<CommodityPromotion> selectByCompanyId(Integer companyId){
		List<CommodityPromotion> CommodityPromotionList = CommodityPromotionMapper.selectByCompanyId(companyId);
    	return CommodityPromotionList;
    }
}
