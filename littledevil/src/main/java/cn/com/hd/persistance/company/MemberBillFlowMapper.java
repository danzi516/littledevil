package cn.com.hd.persistance.company;

import java.util.List;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.MemberBillFlow;


public interface MemberBillFlowMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(MemberBillFlow record);

    int insertSelective(MemberBillFlow record);

    MemberBillFlow selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MemberBillFlow record);

    int updateByPrimaryKey(MemberBillFlow record);
    
    List<MemberBillFlow> selectBySelective(MemberBillFlow record);
    
    List<MemberBillFlow> selectByPage(Page page);
    
    List<MemberBillFlow> selectAllList();
}