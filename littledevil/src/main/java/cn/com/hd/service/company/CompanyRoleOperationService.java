package cn.com.hd.service.company;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyInfo;
import cn.com.hd.domain.company.CompanyRoleOperation;
import cn.com.hd.persistance.company.CompanyInfoMapper;
import cn.com.hd.persistance.company.CompanyRoleOperationMapper;

@Service("companyRoleOperationService")
public class CompanyRoleOperationService {
	@Autowired
	private CompanyRoleOperationMapper companyRoleOperationMapper;
	@Transactional
	public int deleteByPrimaryKey(Integer id){
		return companyRoleOperationMapper.deleteByPrimaryKey(id);
	}
	@Transactional
	public int deleteByRoleId(Integer id){
		return companyRoleOperationMapper.deleteByRoleId(id);
	}
	@Transactional
	public int insert(CompanyRoleOperation record){
    	return companyRoleOperationMapper.insert(record);
    }
	@Transactional
	public int insertSelective(CompanyRoleOperation record){
    	return companyRoleOperationMapper.insertSelective(record);
    }

	public CompanyRoleOperation selectByPrimaryKey(Integer id){
    	return companyRoleOperationMapper.selectByPrimaryKey(id);
    }
	@Transactional
	public int updateByPrimaryKeySelective(CompanyRoleOperation record){
    	return companyRoleOperationMapper.updateByPrimaryKeySelective(record);
    }
	@Transactional
	public int updateByPrimaryKey(CompanyRoleOperation record){
    	return companyRoleOperationMapper.updateByPrimaryKey(record);
    }
    
	public Page selectByPage(Page page){
		page.setData(companyRoleOperationMapper.selectByPage(page));
    	return page;
    }
	
	public  List<CompanyRoleOperation> selectByRoleId(Integer id){
		List<CompanyRoleOperation> companyRoleOperationList = companyRoleOperationMapper.selectByRoleId(id);
    	return companyRoleOperationList;
    }
}
