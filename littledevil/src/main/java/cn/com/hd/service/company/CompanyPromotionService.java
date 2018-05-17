package cn.com.hd.service.company;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyPromotion;
import cn.com.hd.domain.company.CompanyInfo;
import cn.com.hd.persistance.company.CompanyPromotionMapper;


@Service("companyPromotionService")
public class CompanyPromotionService {
	@Autowired
	private CompanyPromotionMapper companyPromotionMapper;
	@Transactional
	public int deleteByPrimaryKey(Integer id){
		return companyPromotionMapper.deleteByPrimaryKey(id);
	}
	@Transactional
	public int insert(CompanyPromotion record){
    	return companyPromotionMapper.insert(record);
    }
	@Transactional
	public int insertSelective(CompanyPromotion record){
    	return companyPromotionMapper.insertSelective(record);
    }
	public CompanyPromotion selectByPrimaryKey(Integer id){
    	return companyPromotionMapper.selectByPrimaryKey(id);
    }
	@Transactional
	public int updateByPrimaryKeySelective(CompanyPromotion record){
    	return companyPromotionMapper.updateByPrimaryKeySelective(record);
    }
	@Transactional
	public int updateByPrimaryKey(CompanyPromotion record){
    	return companyPromotionMapper.updateByPrimaryKey(record);
    }
	
	public Page selectCompanyPromotionByPage(Page page){
		page.setData(companyPromotionMapper.selectCompanyPromotionByPage(page));
    	return page;
    }
	
	public List<CompanyPromotion> selectByCompanyId(Integer companyId){
		List<CompanyPromotion> CompanyPromotionList = companyPromotionMapper.selectByCompanyId(companyId);
    	return CompanyPromotionList;
    }
}
