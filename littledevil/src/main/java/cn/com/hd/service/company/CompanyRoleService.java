package cn.com.hd.service.company;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyInfo;
import cn.com.hd.domain.company.CompanyRole;
import cn.com.hd.domain.company.CompanyRoleOperation;
import cn.com.hd.persistance.company.CompanyRoleMapper;

@Service("companyRoleService")
public class CompanyRoleService {
	@Autowired
	private CompanyRoleMapper companyRoleMapper;
	@Transactional
	public int deleteByPrimaryKey(Integer id){
		return companyRoleMapper.deleteByPrimaryKey(id);
	}
	@Transactional
	public int insert(CompanyRole record){
    	return companyRoleMapper.insert(record);
    }
	@Transactional
	public int insertSelective(CompanyRole record){
    	return companyRoleMapper.insertSelective(record);
    }

	public CompanyRole selectByPrimaryKey(Integer id){
    	return companyRoleMapper.selectByPrimaryKey(id);
    }
	@Transactional
	public int updateByPrimaryKeySelective(CompanyRole record){
    	return companyRoleMapper.updateByPrimaryKeySelective(record);
    }
	@Transactional
	public int updateByPrimaryKey(CompanyRole record){
    	return companyRoleMapper.updateByPrimaryKey(record);
    }
    
	public Page selectByPage(Page page){
		page.setData(companyRoleMapper.selectByPage(page));
    	return page;
    }
}
