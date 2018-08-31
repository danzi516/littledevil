package cn.com.hd.service.company;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.com.hd.common.Page;
import cn.com.hd.domain.company.MemberBillFlow;
import cn.com.hd.persistance.company.MemberBillFlowMapper;


@Service("memberBillFlowService")
public class MemberBillFlowService {
	@Autowired
	private MemberBillFlowMapper memberBillFlowMapper;
	@Transactional
	public int deleteByPrimaryKey(Integer id){
		return memberBillFlowMapper.deleteByPrimaryKey(id);
	}
	@Transactional
	public int insert(MemberBillFlow record){
    	return memberBillFlowMapper.insert(record);
    }
	@Transactional
	public int insertSelective(MemberBillFlow record){
    	return memberBillFlowMapper.insertSelective(record);
    }
	public MemberBillFlow selectByPrimaryKey(Integer id){
    	return memberBillFlowMapper.selectByPrimaryKey(id);
    }
	@Transactional
	public int updateByPrimaryKeySelective(MemberBillFlow record){
    	return memberBillFlowMapper.updateByPrimaryKeySelective(record);
    }
	@Transactional
	public int updateByPrimaryKey(MemberBillFlow record){
    	return memberBillFlowMapper.updateByPrimaryKey(record);
    }
	
	public Page selectByPage(Page page){
		page.setData(memberBillFlowMapper.selectByPage(page));
    	return page;
    }
	
	public List<MemberBillFlow> selectBySelective(MemberBillFlow record){
		List<MemberBillFlow> MemberBillFlowList = memberBillFlowMapper.selectBySelective(record);
    	return MemberBillFlowList;
    }
	
	public List<MemberBillFlow> selectAllList(){
		List<MemberBillFlow> MemberBillFlowList = memberBillFlowMapper.selectAllList();
    	return MemberBillFlowList;
    }
}
