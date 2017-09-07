package cn.com.hd.service.company;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyInfo;
import cn.com.hd.domain.company.MemberCommodity;
import cn.com.hd.domain.company.MemberRecharge;
import cn.com.hd.persistance.company.CompanyInfoMapper;
import cn.com.hd.persistance.company.MemberCommodityMapper;

@Service("MemberCommodityService")
public class MemberCommodityService {
	@Autowired
	private MemberCommodityMapper MemberCommodityMapper;
	@Transactional
	public int deleteByPrimaryKey(Integer id){
		return MemberCommodityMapper.deleteByPrimaryKey(id);
	}
	@Transactional
	public int insert(MemberCommodity record){
    	return MemberCommodityMapper.insert(record);
    }
	@Transactional
	public int insertSelective(MemberCommodity record){
    	return MemberCommodityMapper.insertSelective(record);
    }

	public MemberCommodity selectByPrimaryKey(Integer id){
    	return MemberCommodityMapper.selectByPrimaryKey(id);
    }
	
	public MemberCommodity selectMemberCommodityByuserIdAndcommodityId(MemberCommodity record){
    	return MemberCommodityMapper.selectMemberCommodityByuserIdAndcommodityId(record);
    }
	
	@Transactional
	public int updateByPrimaryKeySelective(MemberCommodity record){
    	return MemberCommodityMapper.updateByPrimaryKeySelective(record);
    }
	@Transactional
	public int updateByPrimaryKey(MemberCommodity record){
    	return MemberCommodityMapper.updateByPrimaryKey(record);
    }
    
	public Page selectCompanyByPage(Page page){
		page.setData(MemberCommodityMapper.selectCompanyByPage(page));
    	return page;
    }
	
	public List<MemberCommodity>  selectMemberCommodityByuserIdAndcompanyId(MemberCommodity record){
		return(MemberCommodityMapper.selectMemberCommodityByuserIdAndcompanyId(record));
    }
	
	public int sumNumberByuserIdAndcompanyId(MemberCommodity record){
		return(MemberCommodityMapper.sumNumberByuserIdAndcompanyId(record));
    }
}
