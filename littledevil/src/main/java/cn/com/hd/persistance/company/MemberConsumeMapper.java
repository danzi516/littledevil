package cn.com.hd.persistance.company;


import java.util.List;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.MemberConsume;
import cn.com.hd.domain.company.MemberRecharge;


public interface MemberConsumeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MemberConsume record);

    int insertSelective(MemberConsume record);

    MemberConsume selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MemberConsume record);

    int updateByPrimaryKey(MemberConsume record);
    
    List<MemberConsume> selectCompanyByPage(Page page);
    
    List<MemberConsume> selectMemberConsumeByuserIdAndcompanyId(MemberConsume record);
    
    int sumNumberByuserIdAndcompanyId(MemberConsume record);
}