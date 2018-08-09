package cn.com.hd.service.company;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyAuth;
import cn.com.hd.domain.company.CompanyRechargeLog;
import cn.com.hd.persistance.company.CompanyAuthMapper;
import cn.com.hd.persistance.company.CompanyRechargeLogMapper;

@Service("companyAuthService")
public class CompanyRechargeLogService {
	@Autowired
	private CompanyRechargeLogMapper companyRechargeLogMapper;
	@Transactional
	public int deleteByPrimaryKey(Integer id){
		return companyRechargeLogMapper.deleteByPrimaryKey(id);
	}
	@Transactional
	public int insert(CompanyRechargeLog record){
    	return companyRechargeLogMapper.insert(record);
    }
	@Transactional
	public int insertSelective(CompanyRechargeLog record){
    	return companyRechargeLogMapper.insertSelective(record);
    }

	public CompanyRechargeLog selectByPrimaryKey(Integer id){
    	return companyRechargeLogMapper.selectByPrimaryKey(id);
    }
	@Transactional
	public int updateByPrimaryKeySelective(CompanyRechargeLog record){
    	return companyRechargeLogMapper.updateByPrimaryKeySelective(record);
    }
	@Transactional
	public int updateByPrimaryKey(CompanyRechargeLog record){
    	return companyRechargeLogMapper.updateByPrimaryKey(record);
    }
	public Page selectByPage(Page page){
		page.setData(companyRechargeLogMapper.selectByPage(page));
    	return page;
    }
	public List<CompanyRechargeLog> selectBySelective(CompanyRechargeLog record){
		return companyRechargeLogMapper.selectBySelective(record);
    }
}
