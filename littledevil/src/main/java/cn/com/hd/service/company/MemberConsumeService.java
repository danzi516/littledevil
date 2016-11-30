package cn.com.hd.service.company;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyInfo;
import cn.com.hd.domain.company.MemberConsume;
import cn.com.hd.persistance.company.CompanyInfoMapper;
import cn.com.hd.persistance.company.MemberConsumeMapper;

@Service("memberConsumeService")
public class MemberConsumeService {
	@Autowired
	private MemberConsumeMapper memberConsumeMapper;
	@Transactional
	public int deleteByPrimaryKey(Integer id){
		return memberConsumeMapper.deleteByPrimaryKey(id);
	}
	@Transactional
	public int insert(MemberConsume record){
    	return memberConsumeMapper.insert(record);
    }
	@Transactional
	public int insertSelective(MemberConsume record){
    	return memberConsumeMapper.insertSelective(record);
    }

	public CompanyInfo selectByPrimaryKey(Integer id){
    	return memberConsumeMapper.selectByPrimaryKey(id);
    }
	@Transactional
	public int updateByPrimaryKeySelective(MemberConsume record){
    	return memberConsumeMapper.updateByPrimaryKeySelective(record);
    }
	@Transactional
	public int updateByPrimaryKey(MemberConsume record){
    	return memberConsumeMapper.updateByPrimaryKey(record);
    }
    
	public Page selectCompanyByPage(Page page){
		page.setData(memberConsumeMapper.selectCompanyByPage(page));
    	return page;
    }
}
