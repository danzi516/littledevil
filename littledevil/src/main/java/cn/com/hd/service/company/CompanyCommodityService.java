package cn.com.hd.service.company;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyCommodity;
import cn.com.hd.domain.company.CompanyInfo;
import cn.com.hd.persistance.company.CompanyCommodityMapper;


@Service("companyCommodityService")
public class CompanyCommodityService {
	@Autowired
	private CompanyCommodityMapper companyCommodityMapper;
	@Transactional
	public int deleteByPrimaryKey(Integer id){
		return companyCommodityMapper.deleteByPrimaryKey(id);
	}
	@Transactional
	public int insert(CompanyCommodity record){
    	return companyCommodityMapper.insert(record);
    }
	@Transactional
	public int insertSelective(CompanyCommodity record){
    	return companyCommodityMapper.insertSelective(record);
    }
	public CompanyCommodity selectByPrimaryKey(Integer id){
    	return companyCommodityMapper.selectByPrimaryKey(id);
    }
	@Transactional
	public int updateByPrimaryKeySelective(CompanyCommodity record){
    	return companyCommodityMapper.updateByPrimaryKeySelective(record);
    }
	@Transactional
	public int updateByPrimaryKey(CompanyCommodity record){
    	return companyCommodityMapper.updateByPrimaryKey(record);
    }
	
	public Page selectCompanyCommodityByPage(Page page){
		page.setData(companyCommodityMapper.selectCompanyCommodityByPage(page));
    	return page;
    }
}
