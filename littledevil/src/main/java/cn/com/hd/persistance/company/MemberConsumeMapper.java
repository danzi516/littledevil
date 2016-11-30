package cn.com.hd.persistance.company;


import java.util.List;

import cn.com.hd.common.Page;
import cn.com.hd.domain.company.CompanyInfo;
import cn.com.hd.domain.company.MemberConsume;


public interface MemberConsumeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MemberConsume record);

    int insertSelective(MemberConsume record);

    CompanyInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MemberConsume record);

    int updateByPrimaryKey(MemberConsume record);
    
    List<MemberConsume> selectCompanyByPage(Page page);
}