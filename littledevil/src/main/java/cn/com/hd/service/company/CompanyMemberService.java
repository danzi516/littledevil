package cn.com.hd.service.company;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyInfo;
import cn.com.hd.domain.company.CompanyMember;
import cn.com.hd.domain.uc.User;
import cn.com.hd.persistance.company.CompanyMemberMapper;


@Service("companyMemberService")
public class CompanyMemberService {
	
	@Autowired
	private CompanyMemberMapper companyMemberMapper;
	
	@Transactional
	public int deleteByPrimaryKey(Integer id){
		return companyMemberMapper.deleteByPrimaryKey(id);
	}
	
	@Transactional
	public int insert(CompanyMember record){
    	return companyMemberMapper.insert(record);
    }
	
	@Transactional
	public int insertSelective(CompanyMember record){
    	return companyMemberMapper.insertSelective(record);
    }
	
	public CompanyMember selectByPrimaryKey(Integer id){
    	return companyMemberMapper.selectByPrimaryKey(id);
    }
	
	@Transactional
	public int updateByPrimaryKeySelective(CompanyMember record){
    	return companyMemberMapper.updateByPrimaryKeySelective(record);
    }
	@Transactional
	public int updateByPrimaryKey(CompanyMember record){
    	return companyMemberMapper.updateByPrimaryKey(record);
    }

	public Page selectCompanyMemberByPage(Page page){
		page.setData(companyMemberMapper.selectCompanyMemberByPage(page));
    	return page;
    }
	
	public List<CompanyMember> selectCompanyMemberByuserId(int userId){
		return companyMemberMapper.selectCompanyMemberByuserId(userId);
    }
	
    public CompanyMember selectByCondition(CompanyMember record){
    	return companyMemberMapper.selectByCondition(record);
    }
    

	public CompanyMember selectCompanyMemberByuserIdAndcompanyId(CompanyMember record){
    	return companyMemberMapper.selectCompanyMemberByuserIdAndcompanyId(record);
    }
}
