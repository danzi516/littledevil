package cn.com.hd.service.company;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyAuth;
import cn.com.hd.persistance.company.CompanyAuthMapper;

@Service("companyAuthService")
public class CompanyAuthService {
	@Autowired
	private CompanyAuthMapper companyAuthMapper;
	@Transactional
	public int deleteByPrimaryKey(Integer id){
		return companyAuthMapper.deleteByPrimaryKey(id);
	}
	@Transactional
	public int insert(CompanyAuth record){
    	return companyAuthMapper.insert(record);
    }
	@Transactional
	public int insertSelective(CompanyAuth record){
    	return companyAuthMapper.insertSelective(record);
    }

	public CompanyAuth selectByPrimaryKey(Integer id){
    	return companyAuthMapper.selectByPrimaryKey(id);
    }
	@Transactional
	public int updateByPrimaryKeySelective(CompanyAuth record){
    	return companyAuthMapper.updateByPrimaryKeySelective(record);
    }
	@Transactional
	public int updateByPrimaryKey(CompanyAuth record){
    	return companyAuthMapper.updateByPrimaryKey(record);
    }
	@Transactional
	public int updateByCompanyId(CompanyAuth record){
    	return companyAuthMapper.updateByCompanyId(record);
    }
	public Page selectByPage(Page page){
		page.setData(companyAuthMapper.selectByPage(page));
    	return page;
    }
	public List<CompanyAuth> selectBySelective(CompanyAuth record){
		return companyAuthMapper.selectBySelective(record);
    }
}
