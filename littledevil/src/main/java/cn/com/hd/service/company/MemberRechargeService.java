package cn.com.hd.service.company;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyInfo;
import cn.com.hd.domain.company.MemberRecharge;
import cn.com.hd.persistance.company.MemberRechargeMapper;

@Service("MemberRechargeService")
public class MemberRechargeService {
	@Autowired
	private MemberRechargeMapper memberRechargeMapper;
	@Transactional
	public int deleteByPrimaryKey(Integer id){
		return memberRechargeMapper.deleteByPrimaryKey(id);
	}
	@Transactional
	public int insert(MemberRecharge record){
    	return memberRechargeMapper.insert(record);
    }
	@Transactional
	public int insertSelective(MemberRecharge record){
    	return memberRechargeMapper.insertSelective(record);
    }

	public MemberRecharge selectByPrimaryKey(Integer id){
    	return memberRechargeMapper.selectByPrimaryKey(id);
    }
	@Transactional
	public int updateByPrimaryKeySelective(MemberRecharge record){
    	return memberRechargeMapper.updateByPrimaryKeySelective(record);
    }
	@Transactional
	public int updateByPrimaryKey(MemberRecharge record){
    	return memberRechargeMapper.updateByPrimaryKey(record);
    }
    
	public Page selectCompanyByPage(Page page){
		page.setData(memberRechargeMapper.selectCompanyByPage(page));
    	return page;
    }
}
