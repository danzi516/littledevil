package cn.com.hd.service.company;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CommodityCategory;
import cn.com.hd.domain.company.CompanyCommodity;
import cn.com.hd.domain.company.CompanyInfo;
import cn.com.hd.persistance.company.CommodityCategoryMapper;
import cn.com.hd.persistance.company.CompanyCommodityMapper;


@Service("commodityCategoryService")
public class CommodityCategoryService {
	@Autowired
	private CommodityCategoryMapper commodityCategoryMapper;
	@Transactional
	public int deleteByPrimaryKey(Integer id){
		return commodityCategoryMapper.deleteByPrimaryKey(id);
	}
	@Transactional
	public int insert(CommodityCategory record){
    	return commodityCategoryMapper.insert(record);
    }
	@Transactional
	public int insertSelective(CommodityCategory record){
    	return commodityCategoryMapper.insertSelective(record);
    }
	public CommodityCategory selectByPrimaryKey(Integer id){
    	return commodityCategoryMapper.selectByPrimaryKey(id);
    }
	@Transactional
	public int updateByPrimaryKeySelective(CommodityCategory record){
    	return commodityCategoryMapper.updateByPrimaryKeySelective(record);
    }
	@Transactional
	public int updateByPrimaryKey(CommodityCategory record){
    	return commodityCategoryMapper.updateByPrimaryKey(record);
    }
	
	public Page selectByCompanyIdByPage(Page page){
		page.setData(commodityCategoryMapper.selectByCompanyIdByPage(page));
    	return page;
    }
	
	public List<CommodityCategory> selectByCompanyId(Integer companyId){
		List<CommodityCategory> CommodityCategoryList = commodityCategoryMapper.selectByCompanyId(companyId);
    	return CommodityCategoryList;
    }
}
