package cn.com.hd.service.company;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyInfo;
import cn.com.hd.domain.company.CompanyStaff;
import cn.com.hd.persistance.company.CompanyInfoMapper;
import cn.com.hd.persistance.company.CompanyStaffMapper;

@Service("companyStaffService")
public class CompanyStaffService {
	@Autowired
	private CompanyStaffMapper companyStaffMapper;
	@Transactional
	public int deleteByPrimaryKey(Integer id){
		return companyStaffMapper.deleteByPrimaryKey(id);
	}
	@Transactional
	public int insert(CompanyStaff record){
    	return companyStaffMapper.insert(record);
    }
	@Transactional
	public int insertSelective(CompanyStaff record){
    	return companyStaffMapper.insertSelective(record);
    }

	public CompanyStaff selectByPrimaryKey(Integer id){
    	return companyStaffMapper.selectByPrimaryKey(id);
    }
	@Transactional
	public int updateByPrimaryKeySelective(CompanyStaff record){
    	return companyStaffMapper.updateByPrimaryKeySelective(record);
    }
	@Transactional
	public int updateByPrimaryKey(CompanyStaff record){
    	return companyStaffMapper.updateByPrimaryKey(record);
    }
    
}
