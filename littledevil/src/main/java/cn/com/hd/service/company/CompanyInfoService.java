package cn.com.hd.service.company;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyInfo;
import cn.com.hd.persistance.company.CompanyInfoMapper;

@Service("companyInfoService")
public class CompanyInfoService {
	@Autowired
	private CompanyInfoMapper companyInfoMapper;
	@Transactional
	public int deleteByPrimaryKey(Integer id){
		return companyInfoMapper.deleteByPrimaryKey(id);
	}
	@Transactional
	public int insert(CompanyInfo record){
    	return companyInfoMapper.insert(record);
    }
	@Transactional
	public int insertSelective(CompanyInfo record){
    	return companyInfoMapper.insertSelective(record);
    }

	public CompanyInfo selectByPrimaryKey(Integer id){
    	return companyInfoMapper.selectByPrimaryKey(id);
    }
	@Transactional
	public int updateByPrimaryKeySelective(CompanyInfo record){
    	return companyInfoMapper.updateByPrimaryKeySelective(record);
    }
	@Transactional
	public int updateByPrimaryKey(CompanyInfo record){
    	return companyInfoMapper.updateByPrimaryKey(record);
    }
    
	public Page selectCompanyByPage(Page page){
		page.setData(companyInfoMapper.selectCompanyByPage(page));
    	return page;
    }
	
	public List<CompanyInfo> selectCompanyAllList(){
		List<CompanyInfo> List = companyInfoMapper.selectCompanyAllList();
    	return List;
    }
}
